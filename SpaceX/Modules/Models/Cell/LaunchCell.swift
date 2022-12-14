//
//  LaunchCell.swift
//  SpaceX
//
//  Created by Paul Matar on 03/11/2022.
//

import UIKit

final class LaunchCell: UICollectionViewCell {
    
    private let launchView = LaunchCellView()
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        let color = UIColor(named: C.Colors.skyBlue) ?? .blue
        imageView.addoverlay(color: color, alpha: 0.73)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImage.image = nil
    }
    
    func configure(with model: LaunchModel) {
        launchView.recordLabel.text = model.flightNumber
        launchView.flightNameLabel.text = model.name
        launchView.dateLabel.text = model.date
        launchView.indicatorLine.isHidden = !model.upcoming
    }
    
    private func commonInit() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
        
        backgroundImage.place(on: contentView).pin(.allEdges)
        backgroundImage.image = UIImage(named: C.Images.cellPlaceholder)
        
        launchView.place(on: contentView).pin(.allEdges(padding: 18))
    }
}
