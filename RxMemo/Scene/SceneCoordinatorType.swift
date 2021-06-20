//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable

    @discardableResult
    func close(animated: Bool) -> Completable
}