//
//  UIKit Extensions.swift
//  
//

import UIKit

extension CGFloat{
    static func random(max: Int) -> CGFloat{
        
        return CGFloat(arc4random() % UInt32(max))
    }
}
    
    extension UIColor{
        class var random: UIColor{
            
            switch arc4random()%8 {
            case 0: return UIColor.green
            case 1: return UIColor.blue
            case 2: return UIColor.orange
            case 3: return UIColor.red
            case 4: return UIColor.purple
            case 5: return UIColor.magenta
            case 6: return UIColor.yellow
            case 7: return UIColor.cyan
                
            
            default: return UIColor.black
            }
        }
    }

extension CGRect{
    
    var mid: CGPoint { return CGPoint(x: midX, y: midY)}
    
    var upperLeft: CGPoint { return CGPoint(x: minX, y: minY)}
    
    var lowerLeft: CGPoint { return CGPoint(x: midX, y: maxY)}
    
    var upperRight: CGPoint { return CGPoint(x: maxX, y: minY)}
    
    var lowerRight: CGPoint { return CGPoint(x: maxX, y: maxY)}

    init(center: CGPoint,size: CGSize){
    
        let upperLeft = CGPoint(x: center.x - size.width/2, y: center.y - size.width/2)
        
        self.init(origin: upperLeft, size: size)
        
        }
}
