//
//  ContentView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        ScrollView {
            VStack (spacing: 30) {
                TitleView()
                    .frame(height: 300)
                VStack(spacing: 20) {
                    LibraryView()
                    Divider()
                    AutomotiveSectionView()
                    Divider()
                }
                .opacity(viewModel.isTitleFinished ? 1 : 0)
            }
            .padding()
        }
        .animation(.default.speed(viewModel.speedConstant), value: viewModel.isTitleFinished)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(ViewModel())
}
