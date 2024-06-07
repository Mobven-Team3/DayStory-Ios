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
    
    func validateFields() {
        titleErrorMessage = title.count < 3 ? "Başlık en az 3 karakterden oluşmalıdır." : nil
        
        isValid = titleErrorMessage == nil
    }

    func createEvent(model: CreateEventContract) async {
        let result = await API.User.eventCreate(event: model).fetch(responseModel: SignupResponseModel.self)
        
        switch result {
        case let .success(response):
            DispatchQueue.main.async {
                print(response.message)
            }
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
}
