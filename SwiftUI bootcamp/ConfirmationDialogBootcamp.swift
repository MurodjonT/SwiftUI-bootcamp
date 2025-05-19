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
            .confirmationDialog("Qaysi variantni tanlaysiz?", isPresented: $showDialog) {
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


#Preview {
    MultipleOptionsView()
}
