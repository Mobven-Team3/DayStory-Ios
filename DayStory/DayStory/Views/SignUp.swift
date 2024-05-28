//
//  SignUp.swift
//  DayStory
//
//  Created by Mobven on 24.05.2024.
//

import SwiftUI

struct SignUp: View {
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var selectedGender: String = ""
    @State private var dateOfBirth: Date = Date()
    
    let gender = ["","Kadın", "Erkek", "Diğer"]
    
    var body: some View {
        
        VStack {
            HStack(spacing: 0) {
                Text("Day")
                    .font(.largeTitle)
                    .fontWeight(.medium)
                    .foregroundColor(Color.dayStoryTextColor)
                Text("Story")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                    .foregroundColor(.dayStoryTextColor)
            }
            //            TextField("İsminizi yazınız", text: $name)
            //                .border(Color.borderColor)
            //                .frame(height: 100)
            //                .cornerRadius(4)
            //            //                    .padding(.all, 0)
            //            //                    .font(.system(size: 30, weight: .regular))
            //
            //            //            Spacer()
            Form{
                VStack(alignment: .leading, spacing: 40){
                    HStack {
                        Text("Kişisel bilgilerinizi giriniz")
                            .fontWeight(.medium)
                        //                            .frame(width: 250, height: 24)
                            .multilineTextAlignment(.leading)
                        
                    }
                    //                    Text("İsim")
                    //                        .frame(width: 335, height: 100)
                    
                    ZStack(alignment: .trailing) {
                        TextField("İsminizi yazınız", text: $name)
                            .padding()
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                            )
                            .foregroundColor(.borderColor)
                            .textInputAutocapitalization(.never)
                        
                        Button{
                            name = ""
                        } label: {
                            Image(systemName: "x.circle")
                                .imageScale(.large)
                                .frame(width: 44, height: 44)
                                .foregroundColor(.dayStoryTextColor)
                            
                        }
                    }
                    
                    //                            .padding(.top,-89)
                    //                    Text("Soyisim")
                    ZStack(alignment: .trailing) {
                        TextField("Soyisminizi yazınız", text: $lastName)
                            .padding()
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1)
                            )
                            .foregroundColor(.borderColor)
                            .textInputAutocapitalization(.never)
                        Button{
                            name = ""
                        } label: {
                            Image(systemName: "x.circle")
                                .imageScale(.large)
                                .frame(width: 44, height: 44)
                                .foregroundColor(.dayStoryTextColor)
                        }
                        
                    }
                    
                    HStack{
                        VStack{
                            //                         Section{
                            //                        Text("Cinsiyet")
                            //                            .multilineTextAlignment(.leading)
                            if #available(iOS 17.0, *) {
                                Picker("Seçiniz:", selection: $selectedGender){
                                    ForEach(gender, id: \.self) {
                                        Text($0)
                                    }
                                    //                                ForEach(0..<gender.count, id: \.self) {
                                    //                                    index in
                                    //                                    Text(self.gender[index]).tag(index).font(.title)
                                    
                                    
                                }
                                .onChange(of: selectedGender) { oldValue, newValue in
                                    print(newValue)
                                }
                                
                                .padding()
                                .cornerRadius(4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundColor(.borderColor)
                                .textInputAutocapitalization(.never)
                            } else {
                                // Fallback on earlier versions
                            }
//                            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.borderColor))
//                            .listSectionSeparator(.hidden)
                            
                            //                            }
                        }
                        VStack{
                            //                        Text("Doğum tarihi")
                            DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                                .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.white))
                                .datePickerStyle(.compact)
                                .tint(.dayStoryTextColor)
               
                        }
                        .padding()
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.borderColor)
                                .textInputAutocapitalization(.never)
                        )
                    } .padding(.vertical)
                }
               
                .formStyle(.automatic)
                Spacer()
                Button {
                } label: {
                    Text("Devam")
                        .foregroundColor(.white)
                        .font(.body)
                }
                .padding(.all)
                .frame(width: 351, height: 46)
                .background(LinearGradient(colors: [.buttonColor2, .buttonColor1], startPoint: .leading, endPoint: .trailing))
                .cornerRadius(50)
                HStack{
                    Text("Zaten bir hesabın var mı?")
                        .foregroundColor(.buttonColor1)
                    Button{
                        
                    } label: {
                        Text("Giriş yap")
                            .foregroundColor(.buttonColor1)
                            .fontWeight(.medium)
                            .underline()
                            .padding(-5)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

