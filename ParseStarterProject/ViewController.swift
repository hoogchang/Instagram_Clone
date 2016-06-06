/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var importedImage: UIImageView!

    @IBAction func importImage(sender: AnyObject) {//tapping the button..
        var image = UIImagePickerController()//allows user to choose an image
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil) //that's what the user sees
    }
    
    
    //what happens when image is picked (note the didFinishPickingImage in the argument)
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        print("Image Selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        importedImage.image = image
    }
    
    
    //spinners = sign that app is doing something... disable app for user... 
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    @IBAction func pause(sender: AnyObject) {
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(activityIndicator)//create the activity indicator
        activityIndicator.startAnimating()
//        UIApplication.sharedApplication().beginIgnoringInteractionEvents() //dont let interaction
    }

    
    @IBAction func restore(sender: AnyObject) {
        activityIndicator.stopAnimating()
//        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    

    //alerts = ui alerts.. which are just popups for users
    @IBAction func createAlert(sender: AnyObject) {
        if #available(iOS 8.0, *) {
            var alert = UIAlertController(title: "Helloooo", message: "u sure man?", preferredStyle: UIAlertControllerStyle.Alert) //the message in the alert
            alert.addAction(UIAlertAction(title: "Just a Prank", style: .Default, handler: { (action) ->Void in //the button
                
                self.dismissViewControllerAnimated(true, completion: nil) //dismiss the alert screen
                
            }))
            self.presentViewController(alert, animated: true, completion: nil) //present the app again

        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
//        //create
//        var product = PFObject(className: "Products")
//        
//        product["name"] = "Ice Cream"
//        product["description"] = "Tutti Fruiti"
//        product["price"] = 4.99
//        
//        product.saveInBackgroundWithBlock { (success, error) -> Void in //block lets you create a function.
//            if success == true {
//                print("Object saved with ID \(product.objectId)")
//                
//            } else {
//                print("Failed")
//                print(error)
//            }
//        }
//        
//        
//        //query
//        var query = PFQuery(className: "Products")
//        query.getObjectInBackgroundWithId("DCcaK6SizV", block: { (object: PFObject?, error: NSError?) -> Void in
//            if error != nil {
//                print(error)
//                
//            } else if let product = object {
//                
//                product["description"] = "Rocky Road"
//                product["price"] = 5.99
//                product.saveInBackground()
//                //print(object?.objectForKey("description"))
//            }
//        })
//        
    
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
