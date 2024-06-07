import SwiftUI

struct SignupPersonalView: View {
    
    @StateObject private var viewModel = SignupPersonalViewModel()
    let gender = ["Kadın", "Erkek", "Belirtme", "Diğer"]
    let date = Date()
    var dateClosedRange: ClosedRange<Date> {
        let currentYear = Calendar.current.component(.year, from: Date())
        let calendar = Calendar.current
        let maxDate = calendar.date(from: DateComponents(year: currentYear - 5, month: 12, day: 31))!
        let minDate = calendar.date(from: DateComponents(year: currentYear - 100, month: 1, day: 1))!
        return minDate...maxDate
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        SignupSectionView(firstScreen: true)
                        
                        AuthenticationHelperText(text: "Kişisel Bilgilerinizi Giriniz.")
                        
                        Form {
                            DayStoryTextField(text: $viewModel.name,
                                              title: "İsim",
                                              placeholder: "İsminizi Yazınız",
                                              errorMessage: viewModel.nameErrorMessage,
                                              textLimit: 50)
                            .padding(.vertical)
                            
                            DayStoryTextField(text: $viewModel.lastName,
                                              title: "Soyisim",
                                              placeholder: "Soyisminizi Yazınız",
                                              errorMessage: viewModel.lastNameErrorMessage,
                                              textLimit: 50)
                        }
                        .formStyle(.columns)
                        
                        genderPicker
                        
                        datePicker
                    }
                    .toolbar {
                        DayStoryToolbar()
                    }
                    .padding([.trailing, .leading], 10)
                }
                
                VStack {
                    NavigationLink(destination: SignupAccountView(name: viewModel.name,
                                                                  lastName: viewModel.lastName,
                                                                  gender: viewModel.selectedGender,
                                                                  birthDay: viewModel.dateOfBirth.toString()),
                                   isActive: $viewModel.isValid) {}
                    
                    Button(action: {
                        viewModel.validateFields()
                    }) {
                        GradientButton(title: "Devam")
                    }
                    .padding(.bottom, 10)
                    
                    LoginPrompt(promptText: "Zaten bir hesabın var mı?",
                                linkText: "Giriş Yap",
                                linkDestination: LoginView())
                }
                .padding(.bottom, 10)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

// MARK: - Views
private extension SignupPersonalView {
    var genderPicker: some View {
        HStack(alignment: .top) {
            Text("Cinsiyet")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .foregroundStyle(viewModel.genderErrorMessage == nil ? .black : .red)
            
            Picker("Seçiniz", selection: $viewModel.selectedGender) {
                Text("Seçiniz").tag("")
                ForEach(gender, id: \.self) { gender in
                    Text(gender).tag(gender)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(width: 125)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.top, -8)
        }
        .padding()
        .overlay(alignment: .bottomLeading) {
            if let errorMessage = viewModel.genderErrorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.red)
                    .padding([.leading, .top], 16)
            }
        }
    }
    
    var datePicker: some View {
        DatePicker(
            "Doğum Tarihi",
            selection: $viewModel.dateOfBirth,
            in: dateClosedRange,
            displayedComponents: [.date]
        )
        .environment(\.locale, Locale.init(identifier: "tr"))
        .font(.subheadline)
        .padding()
        .datePickerStyle(.compact)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignupPersonalView()
    }
}
