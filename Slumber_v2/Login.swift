//
//  Login.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI

fileprivate extension LinearGradient {
   static let GradientPink =
    LinearGradient(gradient: Gradient(colors:[Color("GradientPink"), Color("GradientPink_two")]),startPoint: .top,endPoint: .bottom)
    
    static let GradientOrange =
     LinearGradient(gradient: Gradient(colors:[Color("GradientOrange"), Color("GradientOrange_two")]),startPoint: .top,endPoint: .bottom)
    
    static let GradientBlue =
     LinearGradient(gradient: Gradient(colors:[Color("GradientBlue"), Color("GradientBlue_two")]),startPoint: .top,endPoint: .bottom)
    
    static let GradientGreen =
     LinearGradient(gradient: Gradient(colors:[Color("GradientGreen"), Color("GradientGreen_two")]),startPoint: .top,endPoint: .bottom)
}

struct Login: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("clock")
                Spacer()
                .edgesIgnoringSafeArea(.all)
            }
            VStack {
                Spacer()
                Spacer()
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .foregroundColor(Color("Accent_Blue_2"))
                        .padding(.bottom, 4.0)
                    HStack {
                        Text("Slumber")
                            .font(.system(size: 44))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                    UsernameInput()
                    .padding(.bottom, 8.0)
                    PasswordInput()
                    .padding(.bottom, 16.0)
                    LoginButton()
                    .shadow(color: Color("Background"), radius: 6)
                    .padding(.bottom, 16.0)
                    SignUpLink()
                    .padding(.bottom, 44.0)
                    OrLine()
                    .padding(.bottom, 16.0)
                    HStack {
                        LoginApple()
                            .shadow(color: Color("Background"), radius: 6)
                        Spacer()
                            .frame(width: 16.0)
                        LoginGoogle()
                            .shadow(color: Color("Background"), radius: 6)
                    }
                }
                Spacer()
                    .frame(height: 88.0)
            }.padding(.horizontal, 32.0).foregroundColor(.white)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct UsernameInput: View {
    @State var username: String = ""

    var body: some View {
        ZStack(alignment: .leading) {
            if username.isEmpty {
                HStack {
                    Image(systemName: "person.fill")
                        .frame(width: 36.0, height: 36.0)
                        .background(Color("Accent_Blue_2"))
                        .cornerRadius(50)
                        .shadow(color: Color("Background"), radius: 3)
                    Text("Username")
                        .foregroundColor(Color("Accent_Blue_2"))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 4)
                    Spacer()
                }
                .padding(.horizontal, 12)
            }
            HStack {
                Image(systemName: "person.fill")
                    .frame(width: 36.0, height: 36.0)
                    .background(Color("Accent_Blue_2"))
                    .cornerRadius(50)
                    .shadow(color: Color("Background"), radius: 3)
                TextField("Username", text: $username)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 4)
            }
            .padding(.horizontal, 12)
        }
        .background(Color("Background_three"))
        .cornerRadius(12)
        .shadow(color: Color("Background"), radius: 6)
    }
}

struct PasswordInput: View {
    @State var password: String = ""

    var body: some View {
        ZStack(alignment: .leading) {
            if password.isEmpty {
                HStack {
                    Image(systemName: "lock.fill")
                        .frame(width: 36.0, height: 36.0)
                        .background(Color("Accent_Blue_2"))
                        .cornerRadius(50)
                        .shadow(color: Color("Background"), radius: 3)
                    Text("Password")
                        .foregroundColor(Color("Accent_Blue_2"))
                        .padding(.vertical, 14)
                        .padding(.horizontal, 4)
                    Spacer()
                }
                .padding(.horizontal, 12)
            }
            HStack {
                Image(systemName: "lock.fill")
                    .frame(width: 36.0, height: 36.0)
                    .background(Color("Accent_Blue_2"))
                    .cornerRadius(50)
                    .shadow(color: Color("Background"), radius: 3)
                SecureField("Password", text: $password)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 4)
            }
            .padding(.horizontal, 12)
        }
        .background(Color("Background_three"))
        .cornerRadius(12)
        .shadow(color: Color("Background"), radius: 6)
    }
}

struct LoginButton: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        ZStack {
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                HStack {
                    Spacer()
                    Text("Sign In")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.vertical, 14)
                .background(LinearGradient.GradientPink)
                .cornerRadius(12)
                .onTapGesture {
                    self.settings.userflow = 2
                }
            }
        }
    }
}

struct SignUpLink: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        HStack {
            Spacer()
            Text("Don’t have an account? Sign up")
                .font(.footnote)
                .underline()
                .foregroundColor(Color("GradientPink_two"))
                .onTapGesture {
                self.settings.userflow = 1
            }
        }
    }
}

struct OrLine: View {
    var body: some View {
        ZStack{
            HStack{
                Spacer()
                    .frame(height: 1.0)
                    .background(Color("Accent_Blue_2"))
            }
            HStack{
                Spacer()
                Text("Or sign in with")
                    .font(.footnote)
                    .padding(.horizontal)
                    .background(Color("Background"))
                Spacer()
            }
        }
    }
}

struct LoginApple: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text("Sign in with Apple")
                    .font(.caption)
                    .fontWeight(.medium)
                Spacer()
            }
        }.padding(.vertical, 14)
        .background(Color.black)
        .cornerRadius(12)
        .onTapGesture {
            self.settings.userflow = 2
        }
    }
}

struct LoginGoogle: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Text("Sign in with Google")
                    .font(.caption)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                Spacer()
            }
        }.padding(.vertical, 14)
        .background(Color.white)
        .cornerRadius(12)
        .onTapGesture {
            self.settings.userflow = 2
        }
    }
}
