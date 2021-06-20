//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>

    @discardableResult
    func memoList() -> Observable<[Memo]>

    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>

    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
