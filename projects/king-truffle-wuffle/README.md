# King Truffle Wuffle vs. the Manananggal

Short cartoon clip in the style of the "GPT Image + Seedance" reel: three
reference images in one shared style, then one Seedance 2.5 video that uses
them as references, then a Russian voiceover from VoiceStudio.

ElevenLabs flow: `ogs9kf5WBn0CVGKW8eIV` ("Король Трюфель-Вуфель против Мананангал").

## Characters (Philippine folklore)

- **King Truffle Wuffle** (Король Трюфель-Вуфель): the warlike king of the
  Duwendes (дувенде, mushroom gnomes). Replaces "The Hunter".
- **The Dreaded Manananggal** (Мананангал): the flying vampire witch whose upper
  body separates from her legs. Replaces "The Raptor". Kept family-friendly:
  purple mist instead of entrails, no gore.
- **The Jungle**: a clearing in the Duwende kingdom with giant mushrooms.

## Shared style block (append to every image prompt)

> Style: stylized 3D-animated cartoon movie look, painterly concept art, rough
> visible brushwork, deep green jungle light, warm earthy colors, soft
> volumetric light, family-friendly, no text.

## Step 1: image prompts (model `gpt-image-2.5-sunburst`)

**@king**: Character concept art: KING TRUFFLE WUFFLE, the warlike king of the
Duwendes (mushroom gnomes from Philippine folklore). A small, stout, cartoon
mushroom-gnome with a big round dark truffle cap as his head-top, bushy grey
beard, fierce proud eyes, a tiny golden crown tilted on the cap, a cape of moss
and leaves, bark armor, holding a small sword made from a sharpened twig.
Heroic victorious pose, full body, standing on a root in the jungle.

**@manananggal**: Character concept art: THE DREADED MANANANGGAL, the vampire
witch of Philippine folklore, as a cartoon villain. A pale-violet skinned woman
with long wild black hair, glowing orange eyes, sharp fangs and a long thin
tongue, huge leathery bat wings; her body ends at the waist and she flies with
only her upper half, trailing harmless glowing purple mist instead of a lower
body. Menacing but funny, hovering in the air, full figure. (no gore)

**@jungle**: Environment concept art: an empty clearing in a Philippine jungle
at dusk, the kingdom of the Duwendes. Giant twisted trees with buttress roots,
hanging vines, ferns, huge glowing mushrooms of different sizes, a few tiny
mushroom houses with round doors among the roots, a muddy path through the
middle, fireflies, misty background. No characters. Wide shot.

## Step 2: video prompt (model `bytedance-seedance-v2.5`, refs @king, @manananggal, @jungle)

One continuous action per clip (Seedance drifts on multi-beat stories):

> Wide cinematic shot in the jungle clearing from @jungle. The Manananggal from
> @manananggal swoops down from the dark trees, wings spread, screeching. King
> Truffle Wuffle from @king leaps from a giant mushroom, swings his twig sword
> and bonks her on the head; she bursts into a harmless puff of purple mist and
> sparkles. The king lands and raises his sword in triumph as tiny mushroom
> gnomes cheer from the roots. Maintain exact appearance from reference images,
> consistent characters, no deformation. Cartoon, painterly, family-friendly.

## Step 3: sound

Owner decision: **no voiceover, sound effects only**. Seedance generates the
audio itself (`generate_audio` on): wing flaps, screech, sword bonk, magical
poof, tiny gnomes cheering, jungle ambience. No speech, no music.

## Status

- 2026-11-26: first image attempt failed, ElevenLabs free generations busy
  (nothing charged). Retry step 1.
