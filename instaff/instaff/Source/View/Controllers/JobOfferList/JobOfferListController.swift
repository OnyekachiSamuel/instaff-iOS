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

    @IBOutlet weak var jobOfferList: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let service = RemoteJobOfferLoader(url: getURL(), client: client)
        viewModel = JobOfferListViewModel(service: service)
        viewModel?.getJobOffers()
        setupViews()

        viewModel?
            .offers
            .observe(on: MainScheduler.instance)
            .bind(to: jobOfferList.rx.items(cellIdentifier: JobOfferCell.reuseIdentifier, cellType: JobOfferCell.self)) { [weak self] row, jobOffer, cell in
                let cellViewModel = JobOfferCellViewModel(jobOffer: jobOffer)
                cell.backgroundColor = self?.nextColor(index: row)
                cell.viewModel = cellViewModel
            }.disposed(by: disposeBag)

        jobOfferList.rx.modelSelected(JobOffer.self)
            .subscribe(onNext: { [weak self] model in
                guard let self = self else { return }
                let jobDetailController = self.getJobDetailController()
                let viewModel = JobDetailViewModel(jobOffer: model)
                jobDetailController.viewModel = viewModel
                self.navigationController?.pushViewController(jobDetailController, animated: true)
            }).disposed(by: disposeBag)
        
    }

    // MARK: Private Instance Properties
    private let client: URLSessionHTTPClient = URLSessionHTTPClient()
    private let disposeBag = DisposeBag()
    private var viewModel: JobOfferListViewModel?

    // MARK: Private Instance Methods
    private func setupViews() {
        title = viewModel?.title
        jobOfferList.register(UINib(nibName: "JobOfferCell", bundle: nil), forCellWithReuseIdentifier: JobOfferCell.reuseIdentifier)
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
}

extension JobOfferListController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 34
        return CGSize(width: width, height: 145)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}

