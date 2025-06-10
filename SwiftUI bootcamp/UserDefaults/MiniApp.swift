//
//  MiniApp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 09/06/25.
//
import SwiftUI
import Foundation

struct MainView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        if hasSeenOnboarding {
            HomeView3()
           
        } else {
            OnboardingView()
        }
    }
}


struct OnboardingView: View {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @AppStorage("userName") var userName: String = ""
    @AppStorage("applanguage") var appLanguage: String = "English"

    var body: some View {
        VStack(spacing: 20) {
            Text("👋 Welcome to the App!")
                .font(.largeTitle)
                .bold()
            TextField("Enter your name", text: $userName)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding(.horizontal)
            
            Picker("Select Language", selection: $appLanguage) {
                Text("English").tag("English")
                Text("Uzbek").tag("Uzbek")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            Button("Continue") {
                hasSeenOnboarding = true
            }
            .padding()
            .background(userName.isEmpty ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .disabled(userName.isEmpty)
           
        }
        .padding()
    }
}


struct HomeView3: View {
    @AppStorage("userName") var userName: String = ""
    @AppStorage("applanguage") var appLanguage: String = "English"

    var body: some View {
        VStack(spacing: 20) {
            Text("🏠 Main App Interface")
                .font(.title)
                .bold()
            Button("Reset Onboarding") {
                UserDefaults.standard.set(false, forKey: "hasSeenOnboarding")
                UserDefaults.standard.removeObject(forKey: "userName")
                UserDefaults.standard.removeObject(forKey: "applanguage")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Welcome back, \(userName)!")
                .font(.headline)
                .padding()
            
            Text("Current Language: \(appLanguage)")
                .font(.subheadline)
                .padding()
        }
        .padding()
    }
}



#Preview {
    MainView()
}
    
