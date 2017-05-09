//
//  SlippingPopTransition.swift
//  SlippingNaviController
//
//  Created by Dev.MJ on 08/05/2017.
//  Copyright © 2017 Dev.MJ. All rights reserved.
//

import UIKit

class SlippingPopTransition: NSObject {}

extension SlippingPopTransition: UIViewControllerAnimatedTransitioning {
  
  //required. Duration of the transition animation
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 0.3
  }
  
  //required. 애니메이터 객체에 전환 애니메이션을 수행하도록 지시.
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    //transitionContext : transition에 관한 정보를 포함한 컨텍스트 객체.
    //transition이 시작할 때 보이는 VC
    guard let startVC = transitionContext.viewController(forKey: .from) else { return }
    //transition이 끝난 뒤에 보이는 VC
    guard let endVC = transitionContext.viewController(forKey: .to) else { return }
    
    ///The view in which the animated transition should take place.
    let containerView = transitionContext.containerView
    if let endView = endVC.view, let startView = startVC.view {
      containerView.addSubview(endView)
      containerView.bringSubview(toFront: startView)
      endView.frame = transitionContext.finalFrame(for: endVC)
      
      let frame = CGRect(x: 0,
                         y: 0,
                         width: endVC.view.frame.width,
                         height: endVC.view.frame.height)
      UIView.animate(withDuration: transitionDuration(using: transitionContext),
                     delay: 0,
                     options: .curveLinear,
                     animations: {
                        startVC.view.frame = CGRect(x: endVC.view.frame.width,
                                                    y: startVC.view.frame.origin.y,
                                                    width: startVC.view.frame.width,
                                                    height: startVC.view.frame.height)
                    },
                     completion: { finished in
                      transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                    })
    }
  }
}
