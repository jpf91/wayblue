#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

#systemctl disable gdm
systemctl enable sway-kiosk.service

useradd -ms /bin/bash kiosk

#systemctl -M kiosk@ --user enable chromium-kiosk.service
#systemctl -M kiosk@ --user enable squeekboard.service
sudo -u kiosk mkdir -p /home/kiosk/.config/systemd/user/graphical-session.target.wants/
sudo ln -s /etc/systemd/user/chromium-kiosk.service /home/kiosk/.config/systemd/user/graphical-session.target.wants/chromium-kiosk.service
sudo ln -s /etc/systemd/user/squeekboard.service /home/kiosk/.config/systemd/user/graphical-session.target.wants/squeekboard.service
sudo -u kiosk mkdir -p /home/kiosk/.config/sway/
sudo -u kiosk cp /etc/sway/config.kiosk /home/kiosk/.config/sway/config