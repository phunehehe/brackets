# brackets

"Structured text" as in, like JSON. Of course for JSON you can use the legendary
[`jq`](https://stedolan.github.io/jq/), but what about things that are not
really JSON? Use `brackets` :)

```
$ cat /nix/store/zzxgnl7n65dni529bcz5jnyfvb6l36iy-coreutils-8.23.drv
Derive([("out","/nix/store/bnlcsbw7nhd21vw4xssnxwi9y7h2asjj-coreutils-8.23","","")],[("/nix/store/6z2rs2khvcsnq4draxra6jizfd2ilgsb-coreutils-8.23.tar.xz.drv",["out"]),("/nix/store/84lcal4gvmznrl2yyik6jbimvrgpy1vs-perl-5.20.2.drv",["out"]),("/nix/store/8cymvwkm21qgxid71brsibvfcv42s6ri-acl-2.2.52.drv",["out"]),("/nix/store/dnizxawq0rp3jwfzl71y1sa9iynnmsmx-stdenv-linux-boot.drv",["out"]),("/nix/store/l886jfzszkkdw8b5q81f943sxf89gvra-gmp-5.1.3.drv",["out"]),("/nix/store/mk7dhr7325pkj7cavq8scww81md64qnx-bootstrap-tools.drv",["out"])],["/nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh"],"x86_64-linux","/nix/store/k0vqprjmxybr7clvfljk13zsdjwklcch-bootstrap-tools/bin/sh",["-e","/nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh"],[("NIX_LDFLAGS",""),("buildInputs",""),("builder","/nix/store/k0vqprjmxybr7clvfljk13zsdjwklcch-bootstrap-tools/bin/sh"),("doCheck","1"),("enableParallelBuilding",""),("makeFlags",""),("name","coreutils-8.23"),("nativeBuildInputs","/nix/store/aq5ilvzlqq3ndxp7q80s33z6mqi38y0y-perl-5.20.2 /nix/store/m9cc7hjn6pbv57708bh2yli7qd5vw2pk-gmp-5.1.3 /nix/store/jk37x39wbkban1yzxgxik0pdlgvp0c9p-acl-2.2.52"),("out","/nix/store/bnlcsbw7nhd21vw4xssnxwi9y7h2asjj-coreutils-8.23"),("postPatch","sed '2i echo Skipping dd sparse test && exit 0' -i ./tests/dd/sparse.sh\n"),("propagatedBuildInputs",""),("propagatedNativeBuildInputs",""),("src","/nix/store/0cijybc2m6n9g80phq584fb3sgdb3ldi-coreutils-8.23.tar.xz"),("stdenv","/nix/store/p8ghfy81bxzc4w01n3cc1vghfszylw49-stdenv-linux-boot"),("system","x86_64-linux")])

$ brackets < /nix/store/zzxgnl7n65dni529bcz5jnyfvb6l36iy-coreutils-8.23.drv

Derive
(
  [
    (
      "out","/nix/store/bnlcsbw7nhd21vw4xssnxwi9y7h2asjj-coreutils-8.23","",""
    )
  ]
  ,
  [
    (
      "/nix/store/6z2rs2khvcsnq4draxra6jizfd2ilgsb-coreutils-8.23.tar.xz.drv",
      [
        "out"
      ]
    )
    ,
    (
      "/nix/store/84lcal4gvmznrl2yyik6jbimvrgpy1vs-perl-5.20.2.drv",
      [
        "out"
      ]
    )
    ,
    (
      "/nix/store/8cymvwkm21qgxid71brsibvfcv42s6ri-acl-2.2.52.drv",
      [
        "out"
      ]
    )
    ,
    (
      "/nix/store/dnizxawq0rp3jwfzl71y1sa9iynnmsmx-stdenv-linux-boot.drv",
      [
        "out"
      ]
    )
    ,
    (
      "/nix/store/l886jfzszkkdw8b5q81f943sxf89gvra-gmp-5.1.3.drv",
      [
        "out"
      ]
    )
    ,
    (
      "/nix/store/mk7dhr7325pkj7cavq8scww81md64qnx-bootstrap-tools.drv",
      [
        "out"
      ]
    )
  ]
  ,
  [
    "/nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh"
  ]
  ,"x86_64-linux","/nix/store/k0vqprjmxybr7clvfljk13zsdjwklcch-bootstrap-tools/bin/sh",
  [
    "-e","/nix/store/9krlzvny65gdc8s7kpb6lkx8cd02c25b-default-builder.sh"
  ]
  ,
  [
    (
      "NIX_LDFLAGS",""
    )
    ,
    (
      "buildInputs",""
    )
    ,
    (
      "builder","/nix/store/k0vqprjmxybr7clvfljk13zsdjwklcch-bootstrap-tools/bin/sh"
    )
    ,
    (
      "doCheck","1"
    )
    ,
    (
      "enableParallelBuilding",""
    )
    ,
    (
      "makeFlags",""
    )
    ,
    (
      "name","coreutils-8.23"
    )
    ,
    (
      "nativeBuildInputs","/nix/store/aq5ilvzlqq3ndxp7q80s33z6mqi38y0y-perl-5.20.2 /nix/store/m9cc7hjn6pbv57708bh2yli7qd5vw2pk-gmp-5.1.3 /nix/store/jk37x39wbkban1yzxgxik0pdlgvp0c9p-acl-2.2.52"
    )
    ,
    (
      "out","/nix/store/bnlcsbw7nhd21vw4xssnxwi9y7h2asjj-coreutils-8.23"
    )
    ,
    (
      "postPatch","sed '2i echo Skipping dd sparse test && exit 0' -i ./tests/dd/sparse.sh\n"
    )
    ,
    (
      "propagatedBuildInputs",""
    )
    ,
    (
      "propagatedNativeBuildInputs",""
    )
    ,
    (
      "src","/nix/store/0cijybc2m6n9g80phq584fb3sgdb3ldi-coreutils-8.23.tar.xz"
    )
    ,
    (
      "stdenv","/nix/store/p8ghfy81bxzc4w01n3cc1vghfszylw49-stdenv-linux-boot"
    )
    ,
    (
      "system","x86_64-linux"
    )
  ]
)
```
