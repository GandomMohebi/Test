//
//  ViewController.swift
//  Test
//
//  Created by Gandom on 7/9/19.
//  Copyright © 2019 Gandom. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource{

    @IBAction func Pass(_ sender: Any) {
    }
    @IBAction func Imail(_ sender: Any) {
    }
    
    var gymArray  = [[String: Any]]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
        
    
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
//
//    func update (){
//        backendless.userService.login(username, password ,new AsyncCallback<BackendlessUser>();
//
//  {
//    public void handleResponse (BackendlessUser user)
//    {
//    user.setProperty( "phoneNumber", "5551212" );
//    Backendless.UserService.update( user, new AsyncCallback<BackendlessUser>()
//    {
//    public void handleResponse( BackendlessUser user )
//    {
//    }
//
//    public void handleFault( BackendlessFault fault )
//    {
//    }
//    
//    });
//  }
//    public void handleFault( BackendlessFault fault )
//    {
//    }
//});
//
//    }
//
    
    func get (){
        let dataStore = self.backendless.data.ofTable ("gym");

        dataStore?.find({
            (array) -> () in
            self.gymArray = array as! [[String : Any]]
            print("Result: \(self.gymArray)")
        },
                        error: {
                            (fault : Fault?) -> () in
                            print("Server reported an error: \(fault)")
        })
    }

    
    
    
    @IBAction func Register(_ sender: Any) {
    registerUser()
        loginUser()
        get()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gymArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "g"
        return cell
    }
}

