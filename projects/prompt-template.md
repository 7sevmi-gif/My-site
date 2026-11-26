# Template: "expensive animation studio" video prompt

Distilled from the Higgsfield Prompt Pack Vol. 2 structure. Write prompts in
English (video models understand it best). One prompt = one scene of 10–15 s.

1. **Reference images first.** Generate each character and the location as a
   separate image in one shared style (GPT Image / Seedream), then attach them
   to the video model as `@image1`, `@image2`, ...
2. **STYLE block** (copy across every scene of a series so they match):
   - production level: "high-budget 3D animated feature film" / "high-budget 2D
     cinematic trailer animation, hand-drawn cel, crisp ink outlines";
   - what it is NOT: "no photoreal CGI, no plastic look, no motion-blur softness";
   - animation craft: anticipation, squash and stretch, overshoot, follow-through,
     smears, impact frames, hit-stop, "animated on 2s";
   - camera: "an invisible character moving through true 3D space, strong
     parallax, foreground occlusion";
   - palette: base colors + "X and Y as the only saturated accents";
   - mood: "A colliding with B"; aspect, duration, number of cuts.
3. **LEGEND**: `@image1 = NAME (short visual description)` for each reference,
   plus "maintain exact appearance from the reference images, no drift".
4. **Shots**, each with: camera (angle, lens, movement) → action with timing
   words (slowly, instantly, on 1s) → micro-acting (eyebrows, breath, small
   gestures) → effects (dust, mist, shockwave, light flare) → how it ends.
   Use "smash-cut", "cut on action" between shots.
5. **Final hero shot**: low angle, the winner posing, the world reacting.
6. **SOUND block**: "NO BACKGROUND MUSIC." then the soundscape in order,
   matched to every action (ambience → build-up → impact → silence → payoff).

Tips: one clear story per clip; concrete physical verbs; describe motion, not
the reference images; family-friendly instead of gore (bonk + sparkles).
