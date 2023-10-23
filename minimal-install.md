# minimal-install

[nixos wiki - installation guide](https://nixos.org/manual/nixos/stable/index.html#sec-installation-manual)

## fix keys

`sudo loadkeys dk`

## fix tiny font

`setfont ter-v32n`

## hetzner cloud

[nixos wiki - nixos on hetzner cloud](https://nixos.wiki/wiki/Install_NixOS_on_Hetzner_Cloud)

mount nixos from the ISO images tab

follow the [installation guide](https://nixos.org/manual/nixos/stable/index.html#sec-installation-manual)

if using x86, use MBR, otherwise use EFI

## home-manager

[src](https://nix-community.github.io/home-manager/index.html#sec-install-nixos-module)

to install home manager, run

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

sudo nix-channel --update
```
