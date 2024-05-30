import SwiftUI

struct SignupPersonalView: View {
    
    @State private var name: String = ""
    @State private var lastName: String = ""
    @State private var selectedGender: String = ""
    @State private var dateOfBirth: Date = Date()
    
    let gender = ["Kadın", "Erkek", "Belirtme"]
    
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }
    
    @State private var selectedFlavor: Flavor = .chocolate
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack {
                        SignupSectionView(firstScreen: true)
                        
                        AuthenticationHelperText(text: "Kişisel Bilgilerinizi Giriniz.")
                        
                        Form {
                            DayStoryTextField(text: $name,
                                              title: "İsim",
                                              placeholder: "İsminizi Yazınız")
                            .padding(.vertical)
                            
                            DayStoryTextField(text: $lastName,
                                              title: "Soyisim",
                                              placeholder: "Soyisminizi Yazınız")
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
                    NavigationLink(destination: SignupAccountView()) {
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
        HStack {
            Text("Cinsiyet")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
            
            Picker("Seçiniz", selection: $selectedGender) {
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
    }
    
    var datePicker: some View {
        DatePicker(
            "Doğum Tarihi",
            selection: $dateOfBirth,
            displayedComponents: [.date]
        )
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
