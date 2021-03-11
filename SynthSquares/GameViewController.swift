//
//  GameViewController.swift
//  SynthSquares
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var gameScene: GameScene!
    
    
    // Info Button
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var infoText: UITextView!
    @IBOutlet weak var addSquareInfo: UILabel!
    
    // Settings button
    @IBOutlet weak var settingsButton: UIButton!
    
    
    /*                 Synth Square Parameters UI                    */
    
    @IBOutlet weak var synthSquareParametersLabel: UILabel!
    
    // Remove Squares Button
    @IBOutlet weak var removeAllButton: UIButton!
    
    // Envelope UI
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var decayLabel: UILabel!
    @IBOutlet weak var sustainLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var decaySlider: UISlider!
    @IBOutlet weak var sustainSlider: UISlider!
    @IBOutlet weak var releaseSlider: UISlider!
    
    // Mod and Carrier UI
    @IBOutlet weak var modulationIndexLabel: UILabel!
    @IBOutlet weak var modulationIndexSlider: UISlider!
    @IBOutlet weak var modulationMultiplierLabel: UILabel!
    @IBOutlet weak var modulationMultiplierSlider: UISlider!
    @IBOutlet weak var carrierMultiplierLabel: UILabel!
    @IBOutlet weak var carrierMultiplierSlider: UISlider!
    
    // Octave Band Selector
    @IBOutlet weak var octaveBandLabel: UILabel!
    @IBOutlet weak var octaveSelector: UISegmentedControl!
    
    /*                 EFFECTS UI                    */
    
    @IBOutlet weak var effectsLabel: UILabel!
    
    // Delay UI
    @IBOutlet weak var delayMixLabel: UILabel!
    @IBOutlet weak var delayMixSlider: UISlider!
    @IBOutlet weak var delayTimeLabel: UILabel!
    @IBOutlet weak var delayTimeSlider: UISlider!
    @IBOutlet weak var delayFeedbackLabel: UILabel!
    @IBOutlet weak var delayFeedbackSlider: UISlider!
    
    // Reverb UI
    @IBOutlet weak var reverbMixLabel: UILabel!
    @IBOutlet weak var reverbMixSlider: UISlider!
    @IBOutlet weak var reverbSelector: UISegmentedControl!
    
    // Low Pass UI
    @IBOutlet weak var lowPassLabel: UILabel!
    @IBOutlet weak var lowPassSlider: UISlider!
    
    // Init method for all UI and gameScene
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                
                // Present the scene
                view.presentScene(scene)
                
                gameScene = scene as? GameScene
                gameScene.viewController = self
                
                
            }
            
            // Fade out "tap here to add a square" label
            fadeTextInThenOut(view: addSquareInfo, delay: 6.0)
            
            // Init UI Octave segment control with correct starting octave band
            octaveSelector.selectedSegmentIndex = 1
            
            // Debug Tools
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }
    
    @IBAction func showInfo(_ sender: AnyObject){
        
        if infoText.isHidden == true{
            
            infoText.isHidden = false
            
            synthSquareParametersLabel.isHidden = true
            effectsLabel.isHidden = true
            
            removeAllButton.isHidden = true
            
            delayTimeSlider.isHidden = true
            delayTimeLabel.isHidden = true
            delayMixLabel.isHidden = true
            delayMixSlider.isHidden = true
            delayFeedbackLabel.isHidden = true
            delayFeedbackSlider.isHidden = true
            
            attackLabel.isHidden = true
            decayLabel.isHidden = true
            sustainLabel.isHidden = true
            releaseLabel.isHidden = true
            attackSlider.isHidden = true
            decaySlider.isHidden = true
            sustainSlider.isHidden = true
            releaseSlider.isHidden = true
            
            reverbMixLabel.isHidden = true
            reverbMixSlider.isHidden = true
            reverbSelector.isHidden = true
            
            lowPassLabel.isHidden = true
            lowPassSlider.isHidden = true
            
            modulationIndexLabel.isHidden = true
            modulationIndexSlider.isHidden = true
            modulationMultiplierLabel.isHidden = true
            modulationMultiplierSlider.isHidden = true
            carrierMultiplierLabel.isHidden = true
            carrierMultiplierSlider.isHidden = true
            
            octaveBandLabel.isHidden = true
            octaveSelector.isHidden = true
            
            settingsButton.setTitle("Settings", for: UIControl.State.normal)
            
        }else{
            infoText.isHidden = true
            settingsButton.setTitle("Settings", for: UIControl.State.normal)
        }
        
    }
    
    // Shows/hides the menu options when Menu button is pressed
    @IBAction func showSettings(_ sender: AnyObject!) {
        
        // Show UI when "Settings" button is pressed
        if synthSquareParametersLabel.isHidden == true {
            
            infoText.isHidden = true
            
            synthSquareParametersLabel.isHidden = false
            effectsLabel.isHidden = false
            
            removeAllButton.isHidden = false
            
            delayTimeSlider.isHidden = false
            delayTimeLabel.isHidden = false
            delayMixLabel.isHidden = false
            delayMixSlider.isHidden = false
            delayFeedbackLabel.isHidden = false
            delayFeedbackSlider.isHidden = false
            
            attackLabel.isHidden = false
            decayLabel.isHidden = false
            sustainLabel.isHidden = false
            releaseLabel.isHidden = false
            attackSlider.isHidden = false
            decaySlider.isHidden = false
            sustainSlider.isHidden = false
            releaseSlider.isHidden = false
            
            reverbMixLabel.isHidden = false
            reverbMixSlider.isHidden = false
            reverbSelector.isHidden = false
            
            lowPassLabel.isHidden = false
            lowPassSlider.isHidden = false
            
            modulationIndexLabel.isHidden = false
            modulationIndexSlider.isHidden = false
            modulationMultiplierLabel.isHidden = false
            modulationMultiplierSlider.isHidden = false
            carrierMultiplierLabel.isHidden = false
            carrierMultiplierSlider.isHidden = false
            
            octaveBandLabel.isHidden = false
            octaveSelector.isHidden = false
            
            // Change settings button to "Hide"
            settingsButton.setTitle("Hide    ", for: UIControl.State.normal)
        }else{
            
            
            // Hide settings when "Hide" button is pressed
            synthSquareParametersLabel.isHidden = true
            effectsLabel.isHidden = true
            
            removeAllButton.isHidden = true
            
            delayTimeSlider.isHidden = true
            delayTimeLabel.isHidden = true
            delayMixLabel.isHidden = true
            delayMixSlider.isHidden = true
            delayFeedbackLabel.isHidden = true
            delayFeedbackSlider.isHidden = true
            
            attackLabel.isHidden = true
            decayLabel.isHidden = true
            sustainLabel.isHidden = true
            releaseLabel.isHidden = true
            attackSlider.isHidden = true
            decaySlider.isHidden = true
            sustainSlider.isHidden = true
            releaseSlider.isHidden = true
            
            reverbMixLabel.isHidden = true
            reverbMixSlider.isHidden = true
            reverbSelector.isHidden = true
            
            lowPassLabel.isHidden = true
            lowPassSlider.isHidden = true
            
            modulationIndexLabel.isHidden = true
            modulationIndexSlider.isHidden = true
            modulationMultiplierLabel.isHidden = true
            modulationMultiplierSlider.isHidden = true
            carrierMultiplierLabel.isHidden = true
            carrierMultiplierSlider.isHidden = true
            
            octaveBandLabel.isHidden = true
            octaveSelector.isHidden = true
            
            // Change settings label button text to "Settings"
            settingsButton.setTitle("Settings", for: UIControl.State.normal)
        }
    }
    
    // Method which controls UI Button for removing all sqaures
    @IBAction func removeAllSquares(_ sender: AnyObject!){
        self.gameScene?.clearSquares()
    }
    
    // Method which controls UI Segment control for octaves that the sqaures will play in
    @IBAction func changeUIOctave(_ sender: AnyObject!){
        
        switch octaveSelector.selectedSegmentIndex{
        case 0:
            self.gameScene?.changeSquareParamaters(SquareParameter: "Octave", value: 1)
        case 1:
            self.gameScene?.changeSquareParamaters(SquareParameter: "Octave", value: 2)
        case 2:
            self.gameScene?.changeSquareParamaters(SquareParameter: "Octave", value: 3)
        case 3:
            self.gameScene?.changeSquareParamaters(SquareParameter: "Octave", value: 4)
        default:
            break
            
        }
    }
    
    // Method controlling the UI for ADSR Envelope & Frequency Modulation parameters of all synth squares
    @IBAction func changeUIadsr(_ sender: AnyObject!){
        
        // Attack
        if sender.tag == 0{
            
            let attack = Double(powf(10, attackSlider.value))
            self.gameScene?.changeSquareParamaters(SquareParameter: "Attack", value: Double(attack))
            
        }
        
        // Decay
        if sender.tag == 1{
            
            let decay = Double(powf(10, decaySlider.value))
            self.gameScene?.changeSquareParamaters(SquareParameter: "Decay", value: Double(decay))
        }
        
        // Sustain
        if sender.tag == 2{
            
            
            self.gameScene?.changeSquareParamaters(SquareParameter: "Sustain", value: Double(sustainSlider.value))
        }
        
        // Release
        if sender.tag == 3{
            
            let release = Double(powf(10, releaseSlider.value))
            self.gameScene?.changeSquareParamaters(SquareParameter: "Release", value: Double(release))
        }
        
        // Modulation Index
        if sender.tag == 4{
            
            self.gameScene?.changeSquareParamaters(SquareParameter: "Modulation Index", value: Double(modulationIndexSlider.value))
        }
        
        // Carrier Multiplier
        if sender.tag == 5{
            
            self.gameScene?.changeSquareParamaters(SquareParameter: "Carrier Multiplier", value: Double(carrierMultiplierSlider.value))
        }
        
        // Modulation Multiplier
        if sender.tag == 6{
            self.gameScene?.changeSquareParamaters(SquareParameter: "Modulation Multiplier", value: Double(modulationMultiplierSlider.value))
        }
    }
    
    // Method controlling the delay UI
    @IBAction func changeUIdelay(_ sender: AnyObject!) {
        
        // Delay Mix
        if sender.tag == 0 {
            delayMixLabel.text = String(format: "Delay Mix : %.f%% ", (delayMixSlider.value*100))
            self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Delay Mix", value : Double(delayMixSlider.value))
        }
        
        // Delay Time
        if sender.tag == 1 {
            let delayTimeValue = powf(10, delayTimeSlider.value)
            delayTimeLabel.text = String(format: "Delay Time : %.f ms ", (delayTimeValue*100))
            self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Delay Time", value : Double(delayTimeValue))
        }
        
        // Delay Feedback
        if sender.tag == 2 {
            delayFeedbackLabel.text = String(format: "Delay Feedback : %.f%% ", (delayFeedbackSlider.value*100))
            self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Delay Feedback", value : Double(delayFeedbackSlider.value))
        }
    }
    
    // Method controlling the reverb UI
    @IBAction func changeUIreverb(_ sender: AnyObject!){
        
        if sender.tag == 0{
            
            reverbMixLabel.text = String(format: "Reverb Mix : %.f%%   ", reverbMixSlider.value*100)
            self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Reverb Mix", value : Double(reverbMixSlider.value))
        }
        
        if sender.tag == 1{
            switch reverbSelector.selectedSegmentIndex {
            case 0:
                self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Reverb Type", value: 0.0)
            case 1:
                self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Reverb Type", value: 1.0)
            case 2:
                self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Reverb Type", value: 2.0)
            case 3:
                self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Reverb Type", value: 3.0)
            default:
                break
            }
            
        }
        
    }
    
    // Method controlling the lowpass UI
    @IBAction func changeUILowPass(_ sender: AnyObject!){
        
        if sender.tag == 0{
            lowPassLabel.text = String(format: "Low Pass Filter : %.f Hz  ", (powf(10, (lowPassSlider.value))))
            self.gameScene?.audioManager?.changeAudioSetting(audioSetting : "Low Pass", value : (Double(powf(10, (lowPassSlider.value)))))
        }
        
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Method for UI animation, Reference: https://stackoverflow.com/questions/35385856/how-to-make-a-label-fade-in-or-out-in-swift
    
    func fadeTextInThenOut(view : UIView, delay: TimeInterval) {
        
        let animationDuration = 1.0
        
        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in view.alpha = 1
        }) { (Bool) -> Void in
            
            // After animation completes, fade out the view after delay
            UIView.animate(withDuration: animationDuration, delay: delay, options: .curveEaseInOut, animations: { () -> Void in
                view.alpha = 0
            },
                           completion: nil)
        }
    }
}
