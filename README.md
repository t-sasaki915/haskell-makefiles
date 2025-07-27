# haskell-makefiles
Collection of Makefiles that automate the setup of Haskell environments

## `ghc/javascript-unknown-ghcjs-ghc/Makefile`
This Makefile installs `javascript-unknown-ghcjs-ghc` to your system.
### Usage
```bash
# Clone or download this repository, run `cd ghc/javascript-unknown-ghcjs-ghc` and
make
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/ghc/javascript-unknown-ghcjs-ghc/Makefile)
```
If you want to specify which GHC version to install:
```bash
# Clone or download this repository, run `cd ghc/javascript-unknown-ghcjs-ghc` and
make GHC_VERSION=??? EMSDK_VERSION=???
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/ghc/javascript-unknown-ghcjs-ghc/Makefile) GHC_VERSION=??? EMSDK_VERSION=???
```

## `utils/ghcup/Makefile`
This Makefile installs a minimal `ghcup` to your system.
### Usage
```bash
# Clone or download this repository, run `cd utils/ghcup` and
make
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/utils/ghcup/Makefile)
```

## `utils/haskell-tools/Makefile`
This Makefile installs `cabal`, `stack` and `haskell-language-server` to your system.
### Usage
```bash
# Clone or download this repository, run `cd utils/haskell-tools` and
make
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/utils/haskell-tools/Makefile)
```
If you want to install only `cabal`:
```bash
# Clone or download this repository, run `cd utils/haskell-tools` and
make ONLY_CABAL=1
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/utils/haskell-tools/Makefile) ONLY_CABAL=1
```
If you want to specify tool versions:
```bash
# Clone or download this repository, run `cd utils/haskell-tools` and
make CABAL_VERSION=??? STACK_VERSION=??? HLS_VERSION=???
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/utils/haskell-tools/Makefile) CABAL_VERSION=??? STACK_VERSION=??? HLS_VERSION=???
```

## `utils/ghc-dependencies`
This Makefile installs GHC dependencies to your system. Makefiles below run this Makefile automatically.
- `javascript-unknown-ghcjs-ghc/Makefile`
### Usage
```bash
# Clone or download this repository, run `cd utils/ghc-dependencies` and
make
```
```bash
make -f <(curl https://t-sasaki.net/hs-makefiles/latest/utils/ghc-dependencies/Makefile)
```
