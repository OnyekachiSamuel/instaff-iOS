//
//  JobOfferCell2.swift
//  Instaff
//
//  Created by Onyekachi Ezeoke on 01/10/2021.
//

import UIKit

public final class JobOfferCell: UITableViewCell {
    public static let reuseIdentifier = "JobOfferCell"

    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var wageRangeLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var deploymentLabel: UILabel!


    public override func awakeFromNib() {
        super.awakeFromNib()
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
        jobTypeLabel.text = viewModel.jobType
        cityLabel.text = viewModel.jobOfferCity
        durationLabel.text = viewModel.date
        wageRangeLabel.text = viewModel.wageRange
        salaryLabel.text = viewModel.estimatedSalary
        deploymentLabel.text = viewModel.deploymentAddress
    }

    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
