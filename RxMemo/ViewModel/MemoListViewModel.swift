//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    /// tableView binding object
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}
