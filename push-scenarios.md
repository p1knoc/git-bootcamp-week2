# Push Operation Scenarios

## Scenario 1: First Push of New Branch
When you create a branch locally and want to share it:
```bash
git checkout -b feature/new-feature
# ...make changes...
git push -u origin feature/new-feature
```

The `-u` flag sets upstream tracking so you can later just use `git push`

## Scenario 2: Push After Local Commits
```bash
# Make several local commits
git commit -m "Change 1"
git commit -m "Change 2"
git commit -m "Change 3"

# Push all at once
git push
```

## Scenario 3: Push Rejection (Remote Ahead)
```bash
# You try to push
git push

# Error: "Updates were rejected because the remote contains work..."
# Solution: Pull first, then push
git pull origin main
git push origin main
```

## Scenario 4: Push Different Branch
```bash
# Push feature branch while on main
git push origin feature/branch-name

# Push local branch to different remote branch name
git push origin local-branch:remote-branch
```

## Scenario 5: Delete Remote Branch
```bash
# Delete branch on GitHub
git push origin --delete feature/old-branch
```

## Professional Push Practices
1. **Pull before you push** (avoid conflicts)
2. **Use meaningful branch names**
3. **Push frequently** (multiple times per day)
4. **Never force push to main/shared branches**
5. **Use --force-with-lease** if force push is necessary
6. **Push tags separately** when releasing
