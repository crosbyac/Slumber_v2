//
//  Account.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import SwiftUI

struct Account: View {
    @EnvironmentObject var settings: UserSettings

    @State private var height = "5'11"
    @State private var weight = "225 lbs"
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                        .frame(height: 88.0)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("ACCOUNT")
                                .font(.subheadline)
                                .foregroundColor(Color("Accent_Blue_2"))
                            Text("Your Information")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.top, 8.0)
                        }
                        Spacer()
                    }
                    .padding(.bottom, 36.0)
                        VStack{
                            DatePicker(selection: .constant(Date()), displayedComponents: .date, label: { Text("Birth Date")
                                .foregroundColor(Color.white) })
                                .padding(.vertical, 8.0)
                                .padding(.top, 12)
                            Divider().frame(height: 1).background(Color("Accent_Blue_2"))
                            HStack {
                                HStack {
                                    Text("Height")
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                                ZStack {
                                    TextField("Placeholder", text: $height)
                                        .foregroundColor(Color.blue)
                                }
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                            }
                            .padding([.top, .bottom, .trailing], 12)
                            Divider().frame(height: 1).background(Color("Accent_Blue_2"))
                            HStack {
                                HStack {
                                    Text("Weight")
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                                ZStack {
                                    TextField("Placeholder", text: $weight)
                                        .foregroundColor(Color.blue)
                                }
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                            }
                            .padding([.top, .bottom, .trailing], 12)
                            Divider().frame(height: 1).background(Color("Accent_Blue_2"))
                            HStack {
                                HStack {
                                    Text("Gender")
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                                ZStack {
                                    Menu("Male") {
                                        Text("Male")
                                        Text("Female")
                                        Text("Non-Binary")
                                    }
                                }
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                            }
                            .padding([.top, .bottom, .trailing], 12)
                            Divider().frame(height: 1).background(Color("Accent_Blue_2"))
                            HStack {
                                HStack {
                                    Text("Diabetes Type")
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                                ZStack {
                                    Menu("Type 01") {
                                        Text("Type 01")
                                        Text("Type 02")
                                    }
                                }
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                            }
                            .padding([.top, .trailing], 12)
                            .padding(.bottom, 22)
                        }
                        .padding(.horizontal)
                        .background(Color("Background_three"))
                        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(height: 16.0)
                    VStack{
                        HStack {
                            HStack {
                                Text("Connect Devices")
                                    .foregroundColor(Color.white)
                                Spacer()
                                Image(systemName: "link.badge.plus")
                                    .font(.system(size: 18.0))
                                    .foregroundColor(Color.blue)
                                    .rotationEffect(Angle(degrees: 270), anchor: .center)
                            }
                        }
                        .padding(.trailing, 12)
                        .padding(.vertical, 20)
                    }.padding(.horizontal)
                    .background(Color("Background_three"))
                    .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                    Spacer()
                        .frame(height: 16.0)
                    VStack{
                        HStack {
                            HStack {
                                Text("Logout")
                                    .foregroundColor(Color.white)
                                Spacer()
                                Image(systemName: "square.and.arrow.down")
                                    .font(.system(size: 18.0))
                                    .foregroundColor(Color.blue)
                                    .rotationEffect(Angle(degrees: 270), anchor: .center)
                            }
                        }
                        .padding(.trailing, 12)
                        .padding(.vertical, 20)
                    }.padding(.horizontal)
                    .background(Color("Background_three"))
                    .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        self.settings.userflow = 0
                    }
                    Spacer()
                }
                .padding(.horizontal, 32.0)
        }
        .edgesIgnoringSafeArea(.all)
        .tabItem {
            Label("Account", systemImage: "person.crop.circle")
        }.tag(4)
    }
}

struct Account_Previews: PreviewProvider {
    static var previews: some View {
        Account()
    }
}
