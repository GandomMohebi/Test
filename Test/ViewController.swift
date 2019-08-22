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
    @IBOutlet weak var tableView: UITableView!
    
    var gymArray : [gym] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        getObj()
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
    
    func getObj (){
        let dataStore = self.backendless.data.of(gym().ofClass());
        
        
//        DispatchQueue.global().async {
//            let array = dataStore?.find() as! [gym]
//            DispatchQueue.main.async {
//                self.gymArray = array
//                self.tableView.reloadData()
//            }
//        }
        
        dataStore?.find({ items in
            let gymItems = items as! [gym]
            print(gymItems.map{$0.image})
            self.gymArray = gymItems
            self.tableView.reloadData()

        }, error: { fault in
            print(fault?.description)
        })

//        dataStore?.find({
//            (array) -> () in
//            self.gymArray = array as! [gym]
//            print("Result: \(self.gymArray)")
//        },
//                        error: {
//                            (fault : Fault?) -> () in
//                            print("Server reported an error: \(fault)")
//        })
    }

    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gymArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let gym1 = gymArray[indexPath.row]
        cell.textLabel?.text = gym1.name
        return cell
    }
    
//    func insert (){
//        backendless.data.of(gym.self).save(gym() , response :{(resault : (Any?)) -> Void in let gym = resault as! gym ;
//            print ("\(resault)")
//        }, error : {( fault : Fault?) -> () in
//            print("Server reported an error: \(fault)")})
//    };
    
    
    @IBAction func Register(_ sender: Any) {
//        insert()
        registerUser()
        loginUser()
//        getObj()
    }
}


