//
//  ViewController.swift
//  assignment
//
//  Created by TranMinhHieu on 1/26/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redTriangleView: TriangleView!
    @IBOutlet weak var blueTriangleView: TriangleView!
    
    var context = CIContext(options: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        redTriangleView.colorRadient = .bernRed
        blueTriangleView.colorRadient = .blueJeans
    }
    
}

//MARK: - Blur image
extension ViewController {
    private func blurImage(img: UIImage) -> UIImage {
        
        let currentFilter = CIFilter(name: "CIGaussianBlur")
        let beginImage = CIImage(image: img)
        currentFilter!.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter!.setValue(40, forKey: kCIInputRadiusKey)

        let cropFilter = CIFilter(name: "CICrop")
        cropFilter!.setValue(currentFilter!.outputImage, forKey: kCIInputImageKey)
        cropFilter!.setValue(CIVector(cgRect: beginImage!.extent), forKey: "inputRectangle")

        let output = cropFilter!.outputImage
        let cgimg = context.createCGImage(output!, from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        return processedImage
    }
}

