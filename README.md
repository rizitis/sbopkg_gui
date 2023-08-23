# sbopkg_gui
THIS is sbopkg_gui for SLACKWARE CURRENT ONLY (ponce repo) SBo-git

# NOTE
```
# sbopkg_gui is a graphical user interface for sbopkg,
# a package manager for Slackware Linux. http://gernot-walzl.at/index.php?nav=Slackware%2Fsbopkg_gui a creation of Gernot Walzl
# This is an patched version of sbopkg_gui (http://gernot-walzl.at/index.php?nav=Slackware%2Fsbopkg_gui) 
# This patched version is for Slackware current ONLY use supposed that your sbopkg repo is ponce (SBo-git)
```

# INSTALL
```
wget -c https://raw.githubusercontent.com/rizitis/sbopkg_gui/main/install_sbopkg_gui.sh
chmod +x install_sbopkg_gui.sh
```
as root execute script
```
./install_sbopkg_gui.sh
```
It will create a binnary package in /tmp
```
upgradepkg --install-new --reinstall /tmp/sbopkg_gui-current-x86_64-1_rtz.tgz
```

# REQUIRED
```
Full Slackware installation and sbopkg focuss to SBo-git
```
