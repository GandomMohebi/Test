import UIKit

class LoginController : UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let backendLess = Backendless.sharedInstance();
    
    @IBAction func goToRegister(_ sender: Any) {
        let vc = UserForm();
        navigationController?.pushViewController(vc, animated: true);
    }
    
    @IBAction func login(_ sender: Any) {
        backendLess!.userService.login("TestEmail@gmail.com", password: "123456", response: { (response) in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainView") as! UITabBarController;
            self.present(vc, animated: true, completion: nil)
            
        }) { (error) in
            print(error)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
}
