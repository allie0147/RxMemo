//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/21.
//

import Foundation
import RxSwift
import RxCocoa

/// viewModel 의존성 주입 class
class CommonViewModel: NSObject {
    /// navigation title
    let title: Driver<String>

    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorageType

    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: " ")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}

