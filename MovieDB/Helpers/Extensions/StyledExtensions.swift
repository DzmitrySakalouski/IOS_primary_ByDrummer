
import Foundation
import UIKit

extension LoginViewController {
    func setUpElements() {
        CommonStyleUtility.styledTextField(self.loginTextFileld)
        CommonStyleUtility.styledTextField(self.passwordTextField)
        CommonStyleUtility.styledFilledButton(self.logInButton)
        
        self.errorLabel.alpha = 0
    }
    
    func validateTrextFields() -> String? {
        if self.loginTextFileld.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            self.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all Text Fields"
        }
        
        let cleanedPassword = self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !CommonStyleUtility.isPasswordValid(cleanedPassword) {
            return "Please sure that password is at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
}

extension SignUpViewController {
    func setUpElements() {
    CommonStyleUtility.styledTextField(self.confirmPasswordSignUpTextField)
        CommonStyleUtility.styledTextField(self.firstNameTextField)
        CommonStyleUtility.styledTextField(self.lastNameTextField)
        CommonStyleUtility.styledTextField(self.emailSignUpTextField)
        CommonStyleUtility.styledTextField(self.passwordSignUpTextField)
        CommonStyleUtility.styledFilledButton(self.signUpButton)
        
        self.errorLabel.alpha = 0
    }
    
    func validateTrextFields() -> String? {
        if self.confirmPasswordSignUpTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            self.lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            self.emailSignUpTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            self.passwordSignUpTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            self.firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all Text Fields"
        }
        
        let cleanedPassword = self.passwordSignUpTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !CommonStyleUtility.isPasswordValid(cleanedPassword) {
            return "Please sure that password is at least 8 characters, contains a special character and a number"
        }
        
        return nil
    }
}

extension AuthViewController {
    func setUpElements() {
        CommonStyleUtility.styledFilledButton(self.logInButton)
        CommonStyleUtility.styledHollowButton(self.signUpButton)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0, paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false // turns on programmatic constrains TODO : - remove all in custom views
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    
    }
}
