//
//  ResultsTextDelegate.swift
//  MakeMeme
//
//  Created by Kaira Villanueva on 2/11/18.
//  Copyright © 2018 Kaira Villanueva. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ResultsTextDelegate: class {
    
    @objc func pinching(_ gesture: UIPinchGestureRecognizer, label: UILabel)
    
    @objc func panning (_ gesture: UIPanGestureRecognizer, label: UILabel, view: UIView)

    func strokeText(label: UILabel, text: String) 
}
