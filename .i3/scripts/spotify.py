#!/usr/bin/python
# Taken from https://github.com/firatakandere/i3blocks-spotify

import dbus
import os
try:
	bus = dbus.SessionBus()
	spotify = bus.get_object("org.mpris.MediaPlayer2.spotify", "/org/mpris/MediaPlayer2")
	spotify_iface = dbus.Interface(spotify, 'org.freedesktop.DBus.Properties')
	spotify_player_iface = dbus.Interface(spotify, 'org.mpris.MediaPlayer2.Player')
	
	playBackStatus = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')
	isPlaying = playBackStatus == 'Playing'
	
	buttonClicked = os.environ.get('BLOCK_BUTTON')
	if buttonClicked:
		if isPlaying:
			spotify_player_iface.Pause()
		else:	
			spotify_player_iface.Play()	
		isPlaying = not isPlaying

	props = spotify_iface.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
	artistAndTitle = str(props['xesam:artist'][0]) + " - " + str(props['xesam:title'])
	artistAndTitle = (artistAndTitle[:35] + '...') if len(artistAndTitle) > 38 else artistAndTitle
	
	color = "#81b71a" if isPlaying else "#dc322f"
	playbackIcon = u"\uf04b" if isPlaying else u"\uf04c"
	
	status = "  " + playbackIcon.encode('utf-8') + "  " + artistAndTitle
	print(status)
	print(status)
	print(color)
	
	exit
except dbus.exceptions.DBusException,e:
	exit



