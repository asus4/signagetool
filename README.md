# > signagetool

A command line tools for OSX Digital Signage.

## Usage

```
# move mouse cursor
./signagetool mouse 1200 800

# click
./signagetool mouse 20 10 --click

# right click
./signagetool mouse 50 0 --rclick
```

## Build

Update submodule.

```
git submodule update --init
```

## Libraries

- [SwiftCLI](https://github.com/jakeheis/SwiftCLI) : MIT