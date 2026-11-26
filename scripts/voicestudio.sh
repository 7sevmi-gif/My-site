#!/usr/bin/env bash
# Install (if needed) and start the local VoiceStudio backend on 127.0.0.1:3900.
# Usage: scripts/voicestudio.sh [start|stop|status|install]
# Safe to run repeatedly. Used by the SessionStart hook in .claude/settings.json.
set -euo pipefail

VS_DIR="${VOICESTUDIO_DIR:-/opt/voicestudio}"
VS_REF="${VOICESTUDIO_REF:-669ed5ef0da41036da7ed8f2f0b57b93aff733a6}"
VS_PORT="${OMNIVOICE_PORT:-3900}"
VS_OUT="${VOICESTUDIO_OUT:-$HOME/voicestudio-out}"
VS_LOG="${VOICESTUDIO_LOG:-$HOME/voicestudio.log}"
URL="http://127.0.0.1:${VS_PORT}"

healthy() { curl -fsS --max-time 2 "$URL/health" >/dev/null 2>&1; }
up() { curl -sS --max-time 2 "$URL/health" >/dev/null 2>&1; }

install() {
  if [ ! -d "$VS_DIR/.git" ]; then
    git clone --filter=blob:none https://github.com/debpalash/VoiceStudio.git "$VS_DIR"
    git -C "$VS_DIR" checkout --quiet "$VS_REF"
  fi
  if [ ! -x "$VS_DIR/.venv/bin/python" ]; then
    (cd "$VS_DIR" && uv sync --locked --no-dev --no-group cuda --group cpu)
  fi
}

start() {
  if up; then echo "VoiceStudio already running at $URL"; return 0; fi
  install
  mkdir -p "$VS_OUT"
  cd "$VS_DIR"
  OMNIVOICE_MCP_OUTPUT_MODE=files \
  OMNIVOICE_MCP_BASE_PATH="$VS_OUT" \
  OMNIVOICE_GENERATE_TIMEOUT_S="${OMNIVOICE_GENERATE_TIMEOUT_S:-1800}" \
  OMNIVOICE_CPU_GENERATE_TIMEOUT_S="${OMNIVOICE_CPU_GENERATE_TIMEOUT_S:-1800}" \
    nohup "$VS_DIR/.venv/bin/python" -m uvicorn backend.main:app \
      --host 127.0.0.1 --port "$VS_PORT" >>"$VS_LOG" 2>&1 &
  echo "VoiceStudio starting at $URL (log: $VS_LOG, output dir: $VS_OUT)"
  # The repo owner accepted the OmniVoice licence (CC-BY-NC: NON-COMMERCIAL use
  # only) on 2026-11-26. Containers are ephemeral, so re-record that choice.
  # Set VOICESTUDIO_ACCEPT_OMNIVOICE_LICENSE=0 to stop doing this.
  if [ "${VOICESTUDIO_ACCEPT_OMNIVOICE_LICENSE:-1}" = "1" ]; then
    ( for _ in $(seq 1 150); do healthy && break; sleep 2; done
      fp=$(curl -fsS "$URL/models/licenses/details/k2-fsa%2FOmniVoice" |
        python3 -c 'import json,sys;print(json.load(sys.stdin)["acceptance"]["fingerprint"])') &&
      curl -fsS "$URL/models/licenses/accept" -H 'Content-Type: application/json' \
        -d "{\"repo_id\":\"k2-fsa/OmniVoice\",\"fingerprint\":\"$fp\",\"accepted\":true}" >/dev/null &&
      echo "[voicestudio.sh] OmniVoice non-commercial licence accepted (owner decision 2026-11-26)" >>"$VS_LOG"
    ) >/dev/null 2>&1 &
  fi
}

case "${1:-start}" in
  install) install ;;
  start) start ;;
  stop) pkill -f "uvicorn backend.main:app" && echo stopped || echo "not running" ;;
  status) curl -sS --max-time 3 "$URL/health" || { echo "not running"; exit 3; } ;;
  *) echo "usage: $0 [start|stop|status|install]" >&2; exit 2 ;;
esac
