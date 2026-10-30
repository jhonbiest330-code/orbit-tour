# Testing notes | Orbit Tutor v1.0.0

## Checks completed

- Node syntax checks passed for server and client modules.
- HTTP `GET /` returned status 200 with HTML content and security headers.
- HTTP `GET /api/health` returned status 200 with explicit `demo` mode when no key was configured.
- All four built-in sample prompts passed their defined rubric checks.
- Headless Chromium UI checks passed (executed by injecting exact project CSS and JavaScript into an empty document because navigation to local HTTP/file URLs is blocked in the test environment):
  - Initial learner onboarding appeared.
  - Four course cards appeared.
  - Lesson detail opened and the lesson started.
  - The virtual cursor and highlighted target appeared.
  - The test clicked New chat, focused the prompt box, typed a valid prompt, and passed three criteria.
  - The practice assistant delivered a sample response.
  - The learner acknowledged the answer, entered a follow-up, received another response, and completed the lesson.
  - Four conversation messages were visible and the completion banner appeared.
  - Parent PIN entry form rendered.

## Testing limitations

- Real OpenAI responses could not be tested without a user-owned API key and billing configuration.
- Full navigation-based end-to-end testing in a public hostname is still required, along with QA on Windows, iOS, Android and macOS devices.
- Chromium's isolated empty-document test environment lacks secure-origin Web Crypto, so the parent PIN unlock flow could not be tested there. HTTPS/localhost deployment is required for Web Crypto.
- The browser-specific audio features require manual human testing.
- No formal child safety evaluation, security audit, accessibility audit, real hosting deployment, or penetration/load testing has been performed.
