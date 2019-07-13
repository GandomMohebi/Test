//
//  ViewController.swift
//  Test
//
//  Created by Gandom on 7/9/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Pass(_ sender: Any) {
    }
    @IBAction func Imail(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let backendless = Backendless.sharedInstance()!
//        func backendless.userService.register(user: BackendlessUser!,
//                                              response: ((BackendlessUser?) -> Void)!,
//                                              error: ((Fault?) -> Void)!) -> Void
//
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    let backendless = Backendless.sharedInstance()!

    func registerUser() {
        // do not forget to call Backendless.initApp when your app initializes
        let user = BackendlessUser()
        user.setProperty("email", object: "james2.bond@mi6.co.uk")
        user.password = "111"
        backendless.userService.register(user,
                                         response: {
                                            (registeredUser : BackendlessUser?) -> Void in
                                            print("User registered \(registeredUser?.value(forKey: "email"))")
        },
                                         error: {
                                            (fault : Fault?) -> Void in
                                            print("Server reported an error: \(fault?.description)")
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
//    let backendless1 = Backendless.sharedInstance()!
//    
//    func registerUser1() {
//        // do not forget to call Backendless.initApp when your app initializes
//        let user = BackendlessUser()
//        
//        user.setProperty("email", object: "james2.bond@mi6.co.uk")
//        user.password = (Pass.text)
//        backendless1.userService.register(user,
//                                         response: {
//                                            (registeredUser : BackendlessUser?) -> Void in
//                                            print("User registered \(registeredUser?.value(forKey: "email"))")
//        },
//                                         error: {
//                                            (fault : Fault?) -> Void in
//                                            print("Server reported an error: \(fault?.description)")
//        })
//    }
//    
    
    
    
    
    

   
    
    @IBAction func Register(_ sender: Any) {
    registerUser()
        print("Registered")
    }
}

