# problem statement
pushes a git repo via https transport

# example usage

> note: in examples, VERSION represents a version of the git.push-https pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/git.push-https#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/git.push-https#VERSION
```

## compose

```yaml
op:
   pkg: { ref: github.com/opspec-pkgs/git.push-https#VERSION }
   inputs:
      srcRepo:
      username:
      password:
      # begin optional args
      dstRepo:
      refSpec:
      # end optional args
```
