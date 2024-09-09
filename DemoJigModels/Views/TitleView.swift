//
//  TitleView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI
import Observation

struct TitleView: View {
    
    @State private var text = ""
    private var finalText = "3D MECHANICAL MODELS"
//    @State private var isTitleFinished = false
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack(spacing: 20) {
            TitleText(title: finalText)
                .padding(.horizontal, 70)
                .hidden()
                .overlay(alignment: .leading) {
                    TitleText(title: text)
                        .padding(.leading, 70)
                }
            Text("AKAVERSE designs, manufactures and launches advanced rockets and spacecraft ...")
                .monospaced()
                .font(.system(size: 20, weight: .bold))
                .opacity(viewModel.isTitleFinished ? 1 : 0)
        }
        .typeText(text: $text, finalText: finalText, isFinished: $viewModel.isTitleFinished, isAnimated: !viewModel.isTitleFinished)
        
        .animation(.default.speed(viewModel.speedConstant), value: viewModel.isTitleFinished)
    }
}

#Preview {
    TitleView()
        .environment(ViewModel())
}


/// The text that displays the app's title.
private struct TitleText: View {
    var title: String
    var body: some View {
        Text(title)
            .monospaced()
            .font(.system(size: 50, weight: .bold))
    }
}


extension View {
    /// Makes the specified text appear one letter at a time.
    func typeText(
        text: Binding<String>,
        finalText: String,
        isFinished: Binding<Bool>,
        cursor: String = "|",
        isAnimated: Bool = true
    ) -> some View {
        self.modifier(
            TypeTextModifier(
                text: text,
                finalText: finalText,
                isFinished: isFinished,
                cursor: cursor,
                isAnimated: isAnimated
            )
        )
    }
}

private struct TypeTextModifier: ViewModifier {
    @Binding var text: String
    var finalText: String
    @Binding var isFinished: Bool
    var cursor: String
    var isAnimated: Bool

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isAnimated == false {
                    text = finalText
                    isFinished = true
                }
            }
            .task {
                guard isAnimated else { return }

                // Blink the cursor a few times.
                for _ in 1 ... 2 {
                    text = cursor
                    try? await Task.sleep(for: .milliseconds(500))
                    text = ""
                    try? await Task.sleep(for: .milliseconds(200))
                }

                // Type out the title.
                for index in finalText.indices {
                    text = String(finalText.prefix(through: index)) + cursor
                    let milliseconds = (1 + UInt64.random(in: 0 ... 1)) * 100
                    try? await Task.sleep(for: .milliseconds(milliseconds))
                }

                // Wrap up the title sequence.
                try? await Task.sleep(for: .milliseconds(400))
                text = finalText
                isFinished = true
            }
    }
}
