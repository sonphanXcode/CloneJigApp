//
//  ControlPanelView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 30/8/24.
//

import SwiftUI

struct ControlPanelView: View {
    
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 50) {
                Text("Control Panel")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                Button {
                    Task {
                        await dismissImmersiveSpace()
                    }
                } label: {
                    Image(systemName: "arrowshape.turn.up.backward.circle")
                }
            }
            .padding([.leading, .trailing], 40)
            Divider()
            HStack(spacing: 30) {
                Button("Section1") {
                    ///
                }
                Button("Section2") {
                    ///
                }
                Button("Section3") {
                    ///
                }
                Button("Section4") {
                    ///
                }
            }
        }
    }
}
