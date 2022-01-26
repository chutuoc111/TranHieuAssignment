//
//  TriangleView.swift
//  assignment
//
//  Created by TranMinhHieu on 1/26/22.
//

import UIKit

class TriangleView : UIView {
    var colorRadient: UIColor = .clear {
        didSet {
            drawTriangle(rect: self.frame)
        }
    }
    
    var triangleImage: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        drawTriangle(rect: rect)
    }
    
    func drawTriangle(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
        context.setFillColor(colorRadient.cgColor)
        context.closePath()
        context.fillPath()
        guard let cgImage = context.makeImage() else { return }
        guard let ciImage = convertCGImageToCIImage(inputImage: cgImage) else { return }
        triangleImage = convert(cmage: ciImage)
    }
    
    func convert(cmage:CIImage) -> UIImage? {
        let context:CIContext = CIContext(options: nil)
        guard let cmageExtent = context.createCGImage(cmage, from: cmage.extent) else { return nil }
        let image:UIImage = UIImage(cgImage: cmageExtent)
        return image
    }
    
    func convertCGImageToCIImage(inputImage: CGImage) -> CIImage! {
        return CIImage(cgImage: inputImage)
    }

}
