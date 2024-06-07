//
//  TodayViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 7.06.2024.
//

import Foundation

final class TodayViewModel: ObservableObject {
    
    @Published var notes: [GetEventsByDayResponse]?
    
    func createEvent(model: GetEventsByDayContract) async {
        let result = await API.User.getEventsByDay(date: model).fetch(responseModel: GetEventsByDayResponse.self)
        
        switch result {
        case let .success(response):
            DispatchQueue.main.async {
                print(response)
            }
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}
