//
//  HomeWork4ViewController.swift
//  Homework2
//
//  Created by geonhui Yu on 2022/08/12.
//

import UIKit

class HomeWork4ViewController: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var directionSegment: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    private let direction: Direction = Direction()
    
    private var directionKey = "directionKey"
    private var numberKey = "nubmerKey"
    
    private enum Const {
        static var darkAlpha: CGFloat = 0.5
        static var defaultAlpha: CGFloat = 1.0
    }
    
    private enum Texts {
        
        enum Alert {
            
            static var title: String {
                return "저장 하시겠습니까?"
            }
            
            static var messsage: String {
                return "저장된 정보는 앱이 삭제되기 전까지 지워지지 않습니다."
            }
            
            static var cancel: String {
                return "취소"
            }
            
            static var save: String {
                return "저장"
            }
        }
        
        enum Direction {
            
            static var east: String {
                return "동쪽"
            }
            
            static var west: String {
                return "서쪽"
            }
            
            static var south: String {
                return "남쪽"
            }
            
            static var north: String {
                return "북쪽"
            }
        }
    }
    
    struct Direction {
        let east: String = Texts.Direction.east
        let west: String = Texts.Direction.west
        let south: String = Texts.Direction.south
        let north: String = Texts.Direction.north
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultLabel.text = UserDefaults.standard.string(forKey: directionKey) ?? "값을 선택해 주세요."
        self.directionSegment.selectedSegmentIndex = UserDefaults.standard.integer(forKey: numberKey)
        
        self.indicator.hidesWhenStopped = true // 처음에 안보이게 해주기 위해서
    }
    
    @IBAction func selectedNumber(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            resultLabel.text = direction.east
            UserDefaults.standard.set(0, forKey: numberKey)
        case 1:
            resultLabel.text = direction.west
            UserDefaults.standard.set(1, forKey: numberKey)
        case 2:
            resultLabel.text = direction.south
            UserDefaults.standard.set(2, forKey: numberKey)
        case 3:
            resultLabel.text =  direction.north
            UserDefaults.standard.set(3, forKey: numberKey)
        default: break
        }
    }
    
    @IBAction func save(_ sender: Any) {
        showAlert()
    }
}

// MARK: Animation
extension HomeWork4ViewController {
    
    private func startAnimation() {
        
        self.view.alpha = Const.darkAlpha
        
        if !indicator.isAnimating { indicator.startAnimating() }
        indicator.startAnimating()
    }
    
    private func stopAnimation() {
        
        if indicator.isAnimating { indicator.stopAnimating() }
        indicator.stopAnimating()
        
        self.view.alpha = Const.defaultAlpha
    }
}

// MARK: Alertor
extension HomeWork4ViewController {
    
    private func showAlert() {
        
        let alert = UIAlertController(title: Texts.Alert.title, message: Texts.Alert.messsage, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: Texts.Alert.cancel, style: .cancel)
        let save  = UIAlertAction(title: Texts.Alert.save, style: .default) { _ in
            self.saveProcess()
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        
        present(alert, animated: true)
    }
    
    private func saveProcess() {
        self.startAnimation()
        
        guard let text = resultLabel.text, text.count > 0 else { return }
        UserDefaults.standard.set(text, forKey: directionKey)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.stopAnimation()
        }
    }
}
