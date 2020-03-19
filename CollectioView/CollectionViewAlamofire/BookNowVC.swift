//
//  BookNowVC.swift
//  CollectionViewAlamofire
//https://learnappmaking.com/singletons-swift/
//  Created by JOEL CRAWFORD on 3/18/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//https://stackoverflow.com/questions/29734954/how-do-you-share-data-between-view-controllers-and-other-objects-in-swift
//https://learnappmaking.com/pass-data-between-view-controllers-swift-how-to/





import UIKit

class BookNowVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let datePicker: UIDatePicker = UIDatePicker()
    
    let paymentMethodPicker: UIPickerView = UIPickerView()
    
    let paymentMethodArray: Array<String> = ["select payment method","cash payment"]
    
    
    
    let iphone8Height: CGFloat = 667.0
    
    @IBOutlet weak var subView: UIView!   //  My contribution
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        postionBarButton()
        createDatePickerView()
        paymentMethod()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self, action: #selector(backButtonAction))
        
        // Do any additional setup after loading the view.
        
        navBar.topItem?.title = "Create service request"
        
        navBar.tintColor = UIColor.white
        
        subView.center = self.view.center //  My contribution
        
        subView.backgroundColor = .clear
        
        
        //delegates
        paymentMethodPicker.dataSource = self
        paymentMethodPicker.delegate = self
        
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return  paymentMethodArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paymentMethodArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        servicePaymentPickerTextField.text = paymentMethodArray[row]
        
    }
    
    
    
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
    
    
    
    
    func paymentMethod() {
        
        servicePaymentPickerTextField.inputView = paymentMethodPicker
        servicePaymentPickerTextField.textColor = .black
        servicePaymentPickerTextField.textAlignment = .center
        
        let toolBar = UIToolbar()
        
        //customize the toolbar
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        servicePaymentPickerTextField.inputAccessoryView = toolBar
        
        
        
        
    }
    
    
    
    
    func createDatePickerView() {
    
        serviceDatePickerTextField.textColor = .black
        serviceDatePickerTextField.textAlignment = .center
        
        //=====creating tool bar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        //customize the toolbar
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        
        
        
        //=======creating done button ===
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        
        //======space between done and cancel buttons
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        //===cancel button ==
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(canclePressed))
        
        
        toolBar.setItems([cancelBtn, flexSpace, doneBtn], animated: true)
        
        //assign toolbar to the keyboard
        
        serviceDatePickerTextField.inputAccessoryView = toolBar
        
        //asign datepicker to the text field
        serviceDatePickerTextField.inputView = datePicker
        
        //date picker mode
        datePicker.datePickerMode = .date
        
        
        
    }
    
    
    @objc func canclePressed() {
        serviceDatePickerTextField.resignFirstResponder()
        
    }
    
    
    @objc func donePressed() {
        
        //format the text when done is pressed
        
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none  //includes the time when selected hence none removes it
        formatter.calendar = .current
        
        //2 things to be done: we assign the value to textfield and close the view
        //serviceDatePickerTextField.text = "\(datePicker.date)"
        
        serviceDatePickerTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        
    }
    
    
    @objc func donePicker() {
        servicePaymentPickerTextField.resignFirstResponder()
    }
    
    
    
    func postionBarButton() {
        
        var tempNavBarRect: CGRect = navBar.frame
        
        if self.view.frame.size.height <= iphone8Height {
            tempNavBarRect.origin.y = 20
            
            navBar.frame = tempNavBarRect
            
            
            
            var tabBarRect: CGRect = subView.frame
            
            let newYOrigin = self.view.frame.size.height - tempNavBarRect.size.height + 20
            
            // let newYOrigin = self.navBar.frame.size.height + 20 + self.subView.frame.origin.y
            
            tabBarRect.origin.y = newYOrigin
            subView.frame    = tabBarRect
            
        
            
        }
        
    }
    
    
    
    
    //MARK:- SERVICE LOCATION ACTION
    @IBAction func serviceLocationAction(_ sender: UITextField) {
    }
    
    //MARK:- SERVICE MAKE REQUEST ACTION
    @IBAction func serviceMakeRequestAction(_ sender: UIButton) {
    }
    
}
