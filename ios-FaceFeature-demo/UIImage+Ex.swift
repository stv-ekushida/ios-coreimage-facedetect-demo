//
//  UIImage+Ex.swift
//  ios-FaceFeature-demo
//
//  Created by Eiji Kushida on 2017/06/19.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

extension UIImage {

    func cropping(to: CGRect) -> UIImage? {
        var opaque = false
        if let cgImage = cgImage {
            switch cgImage.alphaInfo {
            case .noneSkipLast, .noneSkipFirst:
                opaque = true
            default:
                break
            }
        }

        UIGraphicsBeginImageContextWithOptions(to.size, opaque, scale)
        draw(at: CGPoint(x: -to.origin.x, y: -to.origin.y))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
