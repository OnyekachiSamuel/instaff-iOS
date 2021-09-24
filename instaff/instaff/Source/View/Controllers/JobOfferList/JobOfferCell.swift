//
//  JobOfferCell.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import UIKit

final class JobOfferCell: UICollectionViewCell {
    public static let reuseIdentifier = "JobOfferCell"

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    public var viewModel: JobOfferCellViewModel? {
        didSet {
            bindViewModel()
        }
    }

    private func bindViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        dateLabel.text = viewModel.date
        hoursLabel.text = viewModel.hours
    }

    private func setupView() {
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
    }
}
