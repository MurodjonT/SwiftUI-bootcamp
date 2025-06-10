//
//  UserProfileExample.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 10/06/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var age: String = ""
    @State private var isPremium: Bool = false
    @State private var savedProfile: UserProfile?
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Information")) {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                    
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                        .textContentType(.none)
                    
                    Toggle("Premium user", isOn: $isPremium)
                }

                Section {
                    Button("Save") {
                        saveProfile()
                    }
                    
                    Button("Reset", role: .destructive) {
                        resetProfile()
                    }
                }

                if let profile = savedProfile {
                    Section(header: Text("Saved Profile")) {
                        HStack {
                            Image(systemName: "person.circle")
                                .foregroundColor(.blue)
                            Text("Name: \(profile.name)")
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.green)
                            Text("Age: \(profile.age)")
                        }
                        
                        HStack {
                            Image(systemName: profile.premium ? "star.fill" : "star")
                                .foregroundColor(profile.premium ? .yellow : .gray)
                            Text("Premium: \(profile.premium ? "✅" : "❌")")
                        }
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(.green)
                            Text("Date: \(profile.createdAt)")
                        }
                    }
                }
            }
            .navigationTitle("Foydalanuvchi Profili")
            .navigationBarTitleDisplayMode(.large)
            .alert("Message", isPresented: $showAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
            .onAppear {
                loadProfile()
            }
        }
    }
    
    // MARK: - Private Methods
    private func saveProfile() {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            showAlert(message: "Please, enter your name")
            return
        }
        
        guard let userAge = Int(age), userAge > 0, userAge < 150 else {
            showAlert(message: "Please, enter yur age (1-149)")
            return
        }
        
        let profile = UserProfile(name: name.trimmingCharacters(in: .whitespaces),
                                age: userAge,
                                premium: isPremium)
        
        if UserDefaults.standard.saveObject(profile, forKey: "userProfile") {
            savedProfile = profile
            showAlert(message: "Profile has been successfully saved!")
        } else {
            showAlert(message: "Error with saving profile")
        }
    }
    
    private func resetProfile() {
        UserDefaults.standard.removeObject(forKey: "userProfile")
        name = ""
        age = ""
        isPremium = false
        savedProfile = nil
        showAlert(message: "Profile has been reset")
    }
    
    private func loadProfile() {
        if let loaded = UserDefaults.standard.loadObject(forKey: "userProfile", as: UserProfile.self) {
            savedProfile = loaded
            name = loaded.name
            age = String(loaded.age)
            isPremium = loaded.premium
        }
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

struct UserProfile: Codable {
    let name: String
    let age: Int
    let premium: Bool
    let createdAt: Date
    
    init(name: String, age: Int, premium: Bool) {
        self.name = name
        self.age = age
        self.premium = premium
        self.createdAt = Date()
    }
}

extension UserDefaults {
    func saveObject<T: Codable>(_ object: T, forKey key: String) -> Bool {
        do {
            let encoded = try JSONEncoder().encode(object)
            set(encoded, forKey: key)
            return true
        } catch {
            print("Error: \(error)")
            return false
        }
    }
    
    func loadObject<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        guard let data = data(forKey: key) else { return nil }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("Error : \(error)")
            return nil
        }
    }
}

#Preview {
    ContentView()
}
