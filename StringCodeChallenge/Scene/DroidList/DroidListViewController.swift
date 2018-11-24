//
//  DroidListViewController.swift
//  StringCodeChallenge
//
//  Created by BinaryBoy on 11/20/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DroidListViewController: BaseViewController {
    var viewModel: DroidListViewModel!
    var router: DroidListRouter!

    @IBOutlet weak var droidTableView: UITableView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx(viewModel: viewModel)
        
        
        setupCellSelect()
    }
    override func setupRx(viewModel: BaseViewModel){
        super.setupRx(viewModel: viewModel)
        
        self.viewModel.droisObservable.bind(to: self.droidTableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
 
            
            switch element {
                
            case .droid(let cellViewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: DroidCell.id, for: indexPath) as? DroidCell else {
                    return UITableViewCell()
                }
                cell.droid = cellViewModel
                cell.selectionStyle = .none
                return cell
            case .error(let message):
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = message
                return cell
            case .empty:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = "No data available"
                return cell
            }
            }.disposed(by: self.disposeBag)
        
        
    }
    
    
    private func setupCellSelect() {
        droidTableView
            .rx
            .modelSelected(DroidTableViewCellType.self)
            .subscribe(
                onNext: { [weak self] droidTableViewCellType in
                    if case let DroidTableViewCellType.droid(cellViewModel) = droidTableViewCellType {
                        self?.router.navigateToDroidControl(droid: cellViewModel)
                    }

                    if let selectedRowIndexPath = self?.droidTableView.indexPathForSelectedRow {
                        self?.droidTableView?.deselectRow(at: selectedRowIndexPath, animated: true)
                    }
                }
            )
            .disposed(by: disposeBag)
    }

}
