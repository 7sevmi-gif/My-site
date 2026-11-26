---
name: yt-script
description: Write a full script package for the faceless YouTube channel "Real Consequences" (@RealConsequences) — "What Happens If…" videos about money, law and real life for US viewers. Use when the user types /yt-script, asks for a new video idea, a script, a scenario, or "следующее видео". Argument: an optional topic; with none, pick a fresh one.
---

# /yt-script — "Real Consequences" video script

Channel: **Real Consequences** — faceless, English, US audience (high RPM). Format: "What Happens If…" about money, law, and real life. Brand: navy + red, 3D bold text, bright and dynamic (never grey and boring). Narrator voice: calm, confident, slightly dramatic (ElevenLabs "Alexander").

Talk to the user in **Russian**; write the script itself in **English**.

## 1. Pick the topic (if none was given)
- It must be **fresh**: not a topic already covered by many channels. Avoid "never pay your credit card"-type evergreen topics unless there's a new angle.
- Prefer a real hook: a recent viral story, a Reddit thread (r/legaladvice, r/personalfinance, r/AskReddit, r/tax), a news case, a weird law.
- Done topics (don't repeat): #1 Never pay your credit card; #2 Find millions in cash on the beach. Promised next: #3 Bank accidentally puts $1 million in your account.
- Offer 3 candidates in one line each with why it will click, pick the strongest, and continue (don't wait unless the user asked to choose).

## 2. Research facts
- Verify every legal/money claim with web search (statutes, real court cases, dollar thresholds, real penalties). Note the source per claim.
- Name real cases when possible (e.g. Cesarini v. US). Hedge viral stories ("a video like this went viral"). Never invent cases, numbers, or quotes.

## 3. Script structure (~3,000–3,500 characters ≈ 4 min)
10–12 scenes, each 2–5 sentences, short spoken lines:
1. **hook** (0–25s): a vivid concrete situation in the first sentence, a twist, then the title question. No "Hi guys", no channel intro.
2. Escalating consequence scenes — each one raises the stakes (police → bank → IRS → danger…). End most scenes with a mini cliffhanger ("But that's not the worst part.").
3. **verdict**: clear answer — what you should actually do.
4. **outro** (≤15s): one-line takeaway + tease the next video by title + "subscribe".

Style: second person ("you"), concrete numbers, time jumps ("Day 30… Day 90…"), no filler, no lecturing.

## 4. Output (save to the scratchpad as `epN/script.json` + show in chat)
For each scene give:
- `id`, `voiceover` text (English)
- `visuals`: 1–3 image prompts for nano-banana-pro (16:9, photorealistic, cinematic, consistent main character described identically every time; no text in images, no logos, no gore)
- `motion`: which image gets a 5s Kling image-to-video clip and the camera/action (simple, physically plausible movement — avoid hands handling small objects, avoid objects appearing/disappearing)
- `graphics`: on-screen 3D text / counters / lists for this scene (big numbers, stamps, checkmarks)

Then give the upload package:
- 3 title options (≤60 chars, curiosity + clarity) and 3 thumbnail concepts (2–4 big words, one emotion, one object)
- Description (2–3 sentences + chapters with timestamps placeholders + "Scenes are dramatized; this is not legal advice.")
- 10–15 tags, 3 Shorts cut ideas (which scenes, ≤50s each)
- Sources list

## 5. Quality rules (from the user — mandatory)
- Before generating any video, inspect every image carefully; regenerate anything wrong (extra fingers, wrong objects, text artifacts, inconsistent character).
- Generate video only from approved images.
- After generation, check the video frame by frame for glitches (objects popping, reversed actions, morphing) and redo bad clips.
- Make it interesting and bright — not boring and grey.
