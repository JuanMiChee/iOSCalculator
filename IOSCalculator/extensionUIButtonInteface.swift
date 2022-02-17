//
//  File.swift
//  IOSCalculator
//
//  Created by juan harrington on 6/02/22.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

extension UIButton{
    
    //bxorde redondo
    
    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }
    
    //brillo al tocar el boton
    func shine(){
        UIView.animate(withDuration: 0.1, animations:{
            self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
            })
 
        }
        
    }
    
    
    //apariencia de la seleccion del boton
    func selectOperation(_selected: Bool){
        backgroundColor = isSelected ? .white : orange
        setTitleColor(isSelected ? orange : .white, for: .normal)
        
    }
    
}
