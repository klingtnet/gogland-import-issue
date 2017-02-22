# gogland-import-issue

This project should act as an example for the following import resolution issue [GO-3264](https://youtrack.jetbrains.com/issue/GO-3264#comment=27-1916217).
Gogland fails to find imports in a symlinked GOPATH.

## Setup

Call `s/bootstrap` (or `make`) and open the project in gogland with project `GOPATH` set to `/path/to/project/.go`.

```sh
$ s/bootstrap
Submodule path 'vendor/github.com/sirupsen/logrus': checked out '7f4b1adc791766938c29457bed0703fb9134421a'
linking "/tmp/gogland-import-issue" into local GOPATH: /tmp/gogland-import-issue/.go/src/github.com/klingtnet/gogland-import-issue
```

## Build

`$ make`

Expected output:

```sh
$ make
s/bootstrap
Submodule 'vendor/github.com/sirupsen/logrus' (https://github.com/sirupsen/logrus.git) registered for path 'vendor/github.com/sirupsen/logrus'
Cloning into '/tmp/gogland-import-issue/vendor/github.com/sirupsen/logrus'...
Submodule path 'vendor/github.com/sirupsen/logrus': checked out '7f4b1adc791766938c29457bed0703fb9134421a'
linking "/tmp/gogland-import-issue" into local GOPATH: /tmp/gogland-import-issue/.go/src/github.com/klingtnet/gogland-import-issue
GOPATH=/tmp/gogland-import-issue/.go go build -ldflags="-X main.Version=fba0269" github.com/klingtnet/gogland-import-issue
$ ./gogland-import-issue
WARN[0000] I am printing!

I am printing!
```
