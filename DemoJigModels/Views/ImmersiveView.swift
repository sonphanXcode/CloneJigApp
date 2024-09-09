//
//  ImmersiveView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import RealityKit
import SwiftUI
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content, attachments in
            guard let rootEntity = try? await Entity(named: "Scene1", in: realityKitContentBundle) else { return }
            
            content.add(rootEntity)
            
            if let controlView = attachments.entity(for: "controlView") {
                controlView.position = SIMD3<Float>(0, 1.3, -1)
                controlView.transform.rotation = simd_quatf(angle: -0.5, axis: [1, 0, 0])
                
                content.add(controlView)
            }
            
            if let entityHalfLeft = rootEntity.findEntity(named: JetEngineEntityName.PB_JetEngine_Combine) {
//                let animationLibrary = entity.components[AnimationLibraryComponent.self]
                if let animationResource = entityHalfLeft.availableAnimations.first {
                    entityHalfLeft.playAnimation(animationResource.repeat(count: 4), transitionDuration: 2, startsPaused: false)
                }
            }
            
        }
        attachments: {
            Attachment(id: "controlView") {
                ControlPanelView()
                    .frame(width: 700, height: 200)
                    .glassBackgroundEffect()
            }
        }
        .installGestures()
    
    }
}

//#Preview {
//    ImmersiveView()
//}
