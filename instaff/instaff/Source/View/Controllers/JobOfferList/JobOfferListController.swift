//
//  JobOfferListController.swift
//  instaff
//
//  Created by Onyekachi Ezeoke on 23/09/2021.
//

import UIKit
import RxCocoa
import RxSwift

final class JobOfferListController: UIViewController {

    @IBOutlet weak var jobOfferList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = RemoteJobOfferLoader(url: getURL(), client: client)
        viewModel = JobOfferListViewModel(service: service)
        viewModel?.getJobOffers()
        setupViews()

        viewModel?
            .offers.observe(on: MainScheduler.instance)
            .bind(to: jobOfferList.rx.items(cellIdentifier: JobOfferCell.reuseIdentifier, cellType: JobOfferCell.self)) { [weak self] row, jobOfferDetail, cell in
                let cellViewModel = JobOfferCellViewModel(jobOfferDetail: jobOfferDetail)
                cell.backgroundColor = self?.nextColor(index: row)
                cell.viewModel = cellViewModel
            }.disposed(by: disposeBag)

        jobOfferList.rx.modelSelected(JobOfferDetail.self)
            .subscribe(onNext: { [weak self] jobOfferDetail in
                guard let self = self else { return }
                let jobDetailController = self.getJobDetailController()
                jobDetailController.delegate = self
                let viewModel = JobDetailViewModel(jobOfferDetail: jobOfferDetail)
                jobDetailController.viewModel = viewModel
                self.navigationController?.pushViewController(jobDetailController, animated: true)
            }).disposed(by: disposeBag)

        jobOfferList.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
            guard let self = self, let cell = self.jobOfferList.cellForRow(at: indexPath) as? JobOfferCell,
            let jobOfferDetail = cell.viewModel?.jobOfferDetail else {
                return
            }
            self.deleteJobOffer(jobOfferDetail)
        }).disposed(by: disposeBag)
        
    }

    // MARK: Private Instance Properties
    private let client: URLSessionHTTPClient = URLSessionHTTPClient()
    private let disposeBag = DisposeBag()
    private var viewModel: JobOfferListViewModel?

    // MARK: Private Instance Methods
    private func setupViews() {
        title = viewModel?.title
        jobOfferList.register(UINib(nibName: "JobOfferCell", bundle: nil), forCellReuseIdentifier: JobOfferCell.reuseIdentifier)
        jobOfferList.rx.setDelegate(self).disposed(by: disposeBag)
    }

    private func getJobDetailController() -> JobDetailController {
        let jobDetailBoard = UIStoryboard(name: "Main", bundle: nil)
        let jobDetailController = jobDetailBoard.instantiateViewController(identifier: "JobDetailControllerID") as! JobDetailController
        return jobDetailController
    }

    private func nextColor(index: Int) -> UIColor {
        let count = index % 5
        switch count {
        case 0:
            return UIColor.customPurple
        case 1:
            return UIColor.lightBlue
        case 2:
            return UIColor.seaBlue
        case 3:
            return UIColor.darkBlue
        default:
            return UIColor.lightPurple
        }
    }

    private func deleteJobOffer(_ jobOfferDetail: JobOfferDetail) {
        viewModel?.remove(jobDetail: jobOfferDetail, completion: {[weak self] in
            guard let self = self else {
                return
            }
            self.viewModel?.getJobOfferDetails()
        })
    }
}

extension JobOfferListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}

extension JobOfferListController: JobDetailControllerDelegate {
    func didAcceptJobOffer(jobDetail: JobOfferDetail) {
        deleteJobOffer(jobDetail)
    }
}

