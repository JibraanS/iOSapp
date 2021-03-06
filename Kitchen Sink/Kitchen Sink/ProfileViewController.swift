//
//  ProfileViewController.swift
//  Kitchen Sink
//
//  Created by Samuel Perales on 11/11/21.
//

import UIKit
import Firebase

extension UIImage {
    var isPortrait:  Bool    { size.height > size.width }
    var isLandscape: Bool    { size.width > size.height }
    var breadth:     CGFloat { min(size.width, size.height) }
    var breadthSize: CGSize  { .init(width: breadth, height: breadth) }
    var breadthRect: CGRect  { .init(origin: .zero, size: breadthSize) }
    var circleMasked: UIImage? {
        guard let cgImage = cgImage?
            .cropping(to: .init(origin: .init(x: isLandscape ? ((size.width-size.height)/2).rounded(.down) : 0,
                                              y: isPortrait  ? ((size.height-size.width)/2).rounded(.down) : 0),
                                size: breadthSize)) else { return nil }
        let format = imageRendererFormat
        format.opaque = false
        return UIGraphicsImageRenderer(size: breadthSize, format: format).image { _ in
            UIBezierPath(ovalIn: breadthRect).addClip()
            UIImage(cgImage: cgImage, scale: format.scale, orientation: imageOrientation)
            .draw(in: .init(origin: .zero, size: breadthSize))
        }
    }
}

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        // get current user
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        
        // set background based on darkmode
        if (UserDefaults.standard.bool(forKey: email + "darkmode")) {
            view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            nameLabel.textColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
            nameLabel.textColor =  #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
        }
        
        if (UserDefaults.standard.object(forKey: email + "image") != nil){
            if let imageData = UserDefaults.standard.object(forKey: email + "image") as? Data,
                let image = UIImage(data: imageData) {
                profileButton.setBackgroundImage(image.circleMasked, for: UIControl.State.normal)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // get current user
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        if UserDefaults.standard.string(forKey: email + "name") != nil {
            nameLabel.text = UserDefaults.standard.string(forKey: email + "name")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        if UserDefaults.standard.array(forKey: email + "favorites") == nil {
            UserDefaults.standard.set([], forKey: email + "favorites")
            UserDefaults.standard.synchronize()
        }
        
    }
    
    @IBAction func uploadImage(_ sender: Any) {
        let controller = UIAlertController(
            title: "Choose a source for your profile image.",
            message: "",
            preferredStyle: .alert
        )
        controller.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in self.getCameraImage()}))
        controller.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: {(action: UIAlertAction) in self.getGalleryImage()}))
        self.present(controller, animated: true, completion: nil)
    }
                                           
    func getGalleryImage() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            //let pickedImage = imagePicker as? UIImage
            //profileButton.setBackgroundImage(pickedImage, for: UIControl.State.normal)
        }
    }
    
    func getCameraImage() {
        print("no camera?")
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        profileButton.setBackgroundImage(image.circleMasked, for: UIControl.State.normal)
        dismiss(animated: true)
        
        let user = Auth.auth().currentUser
        let email:String = user?.email ?? "none"
        UserDefaults.standard.set(image.pngData(), forKey: email + "image")
        UserDefaults.standard.synchronize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favorites"{
            let nextVC = segue.destination as? TableViewController
            nextVC?.resultType = segue.identifier ?? ""
        }
    }
}
