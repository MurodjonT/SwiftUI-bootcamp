//
//  ButtonBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 10/05/25.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    @State var title = "Hello, World!"
    @State private var isLiked = false
    @State private var loading = false

    
    var body: some View {
        //        Button/*("Mutaxassis", systemImage: "person") */{
        //
        //        } label: {
        //            HStack {
        //                Text("Mutahassis")
        //                Image(systemName: "person")
        //            }
        //
        //
        //        }
        //        MainButton("Save", action: { print("Saved!") })
        
        //        Button("Saqlash", systemImage: "person") {
        //
        //        }
        //        .buttonStyle(MainButtonStyle())
        //        .padding(16)
        //    }
        
        //
        VStack(spacing: 20) {
            

            LoadingButton(text: "Yuborish", isLoading: $loading) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    loading = false
                }
            }

                   IconLeftButton(
                       text: "Left Icon",
                       iconName: "hand.thumbsup.fill",
                       backgroundColor: .blue
                   ) {
                       print("Like tugmasi bosildi")
                   }

                   IconRightButton(
                       text: "Right Icon",
                       iconName: "square.and.arrow.up",
                       backgroundColor: .pink
                   ) {
                       print("Share tugmasi bosildi")
                   }
            
            NeumorphicButton(text: "Neumorphic Button") {
                print("NeumorphicButton")
            }
               }
               .padding()
        
        
        VStack(spacing: 20) {
            
            Text(title)
            
            IconLeftButton(text: "Right Masara", iconName: "person", backgroundColor: Color.blue) {
                self.title = "Masarara button was pressed"
                
                
            }
            
            
            
            Button("Press me!") {
                if title != "Button was Presssed" {
                    self.title = "Button was Presssed"
                } else {
                    self.title = "Hello, World!"
                }
            }
            
            
            
            Button(action: {
                print("Like tugmasi bosildi")
            }) {
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("Like")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            
            Button(action: {
                isLiked.toggle()
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(isLiked ? .red : .gray)
                    .font(.largeTitle)
//                    .animation(.smooth)
            }
            
            

        }
      
    }
    //
    //struct MainButton: View {
    //    var titleKey: LocalizedStringKey
    ////    var systemImage: String
    //    var buttonRole: ButtonRole?
    //    var color: Color = .orange
    //    var action: () -> Void
    //
    //    init(_ titleKey: LocalizedStringKey, buttonRole: ButtonRole? = nil, action: @escaping () -> Void) {
    //        self.titleKey = titleKey
    //        self.buttonRole = buttonRole
    //        self.action = action
    //    }
    //
    //    var body: some View {
    //        Button(action: action) {
    //            Text(titleKey)
    //                .font(.system(size: 16, weight: .semibold))
    //                .padding(16)
    //                .foregroundStyle(color)
    //                .frame(maxWidth: .infinity)
    //                .background(Color.blue)
    //                .clipShape(.rect(cornerRadius: 4) )
    //
    //        }
    //        .padding()
    ////        Text("Hello World")
    //    }
    //}
    //
    //
    //struct MainButtonStyle: ButtonStyle {
    //
    //    func makeBody(configuration: Configuration) -> some View {
    //        configuration.label
    //            .font(.system(size: 18, weight: .semibold  ))
    //            .padding()
    //            .foregroundStyle(.white)
    //            .frame(maxWidth: .infinity)
    //            .background{
    //                if configuration.isPressed {
    //                    Color.blue.opacity(0.4)
    //                } else {
    //                    Color.blue
    //                }
    //            }
    //            .clipShape(.rect(cornerRadius: 12))
    //    }
    //
    //}
}



struct IconLeftButton: View {
    let text: String
    let iconName: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                Text(text)
            }
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

struct IconRightButton: View {
    let text: String
    let iconName: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                Image(systemName: iconName)
            }
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}


struct NeumorphicButton: View {
    var text: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .shadow(color: .white, radius: 6, x: -5, y: -5)
                .shadow(color: .gray.opacity(0.4), radius: 6, x: 5, y: 5)
        }
    }
}

struct LoadingButton: View {
    let text: String
    @Binding var isLoading: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            isLoading = true
            action()
        }) {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .padding()
                    .frame(maxWidth: .infinity)
            } else {
                Text(text)
                    .padding()
                    .frame(maxWidth: .infinity)
            }
        }
        .background(isLoading ? Color.blue : Color.blue)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}


#Preview {
    ButtonBootcamp()
}

