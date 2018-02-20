//
//  ResultsView.swift
//  MakeMeme
//
//  Created by Kaira Villanueva on 2/9/18.
//  Copyright © 2018 Kaira Villanueva. All rights reserved.
//

import UIKit

class ResultsView: UIView {
    @IBOutlet var contentView: UIView!    
    @IBOutlet weak var resultsImageView: UIImageView!
    @IBOutlet weak var resultsTextLabel: UILabel!
    
    // MARK: -  Serialization & Deserialization IB
    /* * * * * * * * * * * * * * * * * * * * * */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let view = Bundle.main.loadNibNamed("ResultsView", owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
        resultsImageView.layer.masksToBounds = true
    }
   
    // MARK: -  Setter
    /* * * * * * *  */
    var meme: Meme? {
        didSet {
            if let memeObject = meme {
                if memeObject.memeImage != nil {
                    resultsImageView.image = memeObject.memeImage
                } else {
                    resultsImageView.image = UIImage(named: "shibainu")
                }
                if memeObject.memeText != nil {
                    strokeText(label: resultsTextLabel, text: memeObject.memeText!)
                } else {
                    strokeText(label: resultsTextLabel, text: "arf arf arf!")
                }
            }
        }
    }
    
    // MARK: -  Font Stroke
    /* * * * * * * * */
    func strokeText(label: UILabel, text: String) {
        let strokeTextAttributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.white,
            NSAttributedStringKey.strokeWidth : -3.0,
            ]
        label.attributedText = NSAttributedString(string: text, attributes: strokeTextAttributes)
    }

    
    
}
