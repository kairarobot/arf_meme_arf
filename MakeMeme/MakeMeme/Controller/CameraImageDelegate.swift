//
//  CameraImageDelegate.swift
//  MakeMeme
//
//  Created by Kaira Villanueva on 2/3/18.
//  Copyright © 2018 Kaira Villanueva. All rights reserved.
//

import Foundation
import UIKit

protocol CameraImageDelegate: class {
    
    func generateMeme(_ memeText: String?, _ memeImage: UIImage?)
}
