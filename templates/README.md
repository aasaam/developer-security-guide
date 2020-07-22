# $INFRASTRUCTURE_NAME Developer Security Guide

Hello dear **$CLIENT_NAME __($CLIENT_USER)__**.

## Requirement

Install following applications
\`\`\`
sudo apt install openssh-client gnupg2 git keepassxc
\`\`\`

Also install nodejs.

### Git convention

Use **commitizen** for conventional git.

\`\`\`
sudo npm install -g commitizen
\`\`\`

During commit use \`git add .\` and \`git-cz\` for commit wizard.

### Your ssh public keys

ED25519: **Recommended**

\`\`\`txt
$SSH_ED25519_PUB
\`\`\`

RSA: **For legacy support**

\`\`\`txt
$SSH_RSA_PUB
\`\`\`

### Your gpg public key

\`\`\`txt
$PGP_PUBLIC_KEY
\`\`\`

## Change ssh passphrase

\`\`\`bash
ssh-keygen -p -f .ssh/id_rsa
ssh-keygen -p -f .ssh/id_ed25519
\`\`\`

## Change gpg passphrase

\`\`\`bash
gpg --edit-key $PGP_KEY_ID
\`\`\`

Then inside gpg cli type, it will ask old password and you can type new password.

\`\`\`txt
> passwd
\`\`\`

After done
\`\`\`txt
> quit
\`\`\`
