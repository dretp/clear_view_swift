//
//  bottomTabView.swift
//  esBudget
//
//  Created by Dre Price on 1/14/25.
//

import SwiftUI

struct bottomTabView: View {
    @State private var selectedTab = "Home"

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag("Home")

            Text("Department")
                .tabItem {
                    DepartmentView()
                    Label("Explore", systemImage: "network")
                }
                .tag("Explore")

            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .tag("Settings")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    selectedTab = "Settings"
                }) {
                    Text("Switch to Settings")
                }
            }
        }
    }
}

#Preview {
    bottomTabView()
}
