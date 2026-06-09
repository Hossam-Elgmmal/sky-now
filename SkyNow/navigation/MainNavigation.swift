//
//  ContentView.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var manager = ErrorMessageController.shared
    var body: some View {
        NavigationView {
            Text("Hello, iOS!")
        }
        .onAppear{
            
        }
        .alert(
            "Error",
            isPresented: Binding(
                get: { manager.currentMessage != nil },
                set: { if !$0 { manager.dismiss() } }
            ),
            actions: {
                Button("OK") {
                    manager.dismiss()
                }
            },
            message: {
                Text(manager.currentMessage?.message ?? "")
            }
        )
    }

}
