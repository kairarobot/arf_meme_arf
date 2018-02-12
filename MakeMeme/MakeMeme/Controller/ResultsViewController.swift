//
//  ResultsViewController.swift
//  MakeMeme
//
//  Created by Kaira Villanueva on 2/3/18.
//  Copyright © 2018 Kaira Villanueva. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var resultsView: ResultsView!
    var memeObject = Meme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsView.meme = memeObject
        setupGestureRecognizers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Gesture Recognizers
    /* * * * * * * * * * * * * * */
    // Helper function setup for recognizers
    func setupGestureRecognizers() {
        // Assign pan gesture for text
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(ResultsViewController.panning(_:)))
        resultsView.resultsTextLabel.isUserInteractionEnabled = true
        resultsView.resultsTextLabel.addGestureRecognizer(panGesture)
        // Assign pan gesture for text
        let pinchGesture = UIPinchGestureRecognizer.init(target: self, action: #selector(ResultsViewController.pinching(_:)))
        resultsView.resultsTextLabel.addGestureRecognizer(pinchGesture)
    }
    // Pinching action - resizing label
    @objc private func pinching(_ gesture: UIPinchGestureRecognizer) {
        let maxFontSize: CGFloat = 70
        let minFontSize: CGFloat = 12
        
        if gesture.state == .began || gesture.state == .changed {
            var pinchScale = gesture.scale
            pinchScale = round(pinchScale * 500) / 500.0
            
            if (pinchScale < 1) {
                let fontSize = resultsView.resultsTextLabel.font.pointSize - pinchScale
                if fontSize > minFontSize {
                    resultsView.resultsTextLabel.font = UIFont( name: "impact", size: fontSize)
                }
            }
            else{
                let fontSize = resultsView.resultsTextLabel.font.pointSize + pinchScale
                if fontSize < maxFontSize {
                    resultsView.resultsTextLabel.font = UIFont( name: "impact", size: fontSize)
                }
            }
        }
        
    }
    // Panning action - moving around label
    @objc private func panning (_ gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case UIGestureRecognizerState.changed:
            let location: CGPoint = gesture.location(in: self.view);
            resultsView.resultsTextLabel.center = location
            break
        default:
            return
        }
    }
    
    // MARK: - Navigation
    /* * * * * * * * * * */
    // Back - Goes to the previous view controller
    @IBAction func editMemeTrigger(_ sender: Any) {
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: -  Save Meme to Library Trigger
    /* * * * * * * * * * * * * * * * * * * */
    @IBAction func saveMemeTrigger(_ sender: Any) {
        let resultsImage = resultsView.asImage()
        UIImageWriteToSavedPhotosAlbum(resultsImage, self, #selector(ResultsViewController.saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Photo Saved Successfully")
    }
    
}

// MARK: -  Converts View to Image
/* * * * * * * * * * * * * * * * */
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
