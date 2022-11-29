//
//  custom_image.swift
//  NoteAppDemo
//
//  Created by Ravi Lakhtariya on 29/11/22.
//

import SwiftUI

enum ImageType {
    case file, network, bytes, system
}

class FetchTypeOfImage {
    var imagetype: ImageType?
    var imageString: String?
    init(imagetype:ImageType = .system, imageString: String?){
        self.imagetype = imagetype
        self.imageString = imageString
    }
    
    func getCustomImage() -> Image {
        switch self.imagetype {
        case .file:
            let customImage = CustomFileImage(imagePath: self.imageString)
            return customImage.getImage()
        case .bytes:
            let customImage = CustomJsonBytesImage(image: self.imageString ?? "")
            return customImage.getImage()
        case .network:
            let customImage = CustomSystemImage(image: self.imageString)
            return customImage.getImage()
        default:
            let customImage = CustomSystemImage(image: self.imageString)
            return customImage.getImage()
        }
    }
}
fileprivate protocol CustomImage {
    func getImage() -> Image
}


fileprivate class CustomSystemImage: CustomImage {
    var image: String?
    init(image: String?) {
        self.image = image
    }
    
    func getImage() -> Image {
        return Image(systemName: image ?? "")
    }
}


fileprivate class CustomFileImage: CustomImage {
    var image: String?
    init(imagePath:String?) {
        self.image = imagePath
    }
    
    func getImage() -> Image {
        if let loaded = UIImage(contentsOfFile: self.image ?? "") {
            return Image(uiImage: loaded)
        }
        return Image(uiImage: UIImage())
    }
}


fileprivate class CustomJsonBytesImage: CustomImage {
    var image: String?
    init(image:String?) {
        self.image = image
    }
    
    func getImage() -> Image {
        return Image(uiImage: ImageConverter.base64ToImage(image ?? "") ?? UIImage())
    }
}


//fileprivate class CustomNetworkImage: CustomImage {
//    var imageUrl: URL?
//    @ObservedObject var imageLoader:ImageLoader
//    @State var imageObject:UIImage = UIImage()
//    init(image: String ) {
//        self.imageUrl = ImageLoader(urlString:URL.init(string: image ?? ""))
//    }
//    func getImage() -> Image {
//        return Image(uiImage: imageObject)
//            .onReceive(imageLoader.didChange) { data in
//                self.imageObject = UIImage(data: data) ?? UIImage()
//            }
//    }
//}
