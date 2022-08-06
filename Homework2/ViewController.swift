//
//  ViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var idInputField: UITextField!
    @IBOutlet weak var idResultLabel: UILabel!
    
    @IBOutlet weak var pwInputField: UITextField!
    @IBOutlet weak var pwResultLabel: UILabel!
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logInResult: UILabel!
    
    private enum Metric {
        static let buttonRadius: CGFloat = 12
    }
    
    private enum Text {
        
        static var idError: String {
            return "아이디를 확인해주세요."
        }
        
        static var pwError: String {
            return "비밀번호를 확인해주세요."
        }
        
        static var result: String {
            return "로그인이 성공했습니다!!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.logInResult.text = nil
        self.logInResult.textColor = .red
        
        self.idResultLabel.text = nil
        self.idResultLabel.textColor = .red
        
        self.pwResultLabel.text = nil
        self.pwResultLabel.textColor = .red
        
        self.logInButton.layer.cornerRadius = Metric.buttonRadius
        
        self.idInputField.delegate = self
        self.pwInputField.isSecureTextEntry = true
        self.pwInputField.delegate = self
    }
    
    private var isValidId: Bool = false
    private var isValidPw: Bool = false
    private var isLogin: Bool {
        return isValidId && isValidPw
    }
    
    // MARK: - Action
    @IBAction func logInPress(_ sender: Any) {
        
        if isLogin {
            logInResult.textColor = .blue
            logInResult.text = "로그인에 성공했습니다."
            
        } else {
            logInResult.text = "아이디와 비밀번호를 확인해주세요"
            logInResult.textColor = .red
        }
        
        
//        guard let id = self.idInputField.text, id.count > 0, let pw = self.pwInputField.text, pw.count > 0 else {
//            return
//        }
    }
    
    private func validId(_ id: String) -> Bool {
        return (id.count > 10 || id.count == 0) ? true : false
    }
    
    private func vaildPw(_ pw: String) -> Bool {
        return (pw.count > 10 || pw.count == 0) ? true : false
    }
}

// MARK: - Delegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.idInputField {
            debugPrint("아이디 필드가 tapped")
            
        } else if textField == self.pwInputField {
            debugPrint("비밀번호 필드가 tapped")
            
        }
        
        return true
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == self.idInputField {
//            debugPrint("아이디 필드 편집모드 실행")
//
//        } else if textField == self.pwInputField {
//            debugPrint("비밀번호 필드가 편집모드 실행")
//
//        }
//    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        self.logInResult.text = ""
        
        if textField == self.idInputField {
            
            self.isValidId = false
            debugPrint("아이디 필드 초기화!")
            
        } else if textField == self.pwInputField {
            
            self.isValidPw = false
            debugPrint("비밀번호 필드가 초기화!")
            
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == self.idInputField {
            debugPrint("아이디 필드 Return 키 입력!")
            
        } else if textField == self.pwInputField {
            debugPrint("비밀번호 필드가 Return 키 입력!")
            
        }
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        logInResult.text = ""
        
        let currentText = NSString(string: textField.text ?? "")
        let finalText = currentText.replacingCharacters(in: range, with: string)
        
        switch textField {
        case idInputField:
            
            if validId(finalText) {
            
                self.isValidId = true
                self.idResultLabel.text = ""

            } else {
                
                self.isValidId = false
                self.idResultLabel.text = "아이디 실패!"
                
            }
            
        case pwInputField:
            
            if vaildPw(finalText) {
                
                self.isValidPw = true
                self.pwResultLabel.text = ""
                
            } else {
                
                self.isValidPw = false
                self.pwResultLabel.text = "비밀번호 실패"
            }
            
        default: break
        }
        
        return true
    }
}
