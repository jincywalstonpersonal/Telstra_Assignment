//
//  DataViewModel.swift
//  Telstra_Assignment
//
//  Created by mac_admin on 1/22/19.
//  Copyright © 2019 mac_admin. All rights reserved.
//

import Foundation

class DataViewModel {
    var listResponse: DynamicType<ListResponse> = DynamicType<ListResponse>()
    var details: DynamicType<Details> = DynamicType()
    var error: DynamicType<Error> = DynamicType()
  //Fetch Data
func fetchData() {
    ManagerClass.sharedInstance.fetchData { (details, error) in
        print (details ?? "")
        if let error = error {
            print ("Error while fetching data \(error)")
            self.error.value = error
            
        } else {
            if let details = details {
                self.listResponse.value =  details
            }
        }
    }
  }
}
