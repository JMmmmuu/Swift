//
//  ViewController.swift
//  WhatFlower
//
//  Created by Yuseok on 31/08/2019.
//  Copyright © 2019 Yuseok. All rights reserved.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    @IBOutlet weak var seeMoreButton: UIButton!
    var pickedImage: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        //imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = userPickedImage
            pickedImage = userPickedImage

            guard let convertedCIImage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert UIImage into CIImage")
            }
            
            detect(image: convertedCIImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)

        
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func detect(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
            fatalError("Loading CoreML Model Failed")
        }

        let request = VNCoreMLRequest(model: model) { (request, error) in
            let classification = request.results?.first as? VNClassificationObservation
            self.navigationItem.title = classification?.identifier.capitalized
        }

        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }

    
    @IBAction func seeMoreButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSpecification", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSpecification" {
            let destinationVC = segue.destination as! SpecificationViewController
            destinationVC.pickedImage = pickedImage
            destinationVC.flower = self.navigationItem.title
        }
    }
}

