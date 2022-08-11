//
//  Homework3ViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/10.
//

import UIKit

// TODO: UserDefault 추가
// TODO: UIView 개념 추가
class Homework3ViewController: UIViewController {
    
    @IBOutlet weak var onOffSwitch: UISwitch!
    @IBOutlet weak var onOffButton: UIButton!
    @IBOutlet weak var alertResult: UILabel!
    
    private var state: Bool = false
    private let selectNumberKey = "selectedNumber"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stateChange(_ sender: Any) {
        self.state.toggle()
    }
    
    @IBAction func showAlert(_ sender: Any) {
        
        guard !state else { return }
        
        let alert = UIAlertController(title: "Your Title", message: "Your Message", preferredStyle: UIAlertController.Style.alert)
        let defaultVale = UIAlertAction(title: "default", style: .default) { _ in
//            self.alertResult.text = "Ok Action Handler"
            self.view.backgroundColor = .blue
        }
        let destructiveValue = UIAlertAction(title: "destructive", style: .destructive) { _ in
            self.view.backgroundColor = .red
        }
        let cancelValue = UIAlertAction(title: "cancel", style: .cancel) { _ in
            self.view.backgroundColor = .systemBackground
        }
        
//        let value = UIAlertAction(title: "", style: .default) {
//
//        }
        
        alert.addAction(defaultVale)
        alert.addAction(destructiveValue)
        alert.addAction(cancelValue)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet(_ sender: Any) {
        
        let alert = UIAlertController(title: "Your Title", message: "Your Message", preferredStyle: UIAlertController.Style.actionSheet)

        let valueTitle: [String] = ["1" , "2", "3", "4"]
        var numberAction = UIAlertAction()
        
        for value in 0..<valueTitle.count {
            numberAction = UIAlertAction(title: valueTitle[value], style: .default)
            
            UserDefaults.standard.set(valueTitle[value], forKey: selectNumberKey)
            alert.addAction(numberAction)
            
            
            self.alertResult.text = UserDefaults.standard.string(forKey: selectNumberKey) ?? "Not Choice Number"
        }
        
//        let okAction = UIAlertAction(title: "OK", style: .cancel, handler : nil)
        let cancel = UIAlertAction(title: "cancel", style: .destructive, handler : nil)
//
        alert.addAction(cancel)
//        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
