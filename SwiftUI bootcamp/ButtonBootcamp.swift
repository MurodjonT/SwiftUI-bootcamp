//
//  ButtonBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 10/05/25.
//

import SwiftUI

struct ButtonBootcamp: View {
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
        
        Button("Saqlash", systemImage: "person") {
            
        }
        .buttonStyle(MainButtonStyle())
        .padding(16)
    }
    

    

}

struct MainButton: View {
    var titleKey: LocalizedStringKey
//    var systemImage: String
    var buttonRole: ButtonRole?
    var color: Color = .orange
    var action: () -> Void
    
    init(_ titleKey: LocalizedStringKey, buttonRole: ButtonRole? = nil, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.buttonRole = buttonRole
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(titleKey)
                .font(.system(size: 16, weight: .semibold))
                .padding(16)
                .foregroundStyle(color)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 4) )
            
        }
        .padding()
//        Text("Hello World")
    }
}


struct MainButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18, weight: .semibold  ))
            .padding()
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .background{
                if configuration.isPressed {
                    Color.blue.opacity(0.4)
                } else {
                    Color.blue
                }
            }
            .clipShape(.rect(cornerRadius: 12))
    }
        
}
#Preview {
    ButtonBootcamp()
}
