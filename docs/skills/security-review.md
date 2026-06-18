---
name: security-review
description: Security vulnerability checklist for code review
category: verification
platforms: [claude, antigravity, cursor]
---

# Security Review

Systematic security review checklist for code changes.

## When to Use

- Before merging any code that handles auth, payments, or sensitive data
- When adding new endpoints or external integrations
- During phase completion reviews
- When the `code-reviewer` agent delegates a security concern

## Review Checklist

### Authentication & Authorization
- [ ] Auth middleware applied to all protected routes
- [ ] Token validation uses secure algorithms (RS256, not HS256 with weak secrets)
- [ ] Tokens have reasonable expiration times
- [ ] Role-based access control enforced at the service layer
- [ ] No auth bypass paths (all routes explicitly public or protected)

### Input Handling
- [ ] All user inputs validated and sanitized
- [ ] SQL injection prevented (parameterized queries, ORM usage)
- [ ] XSS prevented (output encoding, CSP headers)
- [ ] File upload restrictions (type, size, content validation)
- [ ] Rate limiting on sensitive endpoints (login, registration, password reset)

### Data Protection
- [ ] Passwords hashed with bcrypt/argon2 (never MD5/SHA)
- [ ] Sensitive data excluded from API responses
- [ ] PII not logged (emails, names, addresses, payment info)
- [ ] Database connections use TLS
- [ ] Secrets stored in environment variables, not code

### Dependencies
- [ ] No known vulnerabilities (`npm audit` / `pip audit` clean)
- [ ] Dependencies pinned to exact versions
- [ ] No unnecessary dependencies added

### Infrastructure
- [ ] CORS configured restrictively (specific origins, not `*`)
- [ ] HTTPS enforced in production
- [ ] Security headers set (HSTS, X-Content-Type-Options, X-Frame-Options)
- [ ] Error responses don't leak stack traces or internal details in production
