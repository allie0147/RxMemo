//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation
import RxSwift

// 메모리에 메모를 저장함.
class MemoryStorage: MemoStorageType {
    private var list = [
        // dummy
        Memo(
            content: "Hello, RxSwift",
            insertDate: Date().addingTimeInterval(-10)
        ),
        Memo(
            content: "Lorem Ipsum",
            insertDate: Date().addingTimeInterval(-20))
    ]

    private lazy var store = BehaviorSubject<[Memo]>(value: list)

    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)

        store.onNext(list)

        return Observable.just(memo)
    }

    @discardableResult
    func memoList() -> Observable<[Memo]> { // subject에 접근방법
        return store
    }

    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        store.onNext(list)
        return Observable.just(updated)
    }

    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        store.onNext(list)
        return Observable.just(memo)
    }
}
