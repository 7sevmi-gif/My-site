# My-site

## VoiceStudio (local AI voice)

A local VoiceStudio backend (https://github.com/debpalash/VoiceStudio) is used
for text-to-speech, voice cloning/design and transcription.

- Start it at the beginning of a session: `scripts/voicestudio.sh start`
  (installs into `/opt/voicestudio`, CPU build, if missing; serves
  `http://127.0.0.1:3900`). Check with `scripts/voicestudio.sh status`;
  log in `~/voicestudio.log`. Wait until `/health` reports `"status":"ok"`.
- REST: OpenAI-compatible `/v1/audio/speech` and `/v1/audio/transcriptions`;
  full schema at `/openapi.json`. MCP endpoint: `http://127.0.0.1:3900/mcp/`.
  See `.claude/skills/voicestudio/SKILL.md`.
- Files go to `~/voicestudio-out`. The container is ephemeral: copy results the
  user wants to keep into the repo or send them to the user.
- No GPU: generation runs on CPU and is slow. The first generation in a fresh
  container downloads the OmniVoice model (~2.4 GB) from Hugging Face.

### Channel voices

Educational YouTube channel, calm and deep delivery, Russian. Voice profiles
live only in the ephemeral container, so recreate them each session with the
MCP tool `design_voice` (deterministic: same description = same voice), then
`generate_speech` with `language: "Russian"`, `speed: 0.92`.

| Candidate | `design_voice` description |
|---|---|
| 1. Male, low | `male, middle-aged, low pitch` |
| 2. Male, very low | `male, middle-aged, very low pitch` |
| 3. Female, mature, low | `female, middle-aged, low pitch` |
| 4. Female, young, low | `female, young adult, low pitch` |

Chosen voice: not picked yet (ask the owner).

### Licence (important)

The default OmniVoice model weights are **non-commercial** (CC-BY-NC + Higgs
Audio 2 + Meta Llama 3 terms). The owner accepted them on 2026-11-26 for a
YouTube channel that is **not monetized yet** (planned in ~6 months).
Before the channel is monetized, switch to a commercially licensed engine or
ElevenLabs, and remind the owner that videos already voiced with OmniVoice
would become commercial use once ads run on them.
