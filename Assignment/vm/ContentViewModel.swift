//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
import Combine

class ContentViewModel : ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    
    
    
        func fetchAPI() {
            apiService.fetchDeviceDetails(completion: { item in
                self.data = item
            })
        }
    
//    func fetchAPI(){
//        apiService.fetchDeviceDetails()
//            .sink{ completion in
//                switch completion{
//                case .finished:
//                    print("finished")
//                case .failure:
//                    print("error loading")
//                }
//                
//            }  receiveValue:{
//                [weak self] data in
//                self?.data = data
//            }
//            .store(in: &cancellables)
//    }

    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
