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
        
        
    }
        
        // Do any additional setup after loading the view, typically from a nib.
    
    let backendless = Backendless.sharedInstance()!

    func registerUser() {
        // do not forget to call Backendless.initApp when your app initializes
        let user = BackendlessUser()
        user.setProperty("email", object: "james3.bond@mi6.co.uk")
        user.password = "001"
        user.name = "jame"
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
    
    

    
    
//login
    func loginUser () {
        backendless.userService.login("james.bond@mi6.co.uk",
                                      password: "000",
                                      response: {
                                        (loggedUser : BackendlessUser?) -> Void in
                                        print("User logged in")
        },
                                      error: {
                                        (fault : Fault?) -> Void in
                                        print("Server reported an error: \(fault?.description)")
        })
    }
  
    
    // update

    func update (){
        backendless.userService.login(username, password ,new AsyncCallback<BackendlessUser>();

  {
    public void handleResponse (BackendlessUser user)
    {
    user.setProperty( "phoneNumber", "5551212" );
    Backendless.UserService.update( user, new AsyncCallback<BackendlessUser>()
    {
    public void handleResponse( BackendlessUser user )
    {
    }
    
    public void handleFault( BackendlessFault fault )
    {
    }
    
    });
  }
    public void handleFault( BackendlessFault fault )
    {
    }
});
    
    }
    
    
    
    
    
    
    
    
    
    @IBAction func Register(_ sender: Any) {
    registerUser()
        loginUser()
    }
}

