# Handling Push Rejections

## The Scenario
You're working on a feature. Meanwhile, a teammate pushes to the same branch.
When you try to push, you get rejected.

## The Error Message
```
! [rejected]    main -> main (fetch first)
error: failed to push some refs to 'github.com:user/repo.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
```

## The Solution

### Step 1: Fetch to See What Changed
```bash
git fetch origin

# See what's different
git log HEAD..origin/main --oneline
```

### Step 2: Pull to Integrate Changes
```bash
git pull origin main

# If no conflicts: automatic merge
# If conflicts: resolve them
```

### Step 3: Push Your Combined Work
```bash
git push origin main
# Success!
```

## Advanced: Pull with Rebase
```bash
# Instead of merge, rebase your commits on top
git pull --rebase origin main

# This creates cleaner history (no merge commits)
# But more advanced - stick with regular pull for now
```

## Prevention Strategies
1. **Pull before starting work**
2. **Pull frequently during work**
3. **Push small, complete units**
4. **Communicate with team**
5. **Use feature branches** (reduces conflicts)

## Real-World Team Workflow
```bash
# Morning routine
git pull origin main

# Start feature
git checkout -b feature/my-feature

# Work, commit, work, commit

# Before finishing
git checkout main
git pull origin main
git checkout feature/my-feature
git merge main # Integrate latest changes

# If no conflicts
git checkout main
git merge feature/my-feature
git push origin main
```
