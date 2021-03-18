# SynthSquares

Video
-------------------------------

<a href="http://www.youtube.com/watch?feature=player_embedded&v=qAm2TFkrlPo
" target="_blank"><img src="http://img.youtube.com/vi/qAm2TFkrlPo/0.jpg" 
alt="Synth Squares Demo" width="640" height="360" border="10" /></a>

App Information
-------------------------------

App Name 		 : Synth Squares

Subtitle 		 : Collide Sound Like Never Before

App Description  : 

With Synth Squares you can crash synthesisers together! Allowing an ensemble of collision sonification in an environment you control. Create interesting, delicate, ambient or chaotic soundscapes with no limits. Download and play now, completely free, with no in-app purchases. 

Synth squares is currently optimised and only available for iPhone X, Xs & Pro but will be coming to iPad and other devices very soon.

In the next version, I plan on adding -

 - A new effects menu, with options for other effects: Flanger, Phaser, Chorus, Stereo manipulation, Advanced Filters...just to name a few.
 - Different types of Synth Squares using exciting synthesis techniques (Amplitude modulation, Wavetable synthesis, Additive synthesis, Subtractive synthesis and even some classical instruments).
 - Control what keyboard notes can be played by the squares.
 - Complete iOS support for all iPad and iPhone.
 - Greater user control of Squares, grab, throw, change properties (mass, elasticity) and alter environment conditions such as gravity and other fields.
 - More game modes such as Tutorial and Education mode where the user will be guided through synthesis techniques and controlling the user interface.


Primary Category : Music

Copyright	: Copyright  of Synth Squares LTD. (University of York - Y3589110)

App Rating       : 4+ (no objectionable material)

Keywords         : Music,Synthesiser,Square,Sound,Gravity,Collision,Create,Play,Timbre,Harmonics,Frequency,Modulation.

SKU Number       : SynthSquares160120

Pricing          : Free

Available Date   : 16th January 2020

Territories      : All

Build
-------

The app was built on XCode Version 11.3 (11C29), macOS Mojave 10.14.6. The app is mostly designed for iPhone X, Xs & 11 Pro display sizes. It is fully working when tested on iOS 13.3 on an iPhone Xs. However, it also works for many other devices in simulation such as iPad 9.7, Air and Pro series. The UI is a bit messy on iPad, but works, but will be fixed for future versions.

Known Bugs
-----------

One main bug is audio cutting out and I believe this to be an AKOscillator glitch. After a note has been played it has to be reset and the note has to be 'stopped'. It is fixed in the App currently by removing and adding squares again and I'm sure can be fixed in future versions. Current functionality is fairly acceptable.

Another is clipping audio, I believe it's due to overloading the Node Mixer which mixes all the synth squares together.

AudioKit
-----------

This app uses AudioKit for sound generation. Available here: https://github.com/AudioKit/AudioKit.
