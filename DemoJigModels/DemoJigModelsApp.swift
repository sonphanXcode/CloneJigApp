//
//  DemoJigModelsApp.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI
import RealityKitContent

@main
struct DemoJigModelsApp: App {
    
    @State private var viewModel = ViewModel()
    
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    
    var body: some Scene {
        WindowGroup(id: ConstantValue.contentViewIdString) {
            ContentView()
                .environment(viewModel)
        }
        ImmersiveSpace(id: "Immersive1") {
            ImmersiveView()
                .onAppear {
                    dismissWindow(id: ConstantValue.contentViewIdString)
                }
                .onDisappear {
                    openWindow(id: ConstantValue.contentViewIdString)
                }
        }
        .immersionStyle(selection: .constant(.full), in: .mixed)
        
        ImmersiveSpace(id: "Immersive2") {
            ImmersiveView2()
                .onAppear {
                    dismissWindow(id: ConstantValue.contentViewIdString)
                }
                .onDisappear {
                    openWindow(id: ConstantValue.contentViewIdString)
                }
        }
        .immersionStyle(selection: .constant(.full), in: .mixed)
        
        ImmersiveSpace(id: "Immersive3") {
            ImmersiveView3()
                .onAppear {
                    dismissWindow(id: ConstantValue.contentViewIdString)
                }
                .onDisappear {
                    openWindow(id: ConstantValue.contentViewIdString)
                }
        }
        .immersionStyle(selection: .constant(.full), in: .mixed)
        
    }
    
    init() {
        GestureComponent.registerComponent()
    }
}
