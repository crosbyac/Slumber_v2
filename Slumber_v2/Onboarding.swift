//
//  Onboarding.swift
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

struct Onboarding: View {
    
    
    @State var SlideGesture = CGSize.zero
    @State var SlideOne = false
    @State var SlideOnePrevious = false
    @State var SlideTwo = false
    @State var SlideTwoPrevious = false
    @State var SlideThree = false
    @State var SlideThreePrevious = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("clock")
                Spacer()
                .edgesIgnoringSafeArea(.all)
            }
            OnboardingFour()
                .offset(x: SlideGesture.width)
                .offset(x: SlideThree ? 0 : 500)
                .animation(.spring())
            
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width > 150 {
                            self.SlideThree = false
                            self.SlideThreePrevious = false
                        }
                        self.SlideGesture = .zero
                    }
            )
            
            OnboardingThree()
                .offset(x: SlideGesture.width)
                .offset(x: SlideTwo ? 0 : 500)
                .offset(x: SlideThreePrevious ? 500 : 0)
                .offset(x: SlideThree ? -500 : 0)
                .animation(.spring())
            
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width < -150 {
                            self.SlideThree = true
                        }
                        if self.SlideGesture.width > 150 {
                            self.SlideTwo = false
                            self.SlideTwoPrevious = true
                        }
                        self.SlideGesture = .zero
                    }
            )
            OnboardingTwo()
                .offset(x: SlideGesture.width)
                .offset(x: SlideOne ? 0 : 500)
                .offset(x: SlideOnePrevious ? 500 : 0)
                .offset(x: SlideTwo ? -500 : 0)
                .animation(.spring())
                
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width < -150 {
                            self.SlideOne = true
                            self.SlideTwo = true
                           
                        }
                        
                        if self.SlideGesture.width > 150 {
                            self.SlideOnePrevious = true
                            self.SlideOne = false
                            
                        }
                        self.SlideGesture = .zero
                    }
            )
            
                
            OnboardingOne()
                .offset(x: SlideGesture.width)
                .offset(x: SlideOne ? -500 : 0)
                
                .animation(.spring())
                
                .gesture(
                    DragGesture().onChanged { value in
                        self.SlideGesture = value.translation
                    }
                    .onEnded { value in
                        if self.SlideGesture.width < -150 {
                            self.SlideOne = true
                            self.SlideOnePrevious = false
                        }
                        self.SlideGesture = .zero
                    }
            )

    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}

struct OnboardingOne: View {
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                    .frame(height: 360.0)
                HStack {
                    Text("What we do")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 4)
                HStack {
                    Text("Introduction")
                        .foregroundColor(Color("Accent_Blue_2"))
                        .padding(.bottom, 4.0)
                    Spacer()
                }.padding(.bottom, 36)
                HStack {
                    Text("From activity to glucose management, Slumber implements information from your devices to help you make actionable decisions that improve your sleep routine.")
                        .font(.callout)
                        .lineSpacing(12)
                        .foregroundColor(.white)
                    Spacer()
                }
                Spacer()
                VStack {
                    ContinueButton()
                    Spacer()
                        .frame(height: 122.0)
                }
            }
            .padding(.horizontal, 32.0)
        }
    }
}

struct OnboardingTwo: View {
    @State private var height = "5'11"
    @State private var weight = "225 lbs"
    
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                    .frame(height: 360.0)
                HStack {
                    Text("Tell us about you")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 4)
                HStack {
                    Text("Your Information")
                        .foregroundColor(Color("Accent_Blue_2"))
                        .padding(.bottom, 4.0)
                    Spacer()
                }.padding(.bottom, 22)
                VStack{
                    DatePicker(selection: .constant(Date()), displayedComponents: .date, label: { Text("Birth Date")
                        .foregroundColor(Color.white) })
                        .padding(.vertical, 8.0)
                        .padding(.top, 8)
                    Divider().frame(height: 1).background(Color("Background_Two"))
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
                    .padding([.top, .bottom, .trailing], 8)
                    Divider().frame(height: 1).background(Color("Background_Two"))
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
                    .padding([.top, .bottom, .trailing], 8)
                    Divider().frame(height: 1).background(Color("Background_Two"))
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
                    .padding([.top, .bottom, .trailing], 8)
                    Divider().frame(height: 1).background(Color("Background_Two"))
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
                    .padding([.top, .trailing], 8)
                    .padding(.bottom, 22)
                }
                .padding(.horizontal)
                .background(Color("Background_three"))
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack {
                    ContinueButton()
                    Spacer()
                        .frame(height: 122.0)
                }.padding(.top,6)
            }
            .padding(.horizontal, 32.0)
        }
    }
}

struct OnboardingThree: View {
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                    .frame(height: 360.0)
                HStack {
                    Text("Let’s get setup")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.bottom, 4)
                HStack {
                    Text("Connect Devices (2 Devices found)")
                        .foregroundColor(Color("Accent_Blue_2"))
                        .padding(.bottom, 4.0)
                    Spacer()
                }.padding(.bottom, 22)
                VStack{
                    HStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Oura Smart Ring")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                Text("Sleep, Activity, Stress, etc")
                                    .font(.footnote)
                                    .foregroundColor(Color("Accent_Blue_2"))
                            }
                            Spacer()
                            SyncButton()
                        }
                    }
                    .padding(.trailing, 4)
                    .padding(.vertical, 14)
                }.padding(.horizontal)
                .background(Color("Background_three"))
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                .padding(.bottom,8)
                VStack{
                    HStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Dexcom G6")
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                Text("Blood Glucose levels")
                                    .font(.footnote)
                                    .foregroundColor(Color("Accent_Blue_2"))
                            }
                            Spacer()
                            SyncButton()
                        }
                    }
                    .padding(.trailing, 4)
                    .padding(.vertical, 14)
                }.padding(.horizontal)
                .background(Color("Background_three"))
                .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack {
                    ContinueButton()
                    Spacer()
                        .frame(height: 122.0)
                }
            }
            .padding(.horizontal, 32.0)
        }
    }
}
    
    
struct OnboardingFour: View {
        var body: some View {
            ZStack {
                VStack{
                    Spacer()
                        .frame(height: 360.0)
                    HStack {
                        Text("Based on your profile")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                    }.padding(.bottom, 4)
                    HStack {
                        Text("Let’s focus on the following:")
                            .foregroundColor(Color("Accent_Blue_2"))
                            .padding(.bottom, 4.0)
                        Spacer()
                    }.padding(.bottom, 36)
                    TrackingSleep().padding(.bottom,4)
                    TrackingActivity().padding(.bottom,4)
                    TrackingGlucose().padding(.bottom,4)
                    TrackingStress().padding(.bottom,4)
                    Spacer()
                    VStack {
                        CompleteButton()
                        Spacer()
                            .frame(height: 122.0)
                    }
                }
                .padding(.horizontal, 32.0)
            }
        }
}


struct ContinueButton: View {
        @EnvironmentObject var settings: UserSettings

        var body: some View {
            ZStack {
                HStack {
                    Image(systemName: "hand.tap.fill")
                        .font(.body)
                        .frame(width: 36.0)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Swipe to continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                    Spacer()
                    Image(systemName: "").frame(width: 36.0)
                }
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .background(Color("Background_three"))
            .cornerRadius(12)
        }
}
    
struct CompleteButton: View {
            @EnvironmentObject var settings: UserSettings

            var body: some View {
                ZStack {
                    HStack {
                        Spacer()
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                        Spacer()
                    }
                }
                .padding(.vertical, 14)
                .padding(.horizontal, 14)
                .background(LinearGradient.GradientPink)
                .cornerRadius(12)
                .onTapGesture {
                    self.settings.userflow = 2
                }
            }
    }

}

struct SyncButton: View {
    @State var Synced = false

    var body: some View {
        if self.Synced == false{
            HStack {
                Text("Sync")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 6)
            .frame(width: 110.0)
            .background(LinearGradient.GradientBlue)
            .cornerRadius(4)
            .onTapGesture {
                self.Synced = true
            }
        }
        if self.Synced == true{
            HStack {
                Text("Disconnect")
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(Color("GradientBlue"))
            }
            .padding(.vertical, 6)
            .frame(width: 110.0)
            .background(Color("Background_Three"))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(LinearGradient.GradientBlue, lineWidth: 3)
            )
            .cornerRadius(4)
            .onTapGesture {
                self.Synced = false
            }
        }
    }
}

struct TrackingSleep: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "moon.zzz.fill")
                    .foregroundColor(Color("GradientBlue"))
                    .frame(width: 32.0, height: 32.0)
                    .background(Color("Background_Three"))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(LinearGradient.GradientBlue, lineWidth: 3)
                    )
                HStack {
                    VStack(alignment: .leading) {
                        Text("Sleep Quality")
                            .font(.callout)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding(.leading, 8.0)
            }
            .padding(.trailing, 4)
            .padding(.vertical, 12)
        }.padding(.horizontal)
        .background(Color("Background_three"))
        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
    }
}

struct TrackingActivity: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "figure.walk")
                    .foregroundColor(Color("GradientOrange"))
                    .frame(width: 32.0, height: 32.0)
                    .background(Color("Background_Three"))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(LinearGradient.GradientOrange, lineWidth: 3)
                    )
                HStack {
                    VStack(alignment: .leading) {
                        Text("Activity levels")
                            .font(.callout)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding(.leading, 8.0)
            }
            .padding(.trailing, 4)
            .padding(.vertical, 12)
        }.padding(.horizontal)
        .background(Color("Background_three"))
        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
    }
}

struct TrackingGlucose: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "drop.fill")
                    .foregroundColor(Color("GradientPink"))
                    .frame(width: 32.0, height: 32.0)
                    .background(Color("Background_Three"))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(LinearGradient.GradientPink, lineWidth: 3)
                    )
                HStack {
                    VStack(alignment: .leading) {
                        Text("Blood Glucose Levels")
                            .font(.callout)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding(.leading, 8.0)
            }
            .padding(.trailing, 4)
            .padding(.vertical, 12)
        }.padding(.horizontal)
        .background(Color("Background_three"))
        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
    }
}

struct TrackingStress: View {
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "heart.text.square.fill")
                    .foregroundColor(Color("GradientGreen"))
                    .frame(width: 32.0, height: 32.0)
                    .background(Color("Background_Three"))
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(LinearGradient.GradientGreen, lineWidth: 3)
                    )
                HStack {
                    VStack(alignment: .leading) {
                        Text("Stress levels")
                            .font(.callout)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                .padding(.leading, 8.0)
            }
            .padding(.trailing, 4)
            .padding(.vertical, 12)
        }.padding(.horizontal)
        .background(Color("Background_three"))
        .cornerRadius(/*@START_MENU_TOKEN@*/12.0/*@END_MENU_TOKEN@*/)
    }
}
