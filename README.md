<div align="center">
  <h1>
    Developer Security Guide
  </h1>
  <p>
    Best practices development OS/Environment/Security guide.
  </p>
  <p>
    <a href="http://commitizen.github.io/cz-cli/"><img alt="Commitizen friendly" src="https://img.shields.io/badge/commitizen-friendly-brightgreen.svg"></a>
    <a href="https://github.com/aasaam/developer-security-guide/blob/master/LICENSE"><img alt="License" src="https://img.shields.io/github/license/aasaam/developer-security-guide"></a>
  </p>
</div>

## Instructions

Install **Ubuntu** and follow the [Ubuntu installation guide](./UBUNTU-INSTALLATION-GUIDE.md)

## Generate secrets and identity

Use script `generate.sh`. Do not use regular password using KeePassXC for store secret and just remember(Not write or tell anyone) one password.

```bash
./generate.sh 'Your Full Name' 'nickname' 'email@domain.tld'
```

### Notes

* Remember password of KeePassXC and don't write it any place or save it in any place on internet.
* Don't save password of KeePassXC database in any online places.
* Store KeePassXC database in multiple places, like your mail and online cloud storage. **Just database file not the password**
* Use Firefox account and generate password for each website using [Firefox feature](https://blog.mozilla.org/firefox/password-security-features/) to save and generate password for websites and store Firefox password in your KeePassXC database.
* Don't share your password with any one.
* You can always share your public key but never share your private key with any one.

<div>
  <p align="center">
    <img alt="aasaam software development group" width="64" src="https://raw.githubusercontent.com/aasaam/information/master/logo/aasaam.svg">
    <br />
    aasaam software development group
  </p>
</div>
