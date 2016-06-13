# new_os_install
Contains scripts to run each time you (re)install a Debian-flavor Linux.

Overview
========
This script downloads/clones and installs a small pile of utilities and
configurations that I like installed on my Linux devices.


Installation
------------
1. Download this package from github (cannot use git clone yet).
2. cd into the root of the folder; `cd new_os_install`
3. Run *post_os_reinstall.sh* as root; `sudo ./post_os_reinstall.sh`


Installed Modules
-----------------
*Listed in order of installation.*

### apt-get update and upgrade
Update and upgrade the OS first.

### git
For installing colorschemes and coding.

### VIM
Installs VIM, because VIM is awesome.

### gdebi
Gdebi is a tool like dpkg, but it installs dependencies automatically instead
of prompting for them. Great when installing Steam!

### Enable EXFAT
Exfat is a filesystem that works with multiple OS', nice to have in a
multi-architecture household.

### Gnome Session Flashback
Enable Gnome classic desktop.

### Alacarte Menu Manager
Use this to mess with your menu entries and categories.

### 'Hack' Font
Looks sharp and easy on the eyes.

### [Atom.io](https://atom.io/)
Runs wget and downloads the .deb file to your downloads, then uses gdebi to
install it. This editor is a great replacement for gedit and is very 
configurable.

### [Gnome Solarized Colorscheme](https://github.com/Anthony25/gnome-terminal-colors-solarized)
[Solarized](http://ethanschoonover.com/solarized) is an amazing colorscheme
that's easy on the eyes in both light and dark configurations.

### [Solarized Colorscheme for Vim](https://github.com/altercation/vim-colors-solarized)
Solarized, but for VIM.

### .vimrc
Copies my .vimrc configuration into the correct location.

### .bashrc
Appends my .bashrc to the end of the .bashrc in existence.
