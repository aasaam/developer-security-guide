# developer security guide

[![aasaam](https://flat.badgen.net/badge/aasaam/software%20development%20group/0277bd?labelColor=000000&icon=https%3A%2F%2Fcdn.jsdelivr.net%2Fgh%2Faasaam%2Finformation%2Flogo%2Faasaam.svg)](https://github.com/aasaam)

[![Commitizen friendly](https://flat.badgen.net/badge/commitizen/friendly/green)](http://commitizen.github.io/cz-cli/)

[![open-issues](https://flat.badgen.net/github/open-issues/aasaam/developer-security-guide)](https://github.com/aasaam/developer-security-guide/issues)
[![open-pull-requests](https://flat.badgen.net/github/open-prs/aasaam/developer-security-guide)](https://github.com/aasaam/developer-security-guide/pulls)
[![license](https://flat.badgen.net/github/license/aasaam/developer-security-guide)](./LICENSE)

Use following approach for get best practices to store **ssh**, **gpg**, **git** and etc.

Remember one password and store all of your password/paraphrase and use random secure password using [KeePassXC](https://keepassxc.org/).

## Requirement

Install **Ubuntu** and use **KeePassXC**

```shell
sudo apt install keepassxc
```

If you are developer and using git try to use [Commitizen](http://commitizen.github.io/cz-cli/)

```bash
sudo npm install -g commitizen
```

## Notes

* Remember password of KeePassXC and don't write it any place or save it in any place on internet.
* Don't save password of KeePassXC database in any online places.
* Store KeePassXC database in multiple places, like your mail and online cloud storage. **Just database file not the password**
* Use FireFox account and generate password for each website using [firefox feature](https://blog.mozilla.org/firefox/password-security-features/) to save and generate password for websites and store FireFox password in your KeePassXC database.
* Don't share your password with any one.
* You can always share your public key but never share your private key with any one.
