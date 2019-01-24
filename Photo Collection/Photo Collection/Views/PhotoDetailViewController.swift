//
//  PhotoDetailViewController.swift
//  Photo Collection
//
//  Created by Dustin Koch on 1/23/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
        
    }
    
    //Mark: - Properties
    var photoController = PhotoController()
    var photo: Photo?
    var themeHelper: ThemeHelper?
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    //Mark: - Functions
    
    func setTheme() {
        guard let theme = themeHelper?.themePreference else { return }
        
        if theme == "Dark" {
            view.backgroundColor = .gray
        } else {
            view.backgroundColor = .cyan
        }
    }
    
    func updateViews() {
        
        setTheme()
        
        if let photo = photo {
            navigationItem.title = "Edit Photo"
            imageView?.image = UIImage(data: photo.imageData)
            textField?.text = photo.title
        } else {
            navigationItem.title = "Add Photo"
        }
        
    }
    
    
    func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    //stub of the Delegate added
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //dismiss lib
        picker.dismiss(animated: true, completion: nil)
        
        //get image
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
    }
    
    
    
    //Mark: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addPhoto(_ sender: UIButton) {
        presentImagePickerController()
        
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        //The "Save" bar button item's action should either update the photo if it has a value, or create a new instance of photo using the methods in the photoController. "Pop" the view controller afterwards.
        
        guard let title = textField.text else { return }
        guard let image = imageView.image else { return }
        guard let imageData = image.pngData() else { return }
        
        if let photo = photo {
            photoController.update(updatePhoto: photo, image: imageData, title: title)
        } else {
            photoController.create(image: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
        
    }
}
