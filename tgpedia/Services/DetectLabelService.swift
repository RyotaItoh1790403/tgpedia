//
//  DetectLabelService.swift
//  tgpedia
//
//  Created by ryota itoh on 2019/10/02.
//  Copyright © 2019 ryota itoh. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class DetectLabelService {
    
    func getDetectedLabel(image: UIImage, completion: DetectedLabel) -> (){
        
        guard let url = URL(string: "https://sqsa6asw0c.execute-api.us-east-2.amazonaws.com/dev") else {
            fatalError("invalid url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = image.jpegData(compressionQuality: 1.0)
        
        URLSession.shared.dataTask(with: request){data, response, error in
            
            guard let data = data, error == nil else{
                DispatchQueue.main.async {
//                    completion(nil)
                }
                return
            }
            print(data)
            let detectedLabel = try? JSONDecoder().decode(DetectedLabel.self, from: data)
            print(detectedLabel)
            DispatchQueue.main.async{
//                completion(detectedLabel?)
            }
            
        }.resume()
        
    }
}
