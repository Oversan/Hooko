Hooko
=====

Hooko it is a script for add pre-commit git hook for use csscomb and fixmyjs.

[csscomb](https://github.com/csscomb/csscomb.js) - css/scss/sass/less coding style formatter. <br />
[fixmyjs](https://github.com/jshint/fixmyjs) - tool for automatically fix your JavaScript lint errors in a non-destructive way  <br />
csscomb and fixmyjs require that NodeJs was installed.

Pre-commit hook is working from command line. In future pre-commit should be integrated with gui tools like [Gitx](http://rowanj.github.io/gitx/)

####To install Hooko:
Script should be executed in root of your application

Via curl:
```bash
curl -S https://raw.githubusercontent.com/Oversan/Hooko/master/hooko.sh | bash
```

Via wget:
```bash
wget https://raw.githubusercontent.com/Oversan/Hooko/master/hooko.sh -O - | bash
```

####To uninstall Hooko:

Via curl:
```bash
curl -S https://raw.githubusercontent.com/Oversan/Hooko/master/hooko-uninstall.sh | bash
```
Via wget:
```bash
wget https://raw.githubusercontent.com/Oversan/Hooko/master/hooko-uninstall.sh -O - | bash
```
