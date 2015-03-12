//
//  AddUserPhotoViewController.swift
//  Pragati
//
//  Created by Jessica Le on 3/8/15.
//  Copyright (c) 2015 LoveLeJess. All rights reserved.
//

import UIKit

class AddUserPhotoViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var capturePhotoButton: UIBarButtonItem!
    @IBOutlet weak var selectedPhoto: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        selectedPhoto.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        selectedPhoto.contentMode = .ScaleAspectFit
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelButton(sender: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cameraRoll(sender: AnyObject) {
        picker.sourceType = .PhotoLibrary
        picker.modalPresentationStyle = .Popover
        picker.allowsEditing = false
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func capturePhoto(sender: UIBarButtonItem) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraCaptureMode = .Photo
            picker.allowsEditing = false
            presentViewController(picker, animated: true, completion: nil)
        } else {
           cameraNotFound()
        }
    }
    
    func cameraNotFound(){
        let alertPopUp = UIAlertController(title: "Error: No Camera Detected", message: "How am I supposed to capture a photo without a camera?!", preferredStyle: .Alert)
        let dismissButton = UIAlertAction(title: "Oh, silly me!", style:.Default, handler: nil)
        alertPopUp.addAction(dismissButton)
        presentViewController(alertPopUp, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}