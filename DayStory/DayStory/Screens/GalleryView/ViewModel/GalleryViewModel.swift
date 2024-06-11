//
//  GalleryViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 11.06.2024.
//

import Foundation

final class GalleryViewModel: ObservableObject {
    
    @Published var summaries: [ImageModel]?
    
    func getAllSummaries() async {
        let result = await API.User.getAllSummaries.fetch(responseModel: GetAllSummariesResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.summaries = response.data
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
