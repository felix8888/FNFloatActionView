//
//  FNAnimation.swift
//  VisualNote
//
//  Created by Felix Niu on 11/26/15.
//  Copyright © 2015 Felix Niu. All rights reserved.
//

import UIKit

public func basicAnimation(layer:CALayer!, fromValue:AnyObject?, toValue:AnyObject?, duration:CFTimeInterval, path:String?) {
    let animation = CABasicAnimation.init(keyPath: path)
    animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
    animation.fromValue = fromValue
    animation.toValue = toValue
    animation.duration = duration
    layer.addAnimation(animation, forKey: path)
}

public func cornerRadiusAnimation(layer:CALayer!, fromValue:CGFloat, toValue:CGFloat, duration:CFTimeInterval) {
    basicAnimation(layer, fromValue: fromValue, toValue: toValue, duration: duration, path: "cornerRadius")
    layer.cornerRadius = toValue
}
