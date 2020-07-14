#!/bin/bash

sudo systemctl restart ofod

##Enable ofono phonesim modem for pulseaudio HFP connections
phonesim -p 12345 /usr/share/phonesim/default.xml&    
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:true
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Online" variant:boolean:true

##connect bluetooth device
bluetoothctl connect 58:85:E9:11:05:85

##set pulseaudio
pactl set-card-profile bluez_card.58_85_E9_11_05_85 headset_head_unit


