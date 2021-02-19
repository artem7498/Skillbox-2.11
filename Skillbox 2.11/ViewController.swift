//
//  ViewController.swift
//  Skillbox 2.11
//
//  Created by Артём on 2/17/21.
/*Прочитайте про Agile: https://gosagile.cdto.ranepa.ru/1_1.
 
Прочитайте про Scrum и Kanban: https://4brain.ru/blog/agile/.
 
Напишите о четырёх ценностях, которые есть в манифесте Agile (своими словами).
 
Укажите минимум три отличия фреймворка Scrum от Kanban.
 
Опишите процесс работы по Scrum.
 
Прочитайте статью про тестирование: https://www.raywenderlich.com/960290-ios-unit-testing-and-ui-testing-tutorial/.
 
Сделайте модель с функцией валидации логина (почты) и пароля: логин должен быть корректной почтой, пароль — не менее шести символов, которые содержат как минимум одну цифру, одну букву в нижнем регистре и одну — в верхнем. При ошибке модель должна возвращать ошибку (если есть) или успех. Сделайте экран для ввода логина и пароля, где кнопка «Войти» становится активной, если поле логина и поле пароля не пустые. При нажатии на кнопку в случае ошибки должна показываться надпись с текстом ошибки, в случае успеха — экран с поздравлением. Сделайте следующие тесты:
корректности работы функции проверки логина и пароля (не менее восьми проверок);
 
корректности обработки неправильных данных в интерфейсе (UI-тесты), не менее трёх сценариев;
 
корректности обработки правильных данных в интерфейсе.
 
Интегрируйте проект с любым CI/CD-сервисом (например, Bitrise).
 
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isHidden = true
        loginButton.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTextFieldChanged(_ sender: Any) {
        guard let text = loginTextField.text else {return}
        guard let pass = passwordTextField.text else {return}
        print(text)
        
        if !text.isEmpty{
            if !pass.isEmpty{
                loginButton.isHidden = false
                loginButton.isEnabled = true
            }
        } else {
            loginButton.isHidden = true
            loginButton.isEnabled = false
        }
        
    }
    
    @IBAction func passwordTextFieldChanged(_ sender: Any) {
        guard let text = loginTextField.text else {return}
        guard let pass = passwordTextField.text else {return}
        print(pass)
        
        if !pass.isEmpty{
            if !text.isEmpty{
                loginButton.isHidden = false
                loginButton.isEnabled = true
            }
        } else {
            loginButton.isHidden = true
            loginButton.isEnabled = false
        }
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        
        guard let text = loginTextField.text else {return}
        guard let pass = passwordTextField.text else {return}
        print(text, pass)
        
        if text.isValid(.email) && pass.isValid(.password) {
            statusLabel.text = "Valid "
            performSegue(withIdentifier: "Yahoo", sender: self)
        } else if !text.isValid(.email) && pass.isValid(.password){
            statusLabel.text = "\(String.ValidityType.email) not valid"
        } else if text.isValid(.email) && !pass.isValid(.password){
            statusLabel.text = "\(String.ValidityType.password) not valid"
        } else {
            statusLabel.text = "Email and password not valid"
        }
        
    }
    


}

extension String {
    
    enum ValidityType {
        case email
        case password
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .email:
            regex = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}"
                    + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
                    + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
                    + "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
                    + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
                    + "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
                    + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
//            regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .password:
            regex = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z]).{6,}$"
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
    
    
}



