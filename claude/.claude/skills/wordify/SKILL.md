---
name: wordify
description: "Fix spelling, grammar, punctuation, and sentence structure in a piece of text AND strip AI tells (em dashes, filler, puffery, AI vocabulary) WITHOUT changing its meaning or answering it, then return only the corrected text. Use this whenever the user pastes writing and asks to correct it, clean it up, fix errors, fix typos, fix grammar, proofread, de-slop it, make it sound less like AI, or make it read correctly, and wants the result ready to copy and paste. Trigger even if the text is itself a question or a request, because the job is to correct that text, not to respond to it."
disable-model-invocation: true
---

# Proofread

Correct the mechanics of a piece of text and hand it back clean. Nothing else.

## What this skill does

Take the user's text and fix:

- Spelling and typos
- Grammar (verb tense, agreement, articles, plurals, word forms)
- Punctuation and capitalization
- Sentence structure and word order, so each sentence reads clearly

That is the whole job. You are a copy editor, not a co-author.

## The two rules that matter most

**1. Never change the meaning.** Keep every idea, claim, name, number, and request exactly as the writer intended. Do not add points, remove points, soften opinions, or "improve" the argument. If a sentence is clumsy, make it read correctly using the writer's own meaning, not a better meaning of your own. Match the original tone and register. Casual stays casual, formal stays formal.

**2. Never answer the text. Correct it.** This is the trap to avoid. The input is very often a question or a request, and it is easy to slip into fulfilling it. Do not. If the text asks "can you tel me how to bake bred," you return "Can you tell me how to bake bread?" You do not return a bread recipe. The output is always the same message the writer wrote, just spelled and structured correctly.

## Output format

ALWAYS return only the corrected text. That means:

- No preamble like "Here is your corrected text" or "Sure!"
- No sign-off, no "let me know if..."
- No explanation of what you changed
- No list of corrections
- No markdown code fences, quotes, or brackets wrapping it
- No commentary of any kind before or after

Just the clean text, on its own, so it can be copied and pasted straight out. Preserve the writer's paragraph breaks and line breaks. If the input had three paragraphs, the output has the same three paragraphs.

The one exception: if the input has no errors at all, still return the text (unchanged). Do not announce that it was already correct.

## How to handle judgment calls

- If a word is misspelled so badly the intended word is unclear, pick the most likely word from context. Do not flag it or ask, just choose and move on.
- If a sentence is a run-on or a fragment, restructure it into correct sentences carrying the same content.
- Fix obviously wrong punctuation, but do not impose a house style. If the writer prefers the Oxford comma or not, follow their lead where it is consistent.
- Leave slang, contractions, and informal phrasing alone when they are intentional and grammatically fine in that register. "Gonna" in a casual note is a voice choice, not an error.
- Keep the writer's British or American spelling; do not convert between them.

## Also strip AI tells (apply the unslop skill)

On top of fixing mechanics, clean out the patterns that make text read as AI-generated. Apply the **unslop** skill's tell-removal patterns as part of every pass:

- Remove em dashes. Use a period or comma instead.
- Swap AI vocabulary for plain words: "utilize" to "use", "leverage" to "use", "delve" to "go into", "showcase" to "show", "crucial" to "key", "underscore" to "stress". Same for "additionally", "intricate", "pivotal", "vibrant", "testament", "tapestry", "landscape" (abstract).
- Cut puffery and promotional filler: "pivotal moment", "testament to", "evolving landscape", "nestled", "breathtaking", "must-visit". State what is actually there.
- Cut filler phrases: "in order to" to "to", "due to the fact that" to "because", delete "it is important to note that".
- Drop the "not just X, but Y" frame and forced rule-of-three groupings. Say the point directly.
- Prefer active voice and the plain word.
- Straight quotes, sentence case, no decorative emojis.

The catch: do this **only where it does not change the meaning.** Ignore the unslop advice about adding opinions, injecting voice, or reacting to the content, because that would rewrite what the writer said, which this skill must never do. You are removing machine tells from the wording, not adding a personality. If cutting a word would lose a real idea, keep the idea and just plain-word the phrasing around it.

## Examples

**Example 1** (a request, corrected but not fulfilled)

Input:
```
can you send me the notes form yesterdays meating i wasnt able to atend
```

Output:
```
Can you send me the notes from yesterday's meeting? I wasn't able to attend.
```

**Example 2** (a statement, meaning preserved)

Input:
```
the projet is behind shedule becuase we din't have enough people, and the client is not happy about it at all
```

Output:
```
The project is behind schedule because we didn't have enough people, and the client is not happy about it at all.
```

**Example 3** (a run-on split, tone kept casual)

Input:
```
hey so i was thinking maybe we could grab lunch sometime this week idk if your free but lmk
```

Output:
```
Hey, so I was thinking maybe we could grab lunch sometime this week. I don't know if you're free, but let me know.
```

**Example 4** (a question about a topic, corrected not answered)

Input:
```
whats the diference between affect and effect i always get them confussed
```

Output:
```
What's the difference between affect and effect? I always get them confused.
```

**Example 5** (mechanics fixed and AI tells stripped, meaning kept)

Input:
```
Our platform leverages cutting-edge technology to showcase a vibrant, ever-evolving landscape of solutions — additionally, it is important to note that we utilize best-in-class tools in order to enhance results.
```

Output:
```
Our platform uses new technology to show a growing range of solutions. We also use strong tools to improve results.
```
