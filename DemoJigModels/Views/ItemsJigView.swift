//
//  ItemsJigView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI

struct ItemsJigView: View {
    
    var jigModel: JigModel
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    @State private var isShowingPopover = false
    
    var body: some View {
        
        VStack {
            ZStack {
                Image(jigModel.image)
                    .resizable()
                    .scaledToFill()
                if let _ = jigModel.immersiveStyle {
                    
                } else {
                    Text("This model is Unavailable")
                        .monospaced()
                        .font(.system(size: 15, weight: .bold))
                }
            }
        }
        .onTapGesture {
            if let immersiveStyle = jigModel.immersiveStyle {
                Task {
                    await openImmersiveSpace(id: immersiveStyle.immersiveString)
                }
            } else {
                isShowingPopover = true
            }
        }
        .popover(isPresented: $isShowingPopover, attachmentAnchor: .point(.center), arrowEdge: .bottom) {
            VStack {
                Text("The model is currently under development")
                Text("Please check it back later")
                Button {
                    isShowingPopover = false
                } label: {
                    Text("Ok")
                        .frame(width: 100)
                }

            }
                .padding()
        }
    }
}

#Preview {
    ItemsJigView(jigModel: JigModel(name: "jig1", image: "space", immersiveStyle: .immer1))
}
