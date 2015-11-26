//
//  FNFloatActionView.swift
//  VisualNote
//
//  Created by Felix Niu on 11/26/15.
//  Copyright © 2015 Felix Niu. All rights reserved.
//

import UIKit

public enum FNFloatActionViewDisplayType {
    case FullSize
    case SimpleSize
}

public protocol FNFloatActionViewDelegate {
    func floatActionViewDidTapped()
}

public class FNFloatActionView: UIView {
    
    private let _iconView = UIImageView.init()
    private let _label = UILabel.init()
    private let _duration: NSTimeInterval = 0.3
    
    private var _originalCornerRadius:CGFloat = 0
    private var _originalWidth:CGFloat = 0
    private var _displayType: FNFloatActionViewDisplayType = FNFloatActionViewDisplayType.FullSize
    
    public var iconView:UIImageView {
        get {
            return self._iconView
        }
    }
    
    public var label:UILabel {
        get {
            return self._label
        }
    }
    
    public var displayType:FNFloatActionViewDisplayType {
        get {
            return self._displayType
        }
        set {
            if (self._displayType == newValue) {
                return
            }
            self._displayType = newValue
            if (self._displayType == FNFloatActionViewDisplayType.FullSize) {
                self.fullSizeAnimation()
            }
            else {
                self.simpleSizeAnimation()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        _iconView.translatesAutoresizingMaskIntoConstraints = false
        _label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(_iconView)
        self.addSubview(_label)
        self.layoutViews()
    }
    
    private func layoutViews() {
        let views = ["iconView":_iconView, "label":_label]
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-8-[iconView]-8-[label]-8-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-8-[iconView]-8-|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: views))
        self.addConstraint(NSLayoutConstraint.init(item: _iconView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: _iconView, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: NSLayoutFormatOptions.DirectionLeadingToTrailing, metrics: nil, views: views))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func fullSizeAnimation() {
        cornerRadiusAnimation(self.layer,
            fromValue: self.layer.cornerRadius,
            toValue: self._originalCornerRadius,
            duration: _duration)
        UIView.animateWithDuration(_duration) { () -> Void in
            var newFrame = self.frame
            newFrame.size.width = self._originalWidth;
            self.frame = newFrame;
        }
    }
    
    public func simpleSizeAnimation() {
        self._originalCornerRadius = self.layer.cornerRadius
        self._originalWidth = CGRectGetWidth(self.frame)
        cornerRadiusAnimation(self.layer,
            fromValue: self._originalCornerRadius,
            toValue: CGRectGetHeight(self.frame) / 2.0,
            duration: _duration)
        UIView.animateWithDuration(_duration) { () -> Void in
            var newFrame = self.frame
            newFrame.size.width = newFrame.size.height;
            self.frame = newFrame;
        }
    }
}
