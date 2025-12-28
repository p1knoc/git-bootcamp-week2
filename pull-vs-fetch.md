# Pull vs Fetch: The Critical Difference

## git fetch
Downloads changes but doesn't modify your working directory.

```bash
git fetch origin

# What happens:
# 1. Downloads all changes from remote
# 2. Updates remote tracking branches (origin/main, etc.)
# 3. Your local branches remain unchanged
# 4. Safe - can't cause conflicts or break your work
```

### When to use fetch
- You want to see what teammates have done
- Before starting work (check for changes)
- When you're unsure about pulling
- To inspect changes before integrating

## git pull
Downloads changes AND merges them into your current branch.

```bash
git pull origin main

# Equivalent to:
git fetch origin
git merge origin/main
```

### When to use pull:
- You're ready to integrate remote changes
- Starting work day (sync with team)
- After confirming fetch looks good
- When you know merge will be clean

## Real-World Workflow

### Safe Approach (Recommeded for Learning)
```bash
# 1. Check what's new
git fetch origin

# 2. Compare your branch with remote
git log HEAD..origin/main --oneline

# 3. See actual differences
git diff HEAD origin/main

# 4. If looks good, merge
git merge origin/main
# OR use pull
git pull origin main
```

### Quick Approach (When Confident)
```bash
# Pull directly when you know it's safe
git pull origin main
```

## Pull Strategies

### Default: Merge
```bash
git pull origin main
# Creates merge commit if there are remote changes
```

### Rebase (Cleaner History)
```bash
git pull --rebase origin main
# Replays your commits on top of remote changes
# More advanced - learn in Week 3
```

## Handling Pull Conflicts

```bash
# Pull causes conflict
git pull origin main

# You'll see: "Automatic merge failed; fix conflicts"

# 1. Find conflicted files
git status

# 2. Resolve conflicts in editor
nano <conflicted-file>

# 3. Stage resolved files
git add <file>

# 4. Complete the merge
git commit
```

## Common Pull Errors

### Error 1: Uncommited Changes
```bash
# You have uncommited work, can't pull
git pull
# Error: "Please commit your changes or stash them"

# Solution: Commit or stash
git stash
git pull
git stash pop
```

### Error 2: Diverged Branches
```bash
# Your branch and remote have diverged
git pull
# You'll need to merge or rebase
```

## Professional Pull Practices
1. **Pull at start of work day**
2. **Pull before creating new branches**
3. **Pull before finishing your feature**
4. **Use fetch first if unsure**
5. **Never pull into dirty working directory**
6. **Configure pull strategy** (merge vs rebase)
