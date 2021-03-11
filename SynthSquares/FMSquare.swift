//
//  fmSquare.swift
//  SynthSquares
//

import Foundation
import SpriteKit
import AudioKit

class FMSquare: SKShapeNode {
    
    open var fmSynth = Synth()
    let squareSize = CGSize(width: 20, height: 20)
    
    private var SynthVelocity = MIDIVelocity(64) // Default synth velocity
    public var octave: Int!
    
    private var attackDuration: Double!
    private var decayDuration: Double!
    private var sustainLevel: Double!
    private var releaseLevel: Double!
    
    override init() {
        super.init()
        
        self.path = CGPath(roundedRect: CGRect(origin: .zero, size: squareSize), cornerWidth: 1, cornerHeight: 1, transform: nil)
        
        
        self.glowWidth = 1
        self.isAntialiased = true
        self.lineWidth = 2
        self.fillColor = UIColor.black
        self.name = "fmSquare"
        
        // AudioKit version 5 not really used
        
        // AudioKit 5 Ramp (Old from Oscillator Bank)
        // fmSynth.$amplitude.ramp(to: 0.9, duration: 0.2)
    
        
        self.initPhysics()
    }
    
    
    // Method to play note, currenty only plays C Major Pentatonic and will include more scales and keys in the future
    public func triggerNote(keyInScale: Int){
        
        // Octave 1
        if octave == 1{
        if keyInScale == 0{
            fmSynth.play(noteNumber: MIDINoteNumber(48), velocity: SynthVelocity) // C
        }
        if keyInScale == 1{
            
            fmSynth.play(noteNumber: MIDINoteNumber(50), velocity: SynthVelocity) // D
        }
        if keyInScale == 2{
            
            fmSynth.play(noteNumber: MIDINoteNumber(52), velocity: SynthVelocity) // E
        }
        
        if keyInScale == 3{
            
            fmSynth.play(noteNumber: MIDINoteNumber(55), velocity: SynthVelocity) // G
        }
        if keyInScale == 4{
            
            fmSynth.play(noteNumber: MIDINoteNumber(57), velocity: SynthVelocity) // A
        }
        if keyInScale == 5{
            
            fmSynth.play(noteNumber: MIDINoteNumber(60), velocity: SynthVelocity) // C
        }
        }
        
        // Octave 2
        if octave == 2{
        if keyInScale == 0{
            fmSynth.play(noteNumber: MIDINoteNumber(60), velocity: SynthVelocity) // C
        }
        if keyInScale == 1{
            
            fmSynth.play(noteNumber: MIDINoteNumber(62), velocity: SynthVelocity) // D
        }
        if keyInScale == 2{
            
            fmSynth.play(noteNumber: MIDINoteNumber(64), velocity: SynthVelocity) // E
        }
        
        if keyInScale == 3{
            
            fmSynth.play(noteNumber: MIDINoteNumber(67), velocity: SynthVelocity) // G
        }
        if keyInScale == 4{
            
            fmSynth.play(noteNumber: MIDINoteNumber(69), velocity: SynthVelocity) // A
        }
        if keyInScale == 5{
            
            fmSynth.play(noteNumber: MIDINoteNumber(72), velocity: SynthVelocity) // C
        }
        }
        
        // Octave 3
        if octave == 3{
        if keyInScale == 0{
            fmSynth.play(noteNumber: MIDINoteNumber(72), velocity: SynthVelocity) // C
        }
        if keyInScale == 1{
            
            fmSynth.play(noteNumber: MIDINoteNumber(74), velocity: SynthVelocity) // D
        }
        if keyInScale == 2{
            
            fmSynth.play(noteNumber: MIDINoteNumber(76), velocity: SynthVelocity) // E
        }
        
        if keyInScale == 3{
            
            fmSynth.play(noteNumber: MIDINoteNumber(79), velocity: SynthVelocity) // G
        }
        if keyInScale == 4{
            
            fmSynth.play(noteNumber: MIDINoteNumber(81), velocity: SynthVelocity) // A
        }
        if keyInScale == 5{
            
            fmSynth.play(noteNumber: MIDINoteNumber(84), velocity: SynthVelocity) // C
        }
        }
        
        // Octave 4
        if octave == 4{
               if keyInScale == 0{
                   fmSynth.play(noteNumber: MIDINoteNumber(84), velocity: SynthVelocity) // C
               }
               if keyInScale == 1{
                   
                   fmSynth.play(noteNumber: MIDINoteNumber(86), velocity: SynthVelocity) // D
               }
               if keyInScale == 2{
                   
                   fmSynth.play(noteNumber: MIDINoteNumber(88), velocity: SynthVelocity) // E
               }
               
               if keyInScale == 3{
                   
                   fmSynth.play(noteNumber: MIDINoteNumber(91), velocity: SynthVelocity) // G
               }
               if keyInScale == 4{
                   
                   fmSynth.play(noteNumber: MIDINoteNumber(93), velocity: SynthVelocity) // A
               }
               if keyInScale == 5{
                   
                   fmSynth.play(noteNumber: MIDINoteNumber(96), velocity: SynthVelocity) // C
               }
               }
        
    }
    
    public func stopNote(){
        for i in 0...127{
            fmSynth.stop(noteNumber: MIDINoteNumber(i))
        }
    }
    
    public func initPhysics() {
        self.physicsBody = SKPhysicsBody(rectangleOf: squareSize)
        
        self.physicsBody?.usesPreciseCollisionDetection = true
        self.physicsBody?.affectedByGravity = true
        self.physicsBody?.allowsRotation = true
        
        self.physicsBody?.pinned = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.mass = 1000
        
        self.physicsBody?.restitution = 0.5
        
        self.physicsBody?.friction = 0.5
        
        self.physicsBody?.categoryBitMask = 1
        self.physicsBody?.collisionBitMask = 1
        self.physicsBody?.contactTestBitMask = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setAttack(value: Double){
        
        fmSynth.attackDuration = AUValue(value)
    }
    
    public func setDecay(value: Double){
        
        fmSynth.decayDuration = AUValue(value)
    }
    
    
    public func setSustain(value: Double){
        
        fmSynth.sustainLevel = AUValue(value)
    }
    
    public func setRelease(value: Double){
        
        fmSynth.releaseDuration = AUValue(value)
    }
    
    /*
    public func setmodulationIndex(value: Double){
        
        fmSynth.modulationIndex = AUValue(value)
    }
    
    public func setcarrierMultiplier(value: Double){
        
        fmSynth.carrierMultiplier = AUValue(value)
    }
    
    public func setmodulatingMultiplier(value: Double){
        
        fmSynth.modulatingMultiplier = AUValue(value)
    }
 */
    
    public func getOctave() -> Int{
        return octave
    }
    
    public func setOctave(value: Int){
        octave = value
    }
    
}
