#   GBMidi_MiSTer

A sound module for sending midi data to the sound hardware of a Game Boy (or multiple), utilizing gbc_snd from Gameboy_MiSTer by Tim Harbaum and Sorgelig, and using code from Input Tester by JimmyStones (see below)

It works with USB Midi keyboard/controllers natively, just press right on the OSD then select UART mode, Connection: MIDI, MidiLink: USB, then save.
For Midi Din, use any of the existing methods to plug Din into MiSTer, then choose Din under Midi Source (first option on the main OSD screen).
Or, you can use "Musical Gamepad" to play notes using the face buttons of a game controller. CAUTION: MIDI IS BYPASSED WHEN MUSICAL GAMEPAD IS ON!

By default, it dedicates a midi channel per voice, so midi channel 1 to pulse1, channel 2 to pulse2. As of now it only uses the pulse voice channels (more to come!)

In Auto-Polyphony mode, it utilizes 8 instances of the gbc_snd module to allow for 16 note polyphony, using only midi channel 1!

Some settings don't work with others, as indicated by settings being greyed out. Play with it to see what can be done. One note: Musical Gamepad does not work with auto-polyphony, but doesn't grey it out.

The "Patch" setting collects settings together into patches, which you can see reflected in the settings as you cycle between the patches.

This is in active development so expect to see more from it in the future! :)

If you like this and would to see it flourish, please consider joining my patreon. Your contribution can directly impact the time I can spend working on this and other projects rather than the "day job". :) https://www.patreon.com/user?u=6046340

## License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.


#	MiSTer Input Tester

## Acknowledgements

Created by JimmyStones (http://github.com/jimmystones), with thanks to:
- alanswx (https://github.com/alanswx) for ideas, cross-platform simulation support, and the tutorial this core was based on
- Jotego (https://github.com/jotego) for his very tidy JTFRAME modules
- Darrin Cardani for the quality YM music
- Porkchop Express (https://misteraddons.com/) for testing a bunch of devices I couldn't
- M. Walrus (@WalrusFPGA) for more testing
- Sorgelig (https://github.com/sorgelig) for testing, finding bugs and suggesting new features.  Oh, and the MiSTer project :)

## Hardware

The InputTest core is based on my Aznable 'custom hardware' project.  See the main repo for hardware and software details, build instruction, etc 
https://github.com/JimmyStones/Aznable 

## License
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
