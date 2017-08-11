//
//  ViewController.swift
//  testTaskAMGrade
//
//  Created by Azat IOS on 10.08.17.
//  Copyright © 2017 azatech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraRollOutlet: UIButton!
    @IBOutlet weak var takeAPhotoOutlet: UIButton!
    @IBOutlet weak var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        takeAPhotoOutlet.isHidden = true
        takeAPhotoOutlet.backgroundColor = UIColor.red
        cameraRollOutlet.isHidden = true
        cameraRollOutlet.backgroundColor = UIColor.green

    }
    @IBAction func imageBtnPressed(_ sender: UIButton) {
        takeAPhotoOutlet.isHidden = false
        cameraRollOutlet.isHidden = false
    }

    @IBAction func cameraRollBtnPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker           = UIImagePickerController()
            imagePicker.delegate      = self
            imagePicker.sourceType    = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

        @IBAction func takeAPhotoBtnPressed(_ sender: UIButton) {
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker           = UIImagePickerController()
                imagePicker.delegate      = self
                imagePicker.sourceType    = UIImagePickerControllerSourceType.camera;
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {

            myImageView.image     = image
            cameraRollOutlet.isHidden = true
            takeAPhotoOutlet.isHidden  = true
        }
        else {
            print("Error Picking photo")
        }
        self.dismiss(animated: true, completion: nil)
    }



}

