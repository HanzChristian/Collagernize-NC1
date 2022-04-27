//
//  UIViewExtension.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 27/04/22.
//

import Foundation
import UIKit

extension UIView {
    
   @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
