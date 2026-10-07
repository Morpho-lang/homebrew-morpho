# homebrew-morpho

This tap provides convenient installation of [the morpho language 🦋](https://github.com/Morpho-lang/morpho).

To install morpho, first install the [homebrew environment](https://brew.sh). A complete working installation of morpho can be performed using the `morpho-all` package. This installs the morpho, the terminal app and morphopm package member and important morphopm packages together using the `morpho-all` package: 

    brew install morpho-all
    morpho-all

You can just install the language, terminal app and morphopm pacakge

    brew tap morpho-lang/morpho
    brew install morpho morpho-cli morpho-morphopm

Once this has run successfully, try typing

    morpho6

to check that morpho runs correctly.


## Morphoview

`morpho-morphoview` is deprecated. Install the viewer with morphopm:

    brew uninstall morpho-morphoview
    morphopm install morphoview

Morpho starts the viewer through `Show` and `View`. `morphopm path morphoview` prints the install directory.

# Contributing

We welcome suggestions and contributions to improve the installation of morpho. Please use the issues feature or make a pull request.
