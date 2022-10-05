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
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unkonw", imageName: "", urlString: "", description: ""))
    
//    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    private func bind() {
       
        // input
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                
                let safari = SFSafariViewController(url: url)
                present(safari, animated: true)
                
            }.store(in: &subscriptions)
        
        // output
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
                
            }.store(in: &subscriptions)
        
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
}
