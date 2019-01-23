//
//  ManagerClass.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/22/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public struct ManagerClass {
    
    static let sharedInstance = ManagerClass()
    
    func fetchData(handler:@escaping (ListResponse?, NSError? ) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let URL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        Alamofire.request(URL).responseObject { (response: DataResponse<ListResponse>) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
            case .success:
                let listResponse = response.result.value
                print(listResponse?.title ?? "")
                
                if let details = listResponse?.rows {
                    for listDetails in details {
                        print(listDetails.title ?? "")
                        print(listDetails.description ?? "")
                        print(listDetails.imageHref ?? "")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
