//
//  BookNowVC.swift
//  CollectionViewAlamofire
//https://learnappmaking.com/singletons-swift/
//  Created by JOEL CRAWFORD on 3/18/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//https://stackoverflow.com/questions/29734954/how-do-you-share-data-between-view-controllers-and-other-objects-in-swift
//https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/

import UIKit

//enum SizeType: CGFloat {
////    case iPhone4 = 960.0
////    case iPhone5 = 1136.0
////    case iPhone6 = 1334.0
////    case iPhone6Plus = 1920.0
//
//
//    case iphoneX = 821.0
//    case iphone11 = 896.0
//    case iphone8  = 736.0
//}


//enum iPhoneDevice: CGFloat {
//    
//    case iPhone8          =  667.0
//    case iPhone8Plus     = 736.0
//    case iPhone11         = 896.0
//    case iPhone11ProMax   = 896.0
//    
//}



class BookNowVC: UIViewController {
    
//    var categoryTitle: String!
//    var serviceTitle: String!
    
    //let iPhone8PlusHeight: CGFloat = 736.0
    
    let iphone8Height: CGFloat = 667.0
    
    
    @IBOutlet weak var serviceStackView: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      // setUpStackViews()
        postionBarButton()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backButtonAction))
        
        // Do any additional setup after loading the view.
        
        navBar.topItem?.title = "Create service request"
        
        navBar.tintColor = UIColor.white
        
        

        
        
        
        
    }
    

    
//    func setUpStackViews() {
//
//        //w: 326 H: 579 read from storyboard
//
//        //enable auto layout for the stack view
//      serviceStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        serviceStackView.axis = .vertical
//        serviceStackView.spacing = 10
//
//        serviceStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true //centers the stackview horizontally
//
//        serviceStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true //centers vertically
//
//        serviceStackView.widthAnchor.constraint(equalToConstant:  326).isActive = true
//        serviceStackView.heightAnchor.constraint(equalToConstant: 579).isActive = true
//
//    }
    
    
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var serviceTextField: UITextField!
    @IBOutlet weak var serviceDatePickerTextField: UITextField!
    @IBOutlet weak var seriveLocationTextField: UITextField!
    @IBOutlet weak var servicePaymentPickerTextField: UITextField!
    @IBOutlet weak var serviceMakeRequestBtnOutlet: UIButton!
    @IBOutlet weak var serviceDescriptionTextView: UITextView!
    
    //MARK:- BACK BUTTON ACTION
    @IBAction func backButtonAction(_ sender: UIBarButtonItem) {
        //print("Back Button Clicked")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func postionBarButton() {

        var tempNavBarRect: CGRect = navBar.frame

        if self.view.frame.size.height <= iphone8Height {
            tempNavBarRect.origin.y = 20

            navBar.frame = tempNavBarRect
            
            
        
            var serviceStackviewRect: CGRect = serviceStackView.frame
            
            let newYOrigin = self.view.frame.height - serviceStackviewRect.size.height
            
            //let newYOrigin = self.navBar.frame.origin.y + self.navBar.frame.size.height + 20
            
                serviceStackviewRect.origin.y = newYOrigin
            
              // serviceStackView.frame =  serviceStackviewRect
            

        }



    }
    

    
    
    //MARK:- SERVICE LOCATION ACTION
    @IBAction func serviceLocationAction(_ sender: UITextField) {
    }
    
    //MARK:- SERVICE MAKE REQUEST ACTION
    @IBAction func serviceMakeRequestAction(_ sender: UIButton) {
    }
    
    
    
    
    

}


//            let serviceStackviewRect: CGRect = serviceStackView.frame
//
//            let newYOrigin = self.view.frame.height - navBar.frame.size.height
//
//            tempNavBarRect.origin.y = newYOrigin
            
            
            
            

            //let serviceStackViewRect: CGRect = serviceStackView.frame

          //  let newYOrigin = self.view.frame.size.height - serviceStackViewRect.frame.size.height + 8 //to add spaced from the bottom

           // tempNavBarRect.origin.y = newYOrigin

            //serviceStackView.frame    = tempNavBarRect
