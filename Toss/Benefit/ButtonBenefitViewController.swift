//
//  ButtonBenefitViewController.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/25.
//

import UIKit

class ButtonBenefitViewController: UIViewController {

    var benefit: Benefit = .today
    var benefitDetails: BenefitDetails = .default
    
    @IBOutlet weak var vStackView: UIStackView!
    @IBOutlet weak var ctaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        addGuides()
    }
    
    private func setUpUI() {
        navigationItem.largeTitleDisplayMode = .never
        
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        
        ctaButton.setTitle(benefit.ctaTitle, for: .normal)
    }
    
    private func addGuides() {
        
        let guideView: [BenefitGuideView] = benefitDetails.guides.map {
            
            let guideview = BenefitGuideView(frame: .zero)
            guideview.icon.image = UIImage(systemName: $0.iconName)
            guideview.title.text = $0.guide
            
            return guideview
        }
        
        guideView.forEach {
            self.vStackView.addArrangedSubview($0)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
}
