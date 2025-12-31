# Pull Request Best Practices

## Creating Stella Pull Requests

### 1. Do Your Homework
- [ ] Check existing PRs (avoid duplicates)
- [ ] Read CONTRIBUTING.md
- [ ] Review code style guidelines
- [ ] Ensure tests pass locally
- [ ] Sync with latest main

### 2. Craft Perfect Commits
```bash
# Make atomic commits (one logical change per commit)
git commit -m "feat: Add login functionality"

## NOT like this
git commit -m "stuff", "fixes", "more changes"
```

### 3. Write Compelling Descriptions

#### Template
```markdown
## What 
Brief description of changes

## Why
Problem being solved or feature being added

## How
Technical approach (if complex)

## Testing
How you verified it works

## Screenshots
For UI changes

## Breaking Changes
If any, clearly noted

## Related Issues
Closes #123
```

#### Real Example
```markdown
## What
Adds password rest functionality via email

## Why
Users currently have no way to recover forgotten passwords (Issue #87)

## How
- Implemented token-based reset system
- Added email service integration
- Created reset password flow UI
- Added rate limiting to prevent abuse

## Testing
- Manual testing on all scenarios
- Add unit tests for token generation
- Added integration tests for email flow
- Tested rate limiting under load

## Security Considerations
- Tokens expire after 1 hour
- Tokens only be used once
- Rate limit: 3 requests per hour per email
- Tokens are cryptographically secure

## Related Issues
Closes #87
```
### 4. Keep PRs Manageable

**Size Guidelines**:
- Small: < 100 lines (ideal for quick review)
- Medium: 100-400 lines (standard)
- Large: > 400 lines (needs breaking up)

**How to Break Up Large PRs**:
```bash
# PR 1: Data model
git checkout -b feature/user-model
# ...implement model...
# Create PR 1

# PR 2: API endpoints (depends on PR 1)
git checkout -b feature/user-api
# ...implement API...
# Create PR 2

# PR 3: UI (depends on PR 2)
gti checkout -b feature/user-ui
# ...implement UI...
# Create PR 3
```

### 5. Respond to Review Feedback

**Good Response**:
```markdown
> Consider using Optional<User> instead of returning null

Good catch! Changed to Optional<User>. Commit: abc123f
```

**Even Better**:
```markdown
> Consider using Optional<User> instead of returning null

Great suggestion! I've:
1. Changed return type to Optional<User>
2. Update all callers
3. Added tests for empty case
4. Updated documentation

Commits: abc123f, def456a
```

**Don't Do This**:
```markdown
> Consider using Optional<User> instead of returning null

Ok
```
(Too brief, doesn't explain what you did)

### 6. PR Commit History

**Clean History (Preferred)**:
```
feat: Add user authentication system
tests: Add authentication tests
docs: Update README with auth info
```

**Messy History (Avoid)**:
```
add auth
fix typo
fix another typo
actually fix the thing
forgot to commit tests
oops
```

**How to Clean**:
```bash
# Interactive rebase before creating PR
git rebase -i HEAD~5

# Squash messy commits
# Reword unclear messages
# Reorder for logical flow
```

### 7. GitHub PR Etiquette

**Do:**
- Be respectful and professional
- Ask questions if feedback unclear
- Thank reviewers for their time
- Mark conversations as resolved
- Update PR if requirements change

**Don't:**
- Get defensive about feedback
- Argue extensively in PR comments
- Make unrelated changes
- Force push after review starts
- Leave reviewers waiting

### 8. Common PR Templates

#### Bug Fix PR
```markdown
## Bug Description
Clear description of the bug

## Root Cause
Why the bug occurred

## Solution
How you fixed it

## Testing
How you verified the fix

## Regression Risk
Low/Medium/High and why
```

#### Feature PR
```markdown
## Feature Description
What the feature does

## User Value
Why users need this

## Implementation
Key technical decisions

## Testing Coverage of new feature

## Documentation
What docs were added/updated
```

### 9. Advanced: Draft PRs

```bash
# Create draft PR for early feedback
gh pr create --draft --title "WIP: Add caching layer" --body "Early draft for feedback on approach.

Questions:
1. Should we use Redis or in-memory?
2. What should TTL be?
"
```

**Use Draft PRs For**:
- Getting early feedback
- Showing progress
- Discussing approach
- Breaking up large features

### 10. After PR Merges

```bash
# Update your local repo
git checkout main
git pull upstream main

# Delete feature branch locally
git branch -d feature/old-feature

# Delete remote branch
git push origin --delete feature/old-feature

# Celebrate!

## Real Company PR Review Stats
- Average review time: 24-48 hours
- Ideal PR size: 200-300 lines
- Reviews per PR: 2-3 developers
- Revision rounds: 1-2 on average
- Approval needed: 1-2 approvals

## Career Impact
Good PR practices show:
- Communication skills
- Attention to detail
- Team collaboration
- Professional maturity
- Code quality focus
