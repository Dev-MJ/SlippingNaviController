//
//  SlippingNaviController.swift
//  SlippingNaviController
//
//  Created by Dev.MJ on 09/05/2017.
//  Copyright © 2017 Dev.MJ. All rights reserved.
//

import UIKit

class SlippingNaviController: UINavigationController {
  
  ///백분율 기반 interactive transition object는 하나의 VC가 사라지고 다른 VC가 나타나는 사이에 맞춤 애니메이션을 구동합니다. 애니메이션을 설정하고 수행하기 위해 UIViewControllerAnimatedTransitioning 프로토콜을 채택한 사용자 정의 객체인 transition animator delegate를 사용합니다.
  var interactivePopTransition: UIPercentDrivenInteractiveTransition?
  
  
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.delegate = self
  }
}

extension SlippingNaviController: UINavigationControllerDelegate {
  
  
  func addPanguesture(viewController: UIViewController) {
    
  }
  
  //optional. navigationController가 VC의 view와 navigation item properties를 표시하기 바로 전에 호출됩니다.
  func navigationController(_ navigationController: UINavigationController,
                            willShow viewController: UIViewController,
                            animated: Bool) {
    self.addPanguesture(viewController: viewController)
  }
  
  //optional. delegate가 VC의 transition동안 사용 할 noninteractive animator object를 return하게 하기 위해 호출 됩니다.
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
}
