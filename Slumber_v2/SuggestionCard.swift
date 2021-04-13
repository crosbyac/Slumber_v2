//
//  SuggestionCard.swift
//  Slumber_v2
//
//  Created by Adam Crosby on 2021-04-12.
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

struct SuggestionCard: View {
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "moon.zzz.fill")
                        .font(.body)
                        .frame(width: 36.0)
                    Text("Suggested Action")
                        .fontWeight(.bold)
                }
                .foregroundColor(Color("GradientBlue"))
                Spacer()
            }
            .padding(.top, 4)
            .padding(.vertical, 8)
            .padding(.bottom, 8)
            HStack {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.")
                    .font(.body)
                    .lineSpacing(12)
                    .foregroundColor(.white)
            }
            .padding(.vertical,8)
            HStack {
                Spacer()
                ActionButton()
            }
            .padding(.top, 4)
            .padding(.bottom)
        }
        .padding(.top,8)
        .padding(.horizontal, 18)
        .background(Color("Background"))
        .cornerRadius(12)
    }
    
    
    struct ActionButton: View {
        @State var Synced = false

        var body: some View {
            if self.Synced == false{
                HStack {
                    Text("Action")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                .padding(.vertical, 6)
                .frame(width: 136.0)
                .background(LinearGradient.GradientBlue)
                .cornerRadius(4)
                .onTapGesture {
                    self.Synced = true
                }
            }
            if self.Synced == true{
                HStack {
                    Text("Action Completed")
                        .font(.footnote)
                        .fontWeight(.medium)
                        .foregroundColor(Color("GradientBlue"))
                }
                .padding(.vertical, 6)
                .frame(width: 136.0)
                .background(Color("Background_Two"))
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
    
    
    
}

struct SuggestionCard_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionCard()
    }
}
