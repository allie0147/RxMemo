//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 김도희 on 2021/06/20.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {

    private lazy var bag = DisposeBag()

    // view 전환 시, 필수 요건
    private var window: UIWindow
    private var currentVC: UIViewController

    required init(window: UIWindow) {
        self.window = window
        self.currentVC = window.rootViewController!
    }

    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        let subject = PublishSubject<Void>()
        let target = scene.instantiate() // view controller 가져옴
        switch style {
        case .root:
            currentVC = target
            window.rootViewController = target
            subject.onCompleted()
        case .push: // 네비게이션 사용 필수
            guard let nav = currentVC.navigationController else {
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            nav.pushViewController(target, animated: animated)
            currentVC = target
            subject.onCompleted()
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currentVC = target
        }
        return subject.ignoreElements().asCompletable()
    }

    @discardableResult
    func close(animated: Bool) -> Completable {
        return Completable.create { [unowned self]
            completable in
            if let presentingVC = self.currentVC.presentingViewController {
                self.currentVC.dismiss(animated: animated) {
                    self.currentVC = presentingVC
                    completable(.completed)
                }
            } else if let nav = self.currentVC.navigationController {
                guard nav.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                self.currentVC = nav.viewControllers.last!
                completable(.completed)
            } else {
                completable(.error(TransitionError.unknown))
            }
            return Disposables.create()
        }
    }
}
