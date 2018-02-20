//
//  MemeView.swift
//  MakeMeme
//
//  Created by Kaira Villanueva on 2/9/18.
//  Copyright © 2018 Kaira Villanueva. All rights reserved.
//

import UIKit

class MemeView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var memeTextField: UITextField!
    @IBOutlet weak var memeImageView: UIImageView!
    
    // MARK: -  Serialization & Deserialization IB
    /* * * * * * * * * * * * * * * * * * * * * */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = Bundle.main.loadNibNamed("MemeView", owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        memeImageView.layer.masksToBounds = true
        memeTextField.autocapitalizationType = .allCharacters
    }

}
