//
//  Swift-Extensions.swift
//  Anime Dating App
//
//  Created by Teneala Spencer on 6/9/21.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView{
    
    func loadImagesUsingCacheWithUrlString(urlString: String){
        
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as?
            
            UIImage{
            
            self.image = cachedImage
            
            return
            
        }
        
        if let url = URL(string: urlString){
            
            URLSession.shared.dataTask(with: url , completionHandler: {( data, response, error) in
                
                if error != nil && data == nil{
                    print(error)
                }
                
                else{
                    DispatchQueue.main.async {
                        if let downloadedImage = UIImage(data: data!){
                            imageCache.setObject(downloadedImage, forKey: (urlString as AnyObject))
                            self.image = self.addContrast(originalImage: UIImage(data: data!)!)
                        }
                    }
                }
            }).resume()
        }
    }
    
    func addContrast(originalImage: UIImage) -> UIImage {
        
        guard let inputImage = CIImage(image: originalImage),
        let filter = CIFilter(name: "CIExposureAdjust") else { return originalImage}

        // The inputEV value on the CIFilter adjusts exposure (negative values darken, positive values brighten)
        filter.setValue(inputImage, forKey: "inputImage")
        filter.setValue(-1.5, forKey: "inputEV")

        // Break early if the filter was not a success (.outputImage is optional in Swift)
        guard let filteredImage = filter.outputImage else { return originalImage }

        let context = CIContext(options: nil)
        let outputImage = UIImage(cgImage: context.createCGImage(filteredImage, from: filteredImage.extent)!)

        return outputImage // use the filtered UIImage as required.

    }
}
