//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType // generic

    var viewModel: ViewModelType! { get set }

    func bindViewModel()
}
extension ViewModelBindableType where Self: UIViewController {
    /// 자동으로 bindViewModel 호출: Scene 전환 시 호출
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}
