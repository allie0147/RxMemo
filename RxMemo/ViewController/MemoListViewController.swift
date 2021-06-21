//
//  MemoListViewController.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import UIKit
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {

    var viewModel: MemoListViewModel!

    @IBOutlet weak var listTableView: UITableView!

    @IBOutlet weak var addButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // viewModel - view binding
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)

        viewModel.memoList
            .bind(to: listTableView
            .rx
            .items(
            cellIdentifier: "cell"
        )) { row, memo, cell in
            cell.textLabel?.text = memo.content
        }.disposed(by: rx.disposeBag)
    }
}
