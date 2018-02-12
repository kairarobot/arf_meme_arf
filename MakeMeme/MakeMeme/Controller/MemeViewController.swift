//
//  MemeViewController.swift
//  MakeMeme
//
//  Created by Kaira Villanueva on 2/3/18.
//  Copyright © 2018 Kaira Villanueva. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var memeView: MemeView!
    let imagePicker = UIImagePickerController()
    let memeObject = Meme()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        memeView.memeTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - CameraImageDelegate
    /* * * * * * * * * * * * * * */
    // Camera trigger
    @IBAction func imageFromCameraTrigger(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.cameraCaptureMode = .photo
            present(imagePicker, animated: true, completion: nil)
        } else {
            imageFromLibraryTrigger(self)
        }
    }
    // Library trigger
    @IBAction func imageFromLibraryTrigger(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    /* * * * * * * * * * * * * * * * * * * * */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        memeView.memeImageView.contentMode = .scaleAspectFill
        memeView.memeImageView.image = image
        memeObject.memeImage = image
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITextFieldDelegate
    /* * * * * * * * * * * * * * */
    // Withdraw keyboard on "return"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        memeObject.memeText = textField.text
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Navigation
    /* * * * * * * * * * */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToMeme" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.memeObject = memeObject
        }
    }


}
