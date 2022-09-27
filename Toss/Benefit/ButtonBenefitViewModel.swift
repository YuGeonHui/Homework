//
//  ButtonBenefitViewModel.swift
//  UIKitStudy
//
//  Created by geonhui Yu on 2022/09/26.
//

import Foundation

final class ButtonBenefitViewModel {

    @Published var benefit: Benefit
    @Published var benefitDetails: BenefitDetails?

    init(benefit: Benefit) {
        self.benefit = benefit
    }
    
    func fetchDetails() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.benefitDetails = .default
        }
    }
}
