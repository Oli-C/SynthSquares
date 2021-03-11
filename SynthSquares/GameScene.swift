//
//  GameScene.swift
//  SynthSquares


import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    private var motionManager : CMMotionManager!
    private var fmSquaresNode : SKNode!
    private var fmSquareArray : [FMSquare]!
    
    // Local varibles for FM square settings (from UI, for loading synth square in correctly)
    private var squareAttackSetting: Double!
    private var sqaureDecaySetting: Double!
    private var squareSustainSetting: Double!
    private var squareReleaseSetting: Double!
    private var squareModINdexSetting: Double!
    private var squareCarrierMultiplierSetting: Double!
    private var squareModMultiplierSetting: Double!
    private var squareOctaveSetting: Int!
    
    // Init the view controller to allow communication between
    // the game scene and the UI controller
    weak var viewController: GameViewController!
    
    // Init audio manager for all audiokit output, mixing etc.
    public var audioManager: AudioManager?
    
    // Method to initialise whole app/game sandbox
    override func didMove(to view: SKView) {
        
        self.scaleMode = .resizeFill
        self.physicsWorld.contactDelegate = self
        self.isUserInteractionEnabled = true
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        // Set-up Audiomanager
        audioManager = AudioManager()
        
        // Set-up motion manager
        motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.main) {
            (data, error) in
            self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!) * 5, dy: CGFloat((data?.acceleration.y)!) * 5)
        }
        
        fmSquaresNode = SKNode()
        self.addChild(fmSquaresNode) // Add all synth squares to one main node
        
        fmSquareArray = [FMSquare]() // Array to contain all square synths
        
        // Init square synth settings
        squareAttackSetting = 0.05
        sqaureDecaySetting = 0.30
        squareSustainSetting = 0.00
        squareReleaseSetting = 0.05
        squareModINdexSetting = 1.0
        squareCarrierMultiplierSetting = 0.5
        squareModMultiplierSetting = 0.5
        
        squareOctaveSetting = 2
        
        print("Scene Setup")
    }
    
    // Method is called when user touches the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchPos = touch.location(in: self)
        
        // Init square properties
        let newSquare = FMSquare()
        newSquare.position = touchPos
        newSquare.initPhysics()
        
        // Add synth square to array and connect audio output to mixer
        fmSquareArray.append(newSquare)
        fmSquaresNode.addChild(newSquare)
        audioManager?.nodeMixer.addInput(newSquare.fmSynth)
        
        // Make sure when synth square is added that it has the current set parameters from the UI
        newSquare.setAttack(value: squareAttackSetting)
        newSquare.setRelease(value: sqaureDecaySetting)
        newSquare.setSustain(value: squareSustainSetting)
        newSquare.setRelease(value: squareReleaseSetting)
        /*
        newSquare.setmodulationIndex(value: squareModINdexSetting)
        newSquare.setcarrierMultiplier(value: squareCarrierMultiplierSetting)
        newSquare.setmodulatingMultiplier(value: squareModMultiplierSetting)
        */
        newSquare.setOctave(value: squareOctaveSetting)
        
        // print("Square Added") // DEBUG for added square
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    // Collision detection method which detects a collision between two squares in the game scene
    func didBegin(_ contact: SKPhysicsContact) {
        let firstSquare = contact.bodyA.node!
        let secondSquare = contact.bodyB.node!
        
        if (firstSquare.name == "fmSquare" && secondSquare.name == "fmSquare") {
            
            // print("COLLISION") // DEBUG for collision
            
            if let square = firstSquare as? FMSquare {
                square.fillColor = .random
                square.triggerNote(keyInScale: Int(CGFloat.random(max: 5)))
            }
            if let square = secondSquare as? FMSquare {
                square.fillColor = .random
                square.triggerNote(keyInScale: Int(CGFloat.random(max: 5)))
            }
        }
    }
    
    // Method to remove all Synth Squares from the game scene
    public func clearSquares(){
        
        // Empty arrays and disconnect inputs to mixer
        fmSquareArray.removeAll()
        fmSquaresNode.removeAllChildren()
        audioManager?.nodeMixer.removeAllInputs()
        
    }
    
    // Method for changing synth properties for all synth squares
    public func changeSquareParamaters(SquareParameter : String, value : Double){
        
        if SquareParameter == "Attack" {
            squareAttackSetting = value
            for FMSquare in fmSquareArray{
                
                FMSquare.setAttack(value: value)
            }
            
        }
        
        if SquareParameter == "Decay" {
            sqaureDecaySetting = value
            for FMSquare in fmSquareArray{
                
                FMSquare.setDecay(value: value)
                
            }
            
        }
        if SquareParameter == "Sustain" {
            squareSustainSetting = value
            for FMSquare in fmSquareArray{
                
                FMSquare.setSustain(value: value)
                
            }
            
        }
        if SquareParameter == "Release" {
            squareReleaseSetting = value
            for FMSquare in fmSquareArray{
                
                FMSquare.setRelease(value: value)
            }
            
        }
        
        /*
        if SquareParameter == "Modulation Index" {
            squareModINdexSetting = value
            for FMSquare in fmSquareArray{
                FMSquare.setmodulationIndex(value: value)
                
            }
        }
        
        if SquareParameter == "Carrier Multiplier" {
            squareCarrierMultiplierSetting = value
            for FMSquare in fmSquareArray{
                FMSquare.setcarrierMultiplier(value: value)
                
            }
        }
        
        if SquareParameter == "Modulation Multiplier" {
            squareModMultiplierSetting = value
            for FMSquare in fmSquareArray{
                FMSquare.setmodulatingMultiplier(value: value)
                
            }
        }
 */
        
        if SquareParameter == "Octave" {
            squareOctaveSetting = Int(value)
            for FMSquare in fmSquareArray{
                FMSquare.setOctave(value: Int(value))
                
            }
        }
    }
    
    
}
