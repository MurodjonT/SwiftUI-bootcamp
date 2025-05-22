//
//  ConfirmationDialogBootcamp.swift
//  SwiftUI bootcamp
//
//  Created by Murodjon Turobov on 18/05/25.
//

import SwiftUI

struct ConfirmationExampleView: View {
    @State private var showDialog = false
    @State private var deleted = false

    var body: some View {
        VStack(spacing: 20) {
            Text(deleted ? "Data has been deleted" : "Data exists")
                .foregroundColor(deleted ? .red : .primary)

            Button("Delete data") {
                showDialog = true
            }
            .buttonStyle(.borderedProminent)
            .confirmationDialog("Are you sure you want to delete this data?", isPresented: $showDialog, titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    deleted = true
                }
                Button("Cancel", role: .cancel) { }
            }
        }
        .padding()
    }
}


struct MultipleOptionsView: View {
    @State private var showDialog = false
    @State private var choosen = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Choosen: \(choosen)")

            Button("Choose the option") {
                showDialog = true
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
            .confirmationDialog("Which one do you choose?", isPresented: $showDialog,titleVisibility: .visible) {
                Button("A option") { choosen = "A" }
                Button("B option") { choosen = "B" }
                Button("C option") { choosen = "C" }
                Button("Cancel", role: .cancel) { }
            }
        }
        .padding()
    }
}


struct NavigateAfterConfirmView: View {
    @State private var showDialog = false
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            VStack {
                Button("Go to Profile") {
                    showDialog = true
                }
                .confirmationDialog("Do you want to go to your profile?", isPresented: $showDialog) {
                    Button("Yes") { navigate = true }
                    Button("No", role: .destructive) { }
                }

                NavigationLink(destination: Text("This is Profile Page"), isActive: $navigate) {
                    EmptyView()
                }
            }
            .padding()
            .navigationTitle("Asosiy")
        }
    }
}


struct LanguageSelectionView: View {
    @State private var showDialog = false
    @State private var selectedLanguage = "Not selected"

    var body: some View {
        VStack(spacing: 20) {
            Text("Selected Language: \(selectedLanguage)")

            Button("Select Language") {
                showDialog = true
            }
            .buttonStyle(.bordered)

            .confirmationDialog("Choose your preferred language", isPresented: $showDialog) {
                Button("English") { selectedLanguage = "English" }
                Button("Russian") { selectedLanguage = "Russian" }
                Button("Uzbek") { selectedLanguage = "Uzbek" }
                Button("Cancel", role: .cancel) { }
            }
        }
        .padding()
    }
}


struct ImagePickerDialogView: View {
    @State private var showDialog = false
    @State private var source = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Source: \(source)")

            Button("Pick Image") {
                showDialog = true
            }
            .buttonStyle(.bordered)

            .confirmationDialog("Select image source", isPresented: $showDialog) {
                Button("Camera") { source = "Camera" }
                Button("Gallery") { source = "Gallery" }
                Button("Cancel", role: .cancel) { }
            }
        }
        .padding()
    }
}


struct ImagePickerDialogView2: View {
    @State private var showDialog = false
    @State private var source = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Source: \(source)")
            Button("Pick Image", systemImage: "photo") {
                showDialog = true
            }
            .buttonStyle(.bordered)
            .confirmationDialog("Select image source", isPresented: $showDialog, titleVisibility: .visible) {
                Button("Camera", systemImage: "person.crop.circle") { source = "Camera" }
                Button("Gallery") { source = "Gallery" }
                Button("Cancel", role: .cancel) { }
            }
        }
  
    }
}
#Preview {
    ImagePickerDialogView2()
}
