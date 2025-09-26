//
//  ApiService.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import Combine

class ApiService : NSObject {
    private let baseUrl = ""
    
    private let sourcesURL = URL(string: "https://api.restful-api.dev/objects")!
    
        func fetchDeviceDetails(completion : @escaping ([DeviceData]) -> ()){
            URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
                if let error = error {
                    print("Network error: \(error.localizedDescription)")
                    completion([]) // Return an empty array on network failure
                    return
                }
    
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    let empData = try! jsonDecoder.decode([DeviceData].self, from: data)
                    if (empData.isEmpty) {
                        completion([])
                    }
                    else{
                        completion(empData)
                    }
                }
            }.resume()
    
    
    
        }
//    func fetchDeviceDetails()->AnyPublisher<[DeviceData], Error>{
//        return URLSession.shared.dataTaskPublisher(for: sourcesURL)
//            .map(\.data)
//            .decode(type: [DeviceData].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
}
  
