//
//  ServiceManager.swift
//  SwiftAssignment
//
//  Created by Dipendra Dubey on 23/01/20.
//  Copyright © 2020 Dipendra. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager{
    
    //Alomfire tutorial https://codewithchris.com/alamofire/
    
    //https://stackoverflow.com/questions/14321033/ios-nsjsonserialization-unable-to-convert-data-to-string-around-character
    //For parsing use above
    func fetchData<T: Codable>(_ apiPath: String, completionHandler:@escaping (Result<T,Error>)->()){
        AF.request("https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json").responseData(completionHandler: { data in
            if (data.error != nil){
                completionHandler(.failure(data.error!))
                return
            }
            
            let data = String(decoding: data.data!, as: UTF8.self).data(using: .utf8)
            let jsonDecoder = JSONDecoder()
            do{
               let info = try jsonDecoder.decode(T.self, from: data!)
                completionHandler(.success(info))
            }
            catch let error{
                completionHandler(.failure(error))
            }
        })
    }

}
