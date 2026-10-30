# Orbit Tutor | guided AI literacy learning studio

A polished, **deployable web-based pilot** for children learning to use AI through guided, hands-on practice. Students need only a modern browser. They do **not** install an app, Node.js, or a plugin.

**Important:** This is an independent training sandbox, NOT the ChatGPT product or an OpenAI-affiliated service. It is a functioning pilot/MVP, **not** a fully operated public SaaS with payments, verified parental accounts, multi-user cloud data, or completed under-13 compliance.

## What is implemented and working

- ChatGPT-style, original-brand practice interface: chat composer, responses, chat history, copy, read aloud, start new chat, and prompt suggestions.
- Animated second blue tutor cursor that highlights controls without taking over the child's real mouse.
- Eight instructional states per lesson with guided narration (browser speech synthesis), tips, optional example prompts, and automatic step transitions.
- Four built-in lessons: first AI conversation, better prompts, follow-up requests, and verification/privacy.
- Student text checks against a teacher-defined rubric before sending; live responses never need AI screenshot monitoring.
- **Live OpenAI Responses API** integration via a server-side API key and classroom access code. AI replies are generated when the model is configured. Note: OpenAI billing is separate.
- Clearly labeled no-key practice mode with scripted sample replies.
- Student onboarding by nickname and grade (1–6), lesson completion tracking, chats, local persistence, parent progress report, export CSV/JSON.
- Parent-view demonstration protected by a **device-local PIN**, not suitable as a public child-account security boundary.
- Simple teacher curriculum builder with custom lessons, JSON import/export, and a checkable prompt rubric.
- Responsive browser experience for desktop/mobile, with desktop preferred for the cursor lesson.
- Lightweight Node server, rate limiting, request validation, server-only secrets, content security headers, OpenAI `store:false` requests, container and Render deployment manifests.

## Run locally (operator/developer only)

1. Install Node.js 20 or newer on the **operator's computer**.
2. Extract this folder, open terminal here and run `npm start`.
3. Open **http://localhost:3001**.
4. In practice mode you can complete the four sample lessons without an API key.

Windows users can double click `START-WINDOWS.cmd` after installing Node.js. Students don't need Node.js because they visit the hosted URL.

### Turn on real AI responses

Configure your **server environment**, not the browser:

```text
OPENAI_API_KEY=your_private_api_key
OPENAI_MODEL=gpt-6-luna
CLASSROOM_ACCESS_CODE=choose_a_long_private_random_code
PORT=3001
```

Windows PowerShell operator example:

```powershell
$env:OPENAI_API_KEY = "your_private_api_key"
$env:CLASSROOM_ACCESS_CODE = "a-long-private-classroom-code"
npm start
```

Mac/Linux operator example:

```bash
OPENAI_API_KEY=your_private_api_key CLASSROOM_ACCESS_CODE=a-long-private-classroom-code npm start
```

Visit the app → **Settings** → enter the classroom access code. The status changes to **Live AI configured**; individual chat submissions now use OpenAI API credits. The key stays server-side. Never put a private OpenAI API key into front-end code or a public GitHub repository.

For children, **do not activate live AI in a public classroom until age-appropriate safety, consent, privacy, retention and provider requirements are completed**. The sample live integration is initially intended for adult developer testing.

## Deploy so every student just clicks a link

### Option A: Render (recommended for a pilot)

1. Create a **private GitHub repository** with the files in this folder.
2. Sign in to Render and create a **Web Service** from the repository, or use the included `render.yaml` Blueprint.
3. Build command: `echo 'No build required'`; Start command: `npm start`.
4. Add the server environment variables `OPENAI_API_KEY`, `OPENAI_MODEL`, and `CLASSROOM_ACCESS_CODE` to Render's **secret environment settings**.
5. Deploy. Open the Render HTTPS URL. Give students only that URL plus the classroom code when appropriately authorized.

A server can also be hosted with Docker:

```bash
docker build -t orbit-tutor .
docker run --rm -p 3001:3001 \
  -e OPENAI_API_KEY=your_key \
  -e CLASSROOM_ACCESS_CODE=your_code orbit-tutor
```

**HTTPS is required for a real deployment.** Modern browsers require a secure context for some features, including cryptographic PIN handling and clipboard integration. Hosted services normally provide HTTPS.

### Option B: Install-free hosted sample, no OpenAI API key

Deploy the project without an OpenAI API key. Students can finish the lessons using sample scripted AI responses, and you will have **zero text-model API cost**. Do not present these scripted responses as live AI.

## Curriculum authoring

Open **Lesson builder** in the browser. Define a title, first sample prompt, comma-separated required phrases, example follow-up, and its required phrase. The child goes through the same eight-stage lesson process.

A custom lesson created in the builder lives in that browser only. Export it as JSON and import it on other devices, or edit `public/lessons.js` and redeploy to publish built-in lessons for all students. The builder is not yet a multi-user content management system.

Built-in lessons are in `public/lessons.js`. The guided cursor behavior is in `public/app.js` (`guideStages` and `positionCursor`). Page appearance is in `public/styles.css`. The API and server are in `server/index.js`.

## Teaching model

1. The educator specifies the task and success criteria.
2. The cursor demonstrates the next real control **inside the app you own**.
3. The student clicks or types with their own mouse and keyboard.
4. The lesson engine verifies known UI events and text requirements for **no extra AI credits**.
5. When a student sends a message, live mode invokes one API call. The child can read the result and practise a follow-up.
6. Completion is saved locally and the parent can export a report.

The visual cursor is not an autonomous computer-control agent. It cannot move inside a student's separate Chrome tab or desktop Photoshop/Blender. It points within the tutor's own controlled sandbox. The practice UI **recreates selected chat patterns**, rather than being the actual ChatGPT website.

## Security and deployment limitations

The following are **required before calling this a production-grade SaaS for children**:

- Verified parent/guardian identity, age-appropriate child access, and consent flows.
- Server-side authentication, individual permissions, tenant isolation and proper roles.
- Cloud database with row-level access controls, retention/deletion tools, and audit logs.
- Child safety evaluation, moderation and escalation procedures, abuse protection and human review.
- Provider approvals and data-handling arrangements necessary for users under 13, including applicable OpenAI requirements.
- Billing, plans, quotas, analytics, backups, monitoring, and error alerting.
- A legal/privacy review for applicable local jurisdictions; terms, privacy policy, incident response.
- Proper automated cross-browser, screen-reader/accessibility, penetration and load testing.

In the current pilot, chat history/progress are stored in the **student's browser localStorage**, not a cloud database. A parent's view on another device cannot see them. Clearing site data removes them. The parent PIN is only a convenience, not a security substitute. The classroom code is a shared access control, not an account system. The server's rate limiter is an in-memory pilot control, not distributed protection.

## Cost controls

The scripted lesson engine, cursor animation, rubric and local progress save do not make OpenAI API calls. Browser text-to-speech uses the device's voice system and has no external AI audio credit cost. With live mode, the server calls OpenAI only when a question is submitted, sends at most the last 12 chat messages, caps reply length, limits requests per IP, and doesn't store the API response on the server. Keep API usage limits on your OpenAI project as an additional safeguard.

## Troubleshooting

- `node is not recognized`: install Node.js on the developer/operator's computer.
- Practice replies appear instead of real AI: no `OPENAI_API_KEY` is set in the server's environment.
- `Invalid classroom access code`: enter your `CLASSROOM_ACCESS_CODE` under Settings in the web app.
- AI provider returned an error: check server logs and model access, key and billing; the UI shows an error and allows retry.
- Voice not playing: turn on voice in the tutor panel and allow your browser's speech support; some browsers have different installed voices.
- The tutor pointer isn't on the right control: turn the cursor off/on, return to the studio, or resize the browser. The guide only targets elements in its own sandbox.
- Student doesn't see progress on a different device: current pilot storage is local to each browser.

## Project files

```text
public/index.html      App entry point
public/styles.css      Full responsive UI style
public/lessons.js      Sample curricula and no-key practice replies
public/app.js          Tutor, chat, progress, parent and lesson builder
server/index.js        Server, private API, validation and static hosting
Dockerfile             Docker deployment
render.yaml            Render Web Service Blueprint
START-WINDOWS.cmd      Double-click local operator runner
START-MAC-LINUX.sh    Shell runner
.env.example           Environment variable examples
```

See `PRODUCT_BRIEF.md` for product positioning and roadmap, and `TEST_REPORT.md` for test results.
