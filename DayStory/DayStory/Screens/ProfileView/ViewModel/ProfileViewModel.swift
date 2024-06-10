//
//  ProfileViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 10.06.2024.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    
    @Published var userInfo: GetUserContract?
    
    func getUserInfos() async {
        let result = await API.User.getUser.fetch(responseModel: UserInfoResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    self.userInfo = response.data
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
