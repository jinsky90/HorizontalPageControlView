//
//  HorizontalPageControlView.swift
//  HorizontalPageControlView
//
//  Created by 진하늘 on 30/07/2019.
//  Copyright © 2019 YoungSu Park. All rights reserved.
//

import UIKit

class HorizontalPageControlView: UIView {
    @IBInspectable var selectedColor: UIColor? {
        didSet {
            self.setNeedsDisplay()
        }
    }

    var totalPageCount  : Int = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }

    var indicatorOffset : CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    var selectedPosition: Int {
        get { return Int(round(self.indicatorOffset)) }
        set { self.indicatorOffset = CGFloat(newValue) }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard self.totalPageCount > 0 else { return }
        
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        let width = self.bounds.width / CGFloat(self.totalPageCount)
        let xPosition = self.indicatorOffset * width
        let drawRect = CGRect(x: xPosition, y: 0, width: width, height: self.bounds.height)
        let clipPath = UIBezierPath(roundedRect: drawRect, cornerRadius: self.layer.cornerRadius).cgPath
        
        context?.addPath(clipPath)
        context?.setFillColor(self.selectedColor?.cgColor ?? UIColor.black.cgColor)
        context?.closePath()
        context?.fillPath()
    }
}
