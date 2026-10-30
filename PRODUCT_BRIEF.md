# Orbit Tutor | product overview

## Vision

Give young students an interactive, reassuring way to **learn how to use AI**, rather than just receive AI-generated answers. Instructors set the exact lesson sequence. Students watch an animated teaching cursor and practise the action themselves. The software checks their work and helps them improve one step at a time.

## Who it's for

- **Students**: grades/classes 1–6; independent activities must be age-appropriate and supervised as necessary.
- **Educators**: define a small, structured curriculum for selected tools instead of permitting unrestricted desktop automation.
- **Parents**: see learning milestones and help children develop sound judgement about AI.

## Sample student journey

**1. Open the link** → choose a nickname and class. **2. Choose a course** → select “Your first AI conversation.” **3. Watch a blue cursor** → the tutor highlights New chat. **4. Repeat the action** → the student clicks, types a clear prompt, and follows a three-part checklist. **5. Send** → a model response appears in live mode, or a labeled sample appears in practice mode. **6. Reflect** → the tutor asks the student to read it and think. **7. Follow up** → the student requests an improved answer. **8. Celebrate** → learning progress is recorded and can be exported.

## Included lessons

1. Your first AI conversation
2. Make your prompts powerful
3. Learn to ask follow-ups
4. Be a smart AI detective

Teachers can create and share additional curated lesson definitions. The foundation is deliberately scoped to a **controlled learning sandbox**, not full computer control.

## How it keeps AI costs low

Most interactions are ordinary frontend logic. Showing a cursor, moving through guided screens, running a prompt rubric and saving progress do not require a model. OpenAI is called only on actual submitted questions in live mode. The spoken tutor directions are free browser TTS when available.

## Product readiness checklist

- **Implemented**: functional browser pilot, scripted courses, real API option, responsive UI, chat history, local parent summary, JSON lesson builder, deployment manifests, basic server hardening.
- **Operator setup required**: deployment provider, HTTPS domain, privately stored OpenAI API key and classroom code, API billing limits.
- **Not implemented**: production parent sign-in, school organizations, multi-device cloud sync, commercial subscriptions, verified child consent, moderation/evaluations, formal compliance review, dedicated observability, production resilience testing.

## Suggested next milestone

Deploy to a **private adult-run pilot** and run 10–15 supervised sessions. Measure prompt completion, confusion points, and whether learners can repeat actions without cursor hints. After validating the teaching loop, implement parent-controlled accounts and cloud storage before inviting large cohorts of children.
