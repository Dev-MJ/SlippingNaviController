//
//  SlippingNaviController.swift
//  SlippingNaviController
//
//  Created by Dev.MJ on 09/05/2017.
//  Copyright © 2017 Dev.MJ. All rights reserved.
//

import UIKit

class SlippingNaviController: UINavigationController {
  
  ///백분율 기반 interactive transition object는 하나의 VC가 사라지고 다른 VC가 나타나는 사이에 맞춤 애니메이션을 구동합니다. 
  ///애니메이션을 설정하고 수행하기 위해 UIViewControllerAnimatedTransitioning 프로토콜을 채택한 사용자 정의 객체인 transition animator delegate를 사용합니다.
  var interactivePopTransition: UIPercentDrivenInteractiveTransition?
  
  
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
  }
}

extension SlippingNaviController: UINavigationControllerDelegate {
  
  //optional. navigationController가 VC의 view와 navigation item properties를 표시하기 바로 전에 호출됩니다.
  func navigationController(_ navigationController: UINavigationController,
                            willShow viewController: UIViewController,
                            animated: Bool) {
    self.addPanguesture(viewController: viewController)
  }
  
  //optional. delegate가 VC의 transition동안 사용 할 noninteractive animator object를 return하게 하기 위해 호출 됩니다.
  //네비게이션 스택에 추가되거나 네비게이션 스택에서 제거 될 때 뷰 컨트롤러간에 custom animation transition을 제공하려는 경우 이 delegate 메서드를 구현합니다.
  //반환하는 객체는 지정된 시간 동안 지정된 유형의 작업에 대해 지정된 뷰 컨트롤러에 대해 noninteractive animation을 구성하고 수행 할 수 있어야 한다.
  func navigationController(_ navigationController: UINavigationController,
                            animationControllerFor operation: UINavigationControllerOperation,
                            from fromVC: UIViewController,
                            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    ///발생하는 transition 유형
    if operation == .pop { //navigation stack에 가장 위에 있는 vc가 제거
      return SlippingPopTransition()
    }else{
      return nil
    }
  }
  
  //optional. delegate가 VC의 transition동안 사용 할 interactive animator object를 return하게 하기 위해 호출 됩니다.
  //네비게이션 스택에 추가되거나 네비게이션 스택에서 제거 될 때 뷰 컨트롤러간에 custom interactive transition을 제공하고자 할 때 이 델리게이트 메소드를 구현합니다.
  //반환하는 객체는 transition의 상호 작용 측면을 구성해야하며 animationController 매개 변수의 객체로 작업하여 애니메이션을 시작해야합니다.
  func navigationController(_ navigationController: UINavigationController,
                            interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    if animationController.isKind(of: SlippingPopTransition.self) {
      return self.interactivePopTransition
    }else{
      return nil
    }
  }
  
  func addPanguesture(viewController: UIViewController) {
    let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
    viewController.view.addGestureRecognizer(pan)
  }
  
  func handlePanGesture(panGesture: UIPanGestureRecognizer){
    var progress = panGesture.translation(in: self.view).x / self.view.frame.width
    progress = min(1, max(0, progress))
    switch panGesture.state {
    case .began:
      self.interactivePopTransition = UIPercentDrivenInteractiveTransition()
      self.popViewController(animated: true)
    case .changed:
      self.interactivePopTransition?.update(progress)
    case .ended, .cancelled:
      if progress > 0.1 {
        self.interactivePopTransition?.finish()
      }else{
        self.interactivePopTransition?.cancel()
      }
      self.interactivePopTransition = nil
    default:
      break
    }
  }
}
