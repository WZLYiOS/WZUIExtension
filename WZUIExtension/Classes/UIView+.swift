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
    ///   - corners: corners description
    ///   - radius: radius description
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         base.layer.mask = mask
    }
}

// MARK - 渐变视图
open class WZGradientView: UIView {

    /*
     $0.startPoint = CGPoint.init(x: 0, y: 0)
     $0.endPoint = CGPoint.init(x: 1, y: 1)
     $0.colors = [UIColor.wz.hexadecimal(rgb: 0xFF4172).cgColor,UIColor.wz.hexadecimal(rgb: 0xFD3C49).cgColor]
     $0.locations = [0.0,0.5,1.0]
     $0.cornerRadius = 0
     $0.masksToBounds = true
     */
    open class WZCAGradientLayer: CAGradientLayer {
        
        public init(startPoint: CGPoint, endPoint: CGPoint, colors: [Any]?, locations: [NSNumber]?) {
            super.init()
            self.startPoint = startPoint
            self.endPoint = endPoint
            self.colors = colors
            self.locations = locations
        }
        
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    public init(layer: WZCAGradientLayer) {
        super.init(frame: CGRect.zero)
        layer.insertSublayer(layer, at: 0)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.forEach{
            ($0 as? WZCAGradientLayer)?.frame = bounds
        }
    }
}
