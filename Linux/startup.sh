#!/bin/bash

#Enable ofono phonesim modem for pulseaudio HFP connections
phonesim -p 12345 /usr/share/phonesim/default.xml&    
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Powered" variant:boolean:true
dbus-send --print-reply --system --dest=org.ofono /phonesim org.ofono.Modem.SetProperty string:"Online" variant:boolean:true