//
//  ImmesiveView3.swift
//  DemoJigModels
//
//  Created by SonPT61 on 30/8/24.
//

import RealityKit
import SwiftUI
import RealityKitContent

struct ImmersiveView3: View {
    var body: some View {
        RealityView { content, attachments in
            guard let rootEntity = try? await Entity(named: "Scene3", in: realityKitContentBundle) else { return }
            
            content.add(rootEntity)
            
            if let controlView = attachments.entity(for: "controlView") {
                controlView.position = SIMD3<Float>(0, 1.3, -1)
                controlView.transform.rotation = simd_quatf(angle: -0.5, axis: [1, 0, 0])
                
//                var inputComponent = InputTargetComponent()
//                inputComponent.allowedInputTypes = .all
//                controlView.components.set(inputComponent)
                
//                if let entityHalfLeft = rootEntity.findEntity(named: PB_JetEngine_Run_EntityName.PB_JetEngine_Run) {
//    //                let animationLibrary = entity.components[AnimationLibraryComponent.self]
//                    if let animationResource = entityHalfLeft.availableAnimations.first {
//                        entityHalfLeft.playAnimation(animationResource.repeat(count: 100), transitionDuration: 2, startsPaused: false)
//                    }
//                }
                
                content.add(controlView)
                
            }
            
        } attachments: {
            Attachment(id: "controlView") {
                ControlPanelView()
                    .frame(width: 700, height: 200)
                    .glassBackgroundEffect()
            }
        }
        .installGestures()
//        .gesture(DragGesture().targetedToAnyEntity().onChanged({ value in
//            value.entity.position = value.convert(value.location3D, from: .local, to: .scene)
//        }))
    }
}
