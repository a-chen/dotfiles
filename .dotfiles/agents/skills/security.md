# Security Rules

- Never include secrets, API keys, tokens, or credentials in code or commits
- Never suggest hardcoding credentials; always use environment variables or a secrets manager
- Flag any code that concatenates user input into shell commands, SQL, or HTML without sanitization
- Do not commit .env files or any file that could contain secrets
- Prefer least-privilege: only request the permissions or scopes actually needed
