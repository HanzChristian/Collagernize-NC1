//
//  OnboardingCollectionViewCell.swift
//  Collegernize-NC1
//
//  Created by Hanz Christian on 27/04/22.
//

import UIKit


class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescLabel: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    
    func setup( slide: OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescLabel.text = slide.description
    }
    
}
