//
//  WZGradientButton.swift
//  Created on 2022/12/8
//  Description <#文件描述#>
//  PD <#产品文档地址#>
//  Design <#设计文档地址#>
//  Copyright © 2022 WZLY. All rights reserved.
//  @author 邱啟祥(739140860@qq.com)   
//

import UIKit

// MARK - 渐变视图
open class WZGradientButton: UIButton {

    /*
     $0.startPoint = CGPoint.init(x: 0, y: 0)
     $0.endPoint = CGPoint.init(x: 1, y: 1)
     $0.colors = [UIColor.wz.hexadecimal(rgb: 0xFF4172).cgColor,UIColor.wz.hexadecimal(rgb: 0xFD3C49).cgColor]
     $0.locations = [0.0,0.5,1.0]
     $0.cornerRadius = 0
     $0.masksToBounds = true
     */
    /// 渐变层
    open class WZButtonCAGradientLayer: CAGradientLayer {
        
        public enum SelectType {
        case normal
        case select
        }
        
        /// 样式
        public var cType: SelectType = .normal
        
        public init(type: SelectType) {
            super.init()
            self.cType = type
        }
        
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    override open var isSelected: Bool {
        didSet {
            
            layer.sublayers?.forEach {
                let item = ($0 as? WZButtonCAGradientLayer)
                item?.isHidden = item?.cType == .normal ? isSelected : !isSelected
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // 添加渐变层
    public func builder(layers: [WZButtonCAGradientLayer]){
        layers.forEach {
            layer.insertSublayer($0, at: 0)
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.forEach {
            ($0 as? WZButtonCAGradientLayer)?.frame = bounds
        }
    }
}

