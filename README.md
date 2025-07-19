# Dotfiles

## Prerequisites

- [Git](https://git-scm.com)

## Setup

```bash
curl --fail --silent --location --show-error https://codeberg.org/abhisheksingh0x558/dot/raw/branch/main/install | bash
```

## Post-setup

1. Generate SSH keys

```bash
ssh-generate
```

2. Generate GPG keys

```bash
gpg-generate
```

3. Update remote URL for dotfile repository

```bash
chezmoi git remote set-url origin git@codeberg.org:abhisheksingh0x558/dot.git
```

4. Install Nix

```bash
nix-init
```
