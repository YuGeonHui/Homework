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
        
        static var resultSucess: String {
            return "로그인이 성공했습니다!!"
        }
        
        static var resultError: String {
            return "아이디와 비밀번호를 확인해주세요"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.logInResult.text = nil
        self.logInResult.textColor = .red
        
        self.idResultLabel.text = nil
        self.idResultLabel.textColor = .red
        
        self.pwResultLabel.text = nil
        self.pwResultLabel.textColor = .red
        
        self.logInButton.layer.cornerRadius = Metric.buttonRadius
        
        self.idInputField.delegate =
        self
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
            logInResult.text = Text.resultSucess
            
        } else {
            
            logInResult.text = Text.resultError
            logInResult.textColor = .red
        }
        
        guard let id = self.idInputField.text, id.count > 0, let pw = self.pwInputField.text, pw.count > 0 else {
            
//            self.logInResult.text = ""
            return
        }
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
        
        if textField == idInputField {
            debugPrint("아이디 필드가 tapped")
            
        } else if textField == pwInputField {
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
        
        if textField == idInputField {
            
            isValidId = false
            debugPrint("아이디 필드 초기화!")
            
        } else if textField == pwInputField {
            
            isValidPw = false
            debugPrint("비밀번호 필드가 초기화!")
            
        }
        
        return true
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        if textField == self.idInputField {
//            debugPrint("아이디 필드 Return 키 입력!")
//
//        } else if textField == self.pwInputField {
//            debugPrint("비밀번호 필드가 Return 키 입력!")
//
//        }
//
//        return true
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        logInResult.text = ""
        
        let currentText = NSString(string: textField.text ?? "")
        let finalText = currentText.replacingCharacters(in: range, with: string)
        
        switch textField {
        case idInputField:
            
            if validId(finalText) {
            
                isValidId = true
                idResultLabel.text = ""

            } else {
                
                isValidId = false
                idResultLabel.text = Text.idError
            }
            
        case pwInputField:
            
            if vaildPw(finalText) {
                
                isValidPw = true
                pwResultLabel.text = ""
                
            } else {
                
                isValidPw = false
                pwResultLabel.text = Text.pwError
            }
            
        default: break
        }
        
        return true
    }
}
