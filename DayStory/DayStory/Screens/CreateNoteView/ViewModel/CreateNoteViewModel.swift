//
//  CreateNoteViewModel.swift
//  DayStory
//
//  Created by Recep Taha Aydın on 6.06.2024.
//

import Foundation

class CreateNoteViewModel: ObservableObject {

    @Published var title = ""
    @Published var note = ""
    
    @Published var isValid: Bool = false
    @Published var titleErrorMessage: String? = nil
    
    @Published var isNoteCreated: Bool? = nil
    
    func validateFields() {
        titleErrorMessage = title.count < 3 ? "Başlık en az 3 karakterden oluşmalıdır." : nil
        
        isValid = titleErrorMessage == nil
    }

    func createEvent(model: CreateEventContract) async {
        let result = await API.User.eventCreate(event: model).fetch(responseModel: CreateEventResponse.self)
        
        DispatchQueue.main.async {
            switch result {
            case let .success(response):
                if response.statusCode == 200 {
                    self.isNoteCreated = true
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
