# mpris-switcher
Scripts switch between players using MPRIS D-bus specification. Made as workaround for distros using Gnome in order to use mediakeys regardless of their default priority.

# How to use
The scripts require the commands python (associated to Python 3), zenity and dbus-send.

**Place all the files in the same directory.**

The script to switch players is:

$sh mpris_switch.sh

which will prompt a Zenity form listing all the available players.

The commands to control the selected player are:

$sh mpris_controler.sh PlayPause

$sh mpris_controler.sh Next

$sh mpris_controler.sh Previous

$sh mpris_controler.sh Stop

You can create a [key binding](https://wiki.archlinux.org/index.php/Keyboard_shortcuts#Customization) to trigger the scripts. For example, mapping multimedia keys such as XF86AudioPlay, XF86AudioStop, XF86AudioPrev and XF86AudioNext, or using modifiers to [create keyboard shortcuts](https://docs.fedoraproject.org/en-US/quick-docs/proc_setting-key-shortcut/) (e.g. Alt+Stop, or Alt+Fn+Right in some laptops).

# Disclaimer
These scripts where made for personal use and aren't tested in more machines than mine. All files must be in the same directory to work.
