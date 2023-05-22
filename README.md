# Lemon's Arch Repo<br>[![GitHub Actions][actions-img]][actions-url] [![Patreon][patreon-img]][patreon-url] [![PayPal][paypal-img]][paypal-url] [![Discord][discord-img]][discord-url]

This is my little Arch Repo with all of the Arch Linux packages I work on. They are meant to work on Arch Linux, but they also work on other Arch forks and derivatives.

## Download

* [GitHub Releases](https://github.com/justalemon/Arch/releases)
* [GitHub Actions](https://github.com/justalemon/Arch/actions) (experimental versions)

## Installation

Add the following lines to your `/etc/pacman.conf`:

```ini
[lemon]
SigLevel = Optional DatabaseOptional
Server = https://github.com/justalemon/Arch/raw/master/$arch
```

## Usage

Just run `pacman -Syy`, then install any of the packages.

[actions-img]: https://img.shields.io/github/actions/workflow/status/justalemon/Arch/main.yml?branch=master&label=actions
[actions-url]: https://github.com/justalemon/Arch/actions
[patreon-img]: https://img.shields.io/badge/support-patreon-FF424D.svg
[patreon-url]: https://www.patreon.com/lemonchan
[paypal-img]: https://img.shields.io/badge/support-paypal-0079C1.svg
[paypal-url]: https://paypal.me/justalemon
[discord-img]: https://img.shields.io/badge/discord-join-7289DA.svg
[discord-url]: https://discord.gg/Cf6sspj
