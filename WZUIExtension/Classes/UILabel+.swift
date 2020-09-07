//
//  UILabel+.swift
//  Pods-WZUIExtension_Example
//
//  Created by xiaobin liu on 2020/9/7.
//

import UIKit
import WZNamespaceWrappable

/// MARK - UILabel +
public extension WZNamespaceWrapper where WrappedType: UILabel {

    /// 修复LineHeight
    static func fixLineHeightAttributed(_ lineHeight: CGFloat, font: UIFont) -> [NSAttributedString.Key: Any] {
        
        let paragrapStyle = NSMutableParagraphStyle()
        
        paragrapStyle.maximumLineHeight = lineHeight
        paragrapStyle.minimumLineHeight = lineHeight
        paragrapStyle.lineBreakMode = .byTruncatingTail
        
        let baselineOffset = fixBaseline(lineHeight: lineHeight, font: font)
        
        return [.paragraphStyle: paragrapStyle,
                .baselineOffset: baselineOffset,
                .font: font]

    }
    
    /// 根据行高和字体，生成基线值
    static func fixBaseline(lineHeight: CGFloat, font: UIFont) -> CGFloat {
        let baselineOffset = (lineHeight - font.lineHeight) / 4.0
        return baselineOffset
    }
}
