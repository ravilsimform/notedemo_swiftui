//
//  image_converter.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import Foundation
import SwiftUI
class ImageConverter {

    static func base64ToImage(_ base64String: String) -> UIImage? {
        guard let imageData = Data(base64Encoded: base64String) else { return nil }
        return UIImage(data: imageData)
    }

    static  func imageToBase64(_ image: UIImage) -> String? {
        return image.jpegData(compressionQuality: 1)?.base64EncodedString()
    }

}
