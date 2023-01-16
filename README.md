# Gentoo HP Pavillion-15-ec1xxx
This repository contains all of my configuration files and dotfiles. This REAME also contains a list of links to other interesting dotfile and config repositories.

Note: [fetch.sh](/fetch.sh) is a script that downloads programs that I need such as cliphist and grimshot from their upstream.

## Lid Config
Both [/etc/elogind/logind.conf](/etc/elogind/logind.conf) and [/etc/acpid/default.sh](/etc/acpid/default.sh) are configured in such a way that if you close the lid. The computer will switch to tty2 and suspend, and then switch back to tty1 as soon as you get out of suspend. This is to prevent dwl misbehaving when it comes to suspention.

## See also
### Dotfiles
* https://git.jonathanh.co.uk/jab2870/Dotfiles/

### Configs
* https://github.com/elacheche/gentoo-asus-ux410uar

### Useful Resources
I personally prefer sticking to just the suckless tools and/or their wayland alternatives.
* [dmenu scripts](https://tools.suckless.org/dmenu/scripts/)
* [clamiax scripts](https://github.com/clamiax/scripts)
* [dwl wiki: Migrating from X](https://github.com/djpohly/dwl/wiki#migrating-from-x)
