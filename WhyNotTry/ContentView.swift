//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Ryan Walker on 9/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var id = 1
    @State private var currentIndex = 0
    @State private var selected = ""
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]

    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]
    func getSelectedActivity() -> Void {
        if selected == "" {
            selected = "Baseball"
        }
    }
    var body: some View {
        VStack {
            Text("Why not try…")
                .font(.largeTitle.bold())
            Spacer()
            VStack {
                Circle()
                    .fill(colors.randomElement() ?? .blue)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selected.lowercased())")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    )

                Text("\(selected)!")
                    .font(.title)
            }
            .transition(.slide)
            .id(id)
            Spacer()
            Button("Try again") {
                if currentIndex < activities.count - 1 {
                    currentIndex += 1
                } else {
                    currentIndex = 0
                }
                withAnimation(.easeInOut(duration: 1)) {
                    selected = activities[currentIndex]
                    id += 1
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .onAppear {
            getSelectedActivity()
        }
    }
}

#Preview {
    ContentView()
}
