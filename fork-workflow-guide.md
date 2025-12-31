# Fork Workflow Complete Guide

## What is a Fork?
A fork is your personal copy of someone's else repository on GitHub. You have full control over your fork but can propose changes back to the original via Pull Requests.

## Fork vs Clone

### Clone
- Downloads repository to your computer
- Links to original repository
- Can push if you have permissions
- Use for: Your own repos, team repos

### Fork
- Creates YOUR copy on GitHub
- Then you clone YOUR fork
- You can always push (it's yours)
- Use for: Contributing to other's projects

## The Complete Fork Workflow

### Step 1: Fork on GitHub
1. Go to repository you want to contribute to
2. Click "Fork" button
3. Choose your account
4. Wait for the fork to complete

### Step 2: Clone Your Fork
```bash
# Clone YOUR fork (not the original!)
git clone git@github.com:YOUR-USERNAME/repo-name.git
cd repo-name
```

### Step 3: Add Upstream Remote
```bash
# Add original repo as 'upstream'
git remote add updstream git@github.com:ORIGINAL-OWNER/repo.git

# Verify remotes
gti remote -v
# You should see:
# origin -> your fork
# upstream -> original repo
```

### Step 4: Create Feature Branch
```bash
# ALWAYS branch from latest upstream
git fetch upstream
git checkout -b feature/myh-improvement upstream/main
```

### Step 5: Make Changes
```bash
# Code, code, code...
git add .
git commit -m "Add feature: description"
```

### Step 6: Push to Your Fork
```bash
git push -u origin feature/my-improvement
```

### Step 7: Create Pull Request
1. Go to YOUR fork on GitHub
2. CLock "Compare & pull reqeust" button
3. Write description (see PR template below)
4. Click "Create pull request"
5. Wait for review!

## Keeping Fork Updated

### Sync with Original Repository
```bash
# Fetch latest from original
git fetch upstream

# Switch to your main
git checkout main

# Merge upstream changes
git merge upstream/main

# Push to your fork
git push origin main
```

### Update Feature Branch with Latest Changes
```bash
# On your feature branch
git fetch upstream
git merge upstream/main

# Or rebase (more advanced)
git rebase upstream/main
```

## Multiple Remotes Visualization
┌─────────────────┐
│  Original Repo  │  <- upstream
│  (can't push)   │
└────────┬────────┘
         │ Fork
         ↓
┌─────────────────┐
│   Your Fork     │  <- origin
│  (can push)     │
└────────┬────────┘
         │ Clone
         ↓
┌─────────────────┐
│  Local Machine  │
│ (your computer) │
└─────────────────┘

## Real-World Fork Scenarios

### Scenario: Contributing to Open Source
```bash
# 1. Fork react/react on GitHub
# 2. Clone your fork
git clone git@github.com:yourname/react.git
cd react

# 3. Add upstream
git remote add upstream git@github.com:facebook/react.git

# 4. Create branch
git checkout -b fix/typo-in-docs

# 5. Make fix
# ...edit files...

# 6. Commit and push
git commit -m "docs:fix typo in tutorial"
git push origin fix/typo-in-docs

# 7. Create PR on GitHub
```

### Scenario: Fork vs Branch (When to Use Each)

**Use Branches When:**
- You have write access
- Working with team
- Internal project
- Your own repository

**Use Forks When:**
- Contributing to external projects
- Don't have write access
- Open source contributions
- Learnign from others' code

## Professional Fork Practices
1. **Keep fork synced** with upstream
2. **Branch from upstream/main**, not origin/main
3. **One feature per PR**
4. **Descriptive branch names**
5. **Test before creating PR**
6. **Respond promptly to review feedback**
