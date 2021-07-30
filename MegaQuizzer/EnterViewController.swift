//
//  EnterViewController.swift
//  MegaQuizzer
//
//  Created by Максим on 30.07.2021.
//

import UIKit

class EnterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func joinAction() {
        performSegue(withIdentifier: "enterSegue", sender: nil)
        showAlert(title: "Hello!",
                  massage: "Hello \(enterTextField.text ?? "User")",
                  textField: enterTextField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        joinAction()
        return true
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EnterViewController {
    private func showAlert(title: String,
                           massage: String,
                           textField: UITextField?) {
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK",
                                        style: .cancel) { _ in
            textField?.text = ""
        }
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
}
