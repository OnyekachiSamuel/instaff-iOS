//
//  JobDetailController.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 24/09/2021.
//

import UIKit

final class JobDetailController: UIViewController {

    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var jobTypeLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    public var viewModel: JobDetailViewModel?

    private func setupViews() {
        view.backgroundColor = .white
        acceptButton.layer.cornerRadius = 5.0
        acceptButton.layer.masksToBounds = false
        jobTypeLabel.text = viewModel?.jobType
        jobDescriptionLabel.text = viewModel?.jobDescription
    }

    @IBAction func acceptButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
