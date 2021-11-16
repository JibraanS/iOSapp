//
//  ProfileViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/11/21.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var profileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func uploadImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        // TODO Make a popover to choose whether to use camera or photo library
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true){
            //After it is complete
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage{
            print("Image uploaded")
            self.profileButton.setImage(image, for: .normal)
        }
        else {
            //Error message
            print("Image upload error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
