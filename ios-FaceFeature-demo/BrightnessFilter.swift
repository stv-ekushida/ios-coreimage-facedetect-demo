//
//  BrightnessFilter.swift
//  ios-FaceFeature-demo
//
//  Created by Eiji Kushida on 2017/06/19.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Foundation
import CoreImage

protocol Filter {
    var inputImage: CIImage { get }
    var outputImage: CIImage? { get }

    init(inputImage: CIImage)
}

struct PixellationFilter : Filter {
    let inputImage: CIImage
    var inputFactor: CGFloat
    var inputCenter: CIVector

    init(inputImage: CIImage) {
        self.inputImage = inputImage
        self.inputFactor = 20

        let inputImageSize = inputImage.extent.size
        self.inputCenter = CIVector(
            x: inputImageSize.width / 2,
            y: inputImageSize.height / 2
        )
    }

    var outputImage: CIImage? {
        let inputImageSize = inputImage.extent.size
        let inputScale = max(inputImageSize.width, inputImageSize.height) / inputFactor
        return inputImage.applyingFilter(
            "CIPixellate",
            withInputParameters: [
                kCIInputScaleKey: inputScale,
                kCIInputCenterKey: inputCenter
            ]
        )
    }
}
