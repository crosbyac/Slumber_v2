//
//  Home.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-11.
//

import Charts
import SwiftUI

extension View {
    public func gradientForeground(colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: .init(colors: colors),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
            .mask(self)
    }
}

struct Home: View {
    @State private var showModal: Bool = false
    @State private var showSleep: Bool = false

    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                
                VStack {
                    Spacer()
                        .frame(height: 88.0)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("MON 02, 2021")
                                .font(.subheadline)
                                .foregroundColor(Color("Accent_Blue_2"))
                            Text("Your glucose")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.top, 8.0)
                            Text("while sleeping")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding(.top, 2)
                        }
                    Spacer()
                    }
                    .padding(.bottom, 26.0)
                    HStack{
                        VStack{
                            HStack {
                                Rectangle()
                                .frame(width: 16.0, height: 16.0)
                                .gradientForeground(colors: [Color("GradientPink"), Color("GradientPink_two")])
                                    .cornerRadius(6)
                                Text("Awake")
                                    .font(.callout)
                                    .foregroundColor(Color("Accent_Blue_2"))
                            }
                            HStack {
                                Rectangle()
                                .frame(width: 16.0, height: 16.0)
                                .gradientForeground(colors: [Color("GradientBlue"), Color("GradientBlue_two")])
                                    .cornerRadius(6)
                                Text("Asleep")
                                    .font(.callout)
                                    .foregroundColor(Color("Accent_Blue_2"))
                            }
                        }
                        Spacer()
                        VStack{
                            HStack {
                                Spacer()
                                Text("Minimal Risk")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .gradientForeground(colors: [Color("GradientBlue"), Color("GradientBlue_two")])
                                
                            }
                            .frame(height: 20.0)
                            .padding(.bottom,4)
                            HStack {
                                Spacer()
                                Rectangle()
                                .frame(width: 16.0, height: 16.0)
                                .foregroundColor(Color("Accent_Blue_2"))
                                    .cornerRadius(6)
                                Text("Blood glucose levels")
                                    .font(.callout)
                                    .foregroundColor(Color("Accent_Blue_2"))
                            }
                            .frame(height: 18.0)
                        }
                    }
                    Spacer()
                        .frame(height: 230.0)
                    HStack {
                        Text("How you can improve")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.top, 2)
                        Spacer()
                    }.padding(.bottom,16)
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        TrackingSleep().onTapGesture {
                            showModal.toggle()
                        }
                    }
                    .padding(.bottom,4)
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        TrackingActivity().onTapGesture {
                            showModal.toggle()
                        }
                    }
                    .padding(.bottom,4)
                    Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                        TrackingGlucose().onTapGesture {
                            showModal.toggle()
                        }
                    }
                    .padding(.bottom,4)
                    Spacer()
                }
                .padding(.horizontal, 36.0)
                
                VStack {
                    SleepChart()
                    Spacer()
                    .frame(height: 410.0)
                }
                .padding(.horizontal, 40.0)
            }
            .sheet(isPresented: $showModal) {
                if self.showSleep == true{
                    SleepView()
                }
            }
        }
        .tabItem {
            Label("Home", systemImage: "moon.circle.fill")
        }.tag(1)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SleepView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Button("Press to dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}

struct ActivityView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Background_two"),Color("Background")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            Button("Press to dismiss") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


/* Modal
 
 Button("Show Sheet") {
     showSleep.toggle()
 }
 
 .sheet(isPresented: $showSleep) {
    SleepView()
 }
 
 */

struct SleepChart: View {
    var body: some View {
        ZStack {
            Chart(data: [0.24,0.24,0.23,0.22,0.22,0.21,0.21,0.22,0.21,0.21,0.21,0.22,0.22,0.24,0.22,0.24,0.22,0.23,0.23,0.24,0.24])
                /*
                 Sleep from Oura:
                 443432222211222333321112222222222111133333322221112233333333332232222334
                 */
                .chartStyle(
                    ColumnChartStyle(column: Capsule().gradientForeground(colors: [Color("GradientBlue_two"), Color("GradientBlue")]), spacing: 8)
                )
            
            Chart(data: [0.24,0.24,0,0,0,0,0,0,0,0,0,0,0,0.24,0,0.24,0,0,0,0.24,0.24])
                /*
                 Sleep from Oura:
                 443432222211222333321112222222222111133333322221112233333333332232222334
                 */
                .chartStyle(
                    ColumnChartStyle(column: Capsule().gradientForeground(colors: [Color("GradientPink"), Color("GradientPink_two")]), spacing: 8)
                )
            
            Chart(data: [0.24,0.24,0.23,0.22,0.22,0.21,0.21,0.22,0.21,0.21,0.21,0.22,0.22,0.24,0.22,0.24,0.22,0.23,0.23,0.24,0.24])
                .padding(.bottom, 36.0)
                .chartStyle(
                    LineChartStyle(.quadCurve, lineColor: Color("Accent_Blue_2"), lineWidth: 3)
                )
        }
    }
}
