//
//  JobDetailController.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import UIKit

public protocol JobDetailControllerDelegate: AnyObject {
    func didAcceptJobOffer(jobDetail: JobOfferDetail)
}

final class JobDetailController: UIViewController {

    @IBOutlet weak var estimatedSalary: UILabel!
    @IBOutlet weak var wageRange: UILabel!
    @IBOutlet weak var dateOfOffer: UILabel!
    @IBOutlet weak var jobHours: UILabel!
    @IBOutlet weak var jobCity: UILabel!
    @IBOutlet weak var deploymentAddress: UILabel!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var companyRating: UILabel!
    @IBOutlet weak var jobDescription: UILabel!

    @IBOutlet weak var acceptButton: UIButton!

    weak var delegate: JobDetailControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    public var viewModel: JobDetailViewModel?

    private func setupViews() {
        acceptButton.layer.cornerRadius = 5.0
        acceptButton.layer.masksToBounds = false
        estimatedSalary.text = viewModel?.estimatedSalary
        wageRange.text = viewModel?.wageRange
        dateOfOffer.text = viewModel?.date
        jobHours.text = viewModel?.jobHours
        jobCity.text = viewModel?.jobOfferCity
        deploymentAddress.text = viewModel?.deploymentAddress
        jobDescription.text = viewModel?.jobDescription
    }

    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        guard let jobOfferDetail = viewModel?.jobOfferDetail else {
            return
        }
        delegate?.didAcceptJobOffer(jobDetail: jobOfferDetail)
        navigationController?.popViewController(animated: true)
    }
}
