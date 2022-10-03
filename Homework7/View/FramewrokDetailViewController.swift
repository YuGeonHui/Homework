//
//  FramewrokDetailViewController.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/30.
//

import UIKit
import Combine
import SafariServices

class FramewrokDetailViewController: UIViewController {

    var subscriptions = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    
    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    private func bind() {
        bindInput()
        bindOutput()
    }
    
    private func bindInput() {
        
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                
                guard let url = URL(string: framework.urlString) else {
                    return
                }
                
                let safari = SFSafariViewController(url: url)
                present(safari, animated: true)
            }.store(in: &subscriptions)
    }
    
    private func bindOutput() {
        
        $framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
                
            }.store(in: &subscriptions)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        didSelect.send(framework)
    }
}
