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
        
        self.isLogin = false
        
        self.logInResult.text = nil
        self.logInResult.textColor = .red
        
        self.idResultLabel.text = nil
        self.idResultLabel.textColor = .red
        
        self.pwResultLabel.text = nil
        self.pwResultLabel.textColor = .red
        
        self.logInButton.layer.cornerRadius = Metric.buttonRadius
        
        self.idInputField.delegate = self
        self.pwInputField.delegate = self
    }
    
    private var isValidId: Bool = false
    private var isValidPw: Bool = false
    private var isLogin: Bool = false
    
    // MARK: - Action
    @IBAction func logInPress(_ sender: Any) {
        
        self.logInButton.isEnabled = isLogin
        
        guard let id = self.idInputField.text, id.count > 0, let pw = self.pwInputField.text, pw.count > 0 else {
            return
        }
        
        if validId(id) && vaildPw(pw) {
            logInResult.text = "로그인에 성공했습니다."
        }
    }
    
    private func validId(_ id: String) -> Bool {
        
        // 아이디 검증로직
        
        return true
    }
    
    private func vaildPw(_ pw: String) -> Bool {
        
        // 비밀번호 검증로직
        
        return true
    }
}

// MARK: - Delegate
extension ViewController: UITextFieldDelegate {
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        <#code#>
//    }
}


// MARK: - ToDo List
// 1. 비밀번호 secure 처리
// 2. Dele
