//
//  TodayViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 7.06.2024.
//

import Foundation

final class TodayViewModel: ObservableObject {
    
    @Published var notes: [Events] = []
    
    func getNotes(date: String) async {
        let result = await API.User.getEventsByDay(date: date).fetch(responseModel: GetEventsByDayResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.notes = response.data ?? []
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteEvent(id: Int) async {
        let result = await API.User.deleteEvent(id: id).fetch(responseModel: CreateEventResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    Task {
                        await self.getNotes(date: Date().toString())
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
