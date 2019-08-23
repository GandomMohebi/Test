import UIKit

class UserForm: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let backendLess = Backendless.sharedInstance();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitUser(_ sender: Any) {
        var user = BackendlessUser();
        user.name = userNameTextField.text! as NSString;
        user.password = passwordTextField.text! as NSString;
        user.email = emailTextField.text! as NSString;
        
        backendLess?.userService.register(user, response: { (user) in
            print("OK")
        }, error: { (error) in
            print(error)
        })
    }
}
