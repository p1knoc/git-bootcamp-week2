# Day 1 Learning Notes

## SSH Setup & Remote Repositories

### Major Achievements
- Generated secure SSH key pair
- Configured SSH for GitHub
- Connected via SSH successfully
- Created repository via GitHub CLI
- Pushed code using SSH

### SSH Key Generation
```bash
ssh-keygen -t ed25519 -C "email@example.com"
```

### Key Security Principles
1. Private key NEVER leaves your machine
2. Public key is safe to share
3. Use passphrase for added security
4. Different keys for different machines
5. Revoke keys when machine is lost

### SSH vs HTTPS
| Feature | SSH | HTTPS |
|---------|-----|-------|
| Authentication | Key-based | Token/Password |
| Convenience | No password prompts | Password each time |
| Security | More secure | Secure, but less convenient |
| Setup | More complex | Simple |
| Industry Use | Standard | Less common |

### GitHub CLI
The 'gh' command-line tool is incredibly powerful:
- Create repos without browser
- Manage issues and PRs
- Run Actions
- Professional automation

### Real-World Application
In companies:
- SSH is mandatory
- Multiple SSH keys (work, personal)
- SSH keys have expiration dates
- Security teams audit key usage
- Automated deployments use SSH

### Linux Skills Developed
- SSH key generation and management
- File permission management (chmod)
- SSH agent usage
- Config file editing
- Scripting for automation

### Confidence Level
SSH: 7/10 (now comfortable)
GitHub CLI: 6/10 (powerful tool, learning more)
Remotes: 8/10 (clear understanding)

### Next: Push, Pull, Fetch Operations
Ready to learn how to sync code with team!
