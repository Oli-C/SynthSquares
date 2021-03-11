//
//  AudioManager.swift
//  SynthSquares
//
//  Class for main audio manager and effects.

import Foundation
import AudioKit

class AudioManager {
    
    var nodeMixer: Mixer! // Mixer for all synth squares
    var master: Mixer!    // Mixer for adding effects
    
    var reverb: Reverb!
    var delay: Delay!
    var lowPassFilter: LowPassFilter!
    
    var limiter: PeakLimiter!
    
    var chorus: Chorus!
    var flanger: Flanger!
    
    init() {
        
        // Each FM node is mixed together in an AKMixer object
        nodeMixer = Mixer()
        
        // Delay is init
        delay = Delay(nodeMixer)
        delay.feedback = 0.3
        delay.time = 0.5
        delay.dryWetMix = 0.5
        
        // Reverb is init
        reverb = Reverb(nodeMixer)
        reverb.dryWetMix = 0.2
        reverb.loadFactoryPreset(.plate)
        
        // Effects are mixed together
        master = Mixer(delay, reverb)
        
        // Low pass is init
        lowPassFilter = LowPassFilter(master)
        lowPassFilter.cutoffFrequency = 12000
        lowPassFilter.resonance = 0.2
        
        // Limiter to catch any distortion
        limiter = PeakLimiter(lowPassFilter, attackTime: 0.0, decayTime: 0.1, preGain: 0.0)
        
        // Set the audio output and start AudioKit for output
        let engine = AudioEngine()
        engine.output = limiter
        
        do {
              try    engine.start()
          } catch {
            print("could not start sound engine")
                engine.stop()
              return
          }
    }

    // Method to connect sprite kit node (synth square) to the mixer (Now removed V5)
    /*
    public func addInput(input: Node) {
        
        nodeMixer.addInput(Node)
    }

    
    
    // Method to disconnect input from mixer
    public func removeInput(input: Node){
        
        nodeMixer.removeInput(Node)
    }
     */
    
    // Method called when any audio effect UI setting is changed
    func changeAudioSetting(audioSetting : String, value : Double) {
        
        // Change reverb dry/wet
        if audioSetting == "Reverb Mix" {
            reverb.dryWetMix = AUValue(value)
        }
        
        // Change Reverb type
        else if audioSetting == "Reverb Type" {
            
            if value == 0.0{
                reverb.loadFactoryPreset(.mediumRoom)
            }
            
            if value == 1.0{
                reverb.loadFactoryPreset(.largeHall)
            }
            
            if value == 2.0{
                reverb.loadFactoryPreset(.plate)
            }
            
            if value == 3.0{
                reverb.loadFactoryPreset(.cathedral)
            }
            
        }
        else if audioSetting == "Delay Mix" {
            delay.dryWetMix = AUValue(value)
        }
        else if audioSetting == "Delay Time" {
            delay.time = AUValue(value)
        }
        else if audioSetting == "Delay Feedback" {
            delay.feedback = AUValue(value)
        }
        else if audioSetting == "Low Pass" {
            lowPassFilter.cutoffFrequency = AUValue(value)
        }
    }
}
