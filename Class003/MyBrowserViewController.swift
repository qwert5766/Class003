//
//  MyBrowserViewController.swift
//  Class003
//
//  Created by L20102-02 on 2019/5/6.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit
import WebKit

class MyBrowserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnGobuttonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //myWebView.load(URLRequest(url: <#T##URL#>(string: "https://www.google.com.tw")!))
        myWebView.load(URLRequest(url: URL(string: "https://www.google.com.tw")!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisAppear(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - TextField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) ->Bool {
        
        let accept = "abcdeABCDE"
        
        let cs = NSCharacterSet(charactersIn: accept).inverted
        
        let filters = string.components(separatedBy: cs).joined(separator: "")
        
        if(string != filters)
        {
            return false
        }
        
        let current = textField.text! as NSString

        let newString : NSString = current.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= 10
        
    }
    //MARK: - Keyboard
    
    
    @objc func keyboardWillAppear(notification:NSNotification?) {
        print("keyboardWillAppear")
        
        
        guard let frame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        UIView.animate(withDuration: 50, animations: {
             self.btnGobuttonConstraint.constant = frame.cgRectValue.height;
        })
        
       
    }
    
    @objc func keyboardWillDisAppear(notification:NSNotification?) {
        print("keyboardWillDisAppear")
        UIView.animate(withDuration: 50, animations: {
            self.btnGobuttonConstraint.constant = 31;
        })
    }
    
    
    
    
    
}
