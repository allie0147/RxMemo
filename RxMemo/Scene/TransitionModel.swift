//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
