###Git shortcut to automate the commit and push commands

Sometimes executing basic git commands is very boring and repetitive so, this shortcut will help you a lot. It will run these commands in this sequence:

- `git status`
- `git commit -S -am"YOUR_MESSAGE_COMMIT"`
- `git push origin YOUR_CURRENT_BRANCH`

**The Script**

```bash
#!/bin/bash

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
COMMIT_MESSAGE=$1

echo -e "$(tput setaf 2)** Executing Status command$(tput sgr0)"
git status

echo -e "$(tput setaf 2)\n** Executing commit command$(tput sgr0)\n"
git commit -S -am"$COMMIT_MESSAGE"

echo -e "$(tput setaf 2)\n** Executing push command$(tput sgr0)\n\n"
git push origin $CURRENT_BRANCH
```

**How to install:**

Run this command line:

```bash
$ gem install git-pc
```

**Usage:**

Access some git repository and now you just run:

```bash
git pc 'Message Commit'
```