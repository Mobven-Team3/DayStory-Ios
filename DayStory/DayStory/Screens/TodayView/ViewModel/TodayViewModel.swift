//
//  TodayViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 7.06.2024.
//

import Foundation

final class TodayViewModel: ObservableObject {
    
    @Published var notes: [Events] = []
    @Published var summary: ImageModel?
    @Published var isImageCreateSuccessful: Bool = false
    @Published var isLoading: Bool = false
    @Published var isTodaySummaryCreated: Bool = false

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
    
    func createSummary(date: CreateDaySummaryContract) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        let result = await API.User.createDaySummary(date: date).fetch(responseModel: CreateDaySummaryResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    Task {
                        await self.getDaySummariesByDay(date: date)
                    }
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
            
            self.isLoading = false
        }
    }
    
    func getDaySummariesByDay(date: CreateDaySummaryContract) async {
        let result = await API.User.getDaySummariesByDay(date: date).fetch(responseModel: GetDaySummariesByDayResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                self.summary = response.data
                self.isImageCreateSuccessful = true
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkSummaryCreated(date: CreateDaySummaryContract) async {
        let result = await API.User.getDaySummariesByDay(date: date).fetch(responseModel: GetDaySummariesByDayResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if let imagePath = response.data?.imagePath, !imagePath.isEmpty {
                    self.isTodaySummaryCreated = true
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
