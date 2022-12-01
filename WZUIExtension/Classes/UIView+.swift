//
//  UIView+.swift
//  Pods-WZUIExtension_Example
//
//  Created by xiaobin liu on 2020/8/21.
//

import UIKit
import WZNamespaceWrappable

/// MARK: - UIView
public extension WZNamespaceWrappable where Base: UIView {

    /// 设置平滑圆角
    /// - Parameter radius: radius
    func cornerRadius(_ radius: CGFloat) {
        base.layer.cornerRadius = radius
        base.clipsToBounds = true
        if #available(iOS 13, *) {
            base.layer.cornerCurve = .continuous
        } else {
            base.layer.setValue(true, forKey: "continuousCorners")
        }
    }
    
    
    /// 圆角的设置
    /// - Parameters:
    ///   - corners: <#corners description#>
    ///   - radius: <#radius description#>
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         base.layer.mask = mask
    }
}
