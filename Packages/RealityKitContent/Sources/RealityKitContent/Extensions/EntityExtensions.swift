/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
App-specific extension on Entity.
*/

import Foundation
import RealityKit
import SwiftUI
import Combine


public extension Entity {
    var gestureComponent: GestureComponent? {
        get { components[GestureComponent.self] }
        set { components[GestureComponent.self] = newValue }
    }
    
    /// Returns the position of the entity specified in the app's coordinate system. On
    /// iOS and macOS, which don't have a device native coordinate system, scene
    /// space is often referred to as "world space".
    var scenePosition: SIMD3<Float> {
        get { position(relativeTo: nil) }
        set { setPosition(newValue, relativeTo: nil) }
    }
    
    /// Returns the orientation of the entity specified in the app's coordinate system. On
    /// iOS and macOS, which don't have a device native coordinate system, scene
    /// space is often referred to as "world space".
    var sceneOrientation: simd_quatf {
        get { orientation(relativeTo: nil) }
        set { setOrientation(newValue, relativeTo: nil) }
    }
    
    
    func startContinuousRotation() {
            // If rotation is already happening, stop it
            if isRotating() {
                stopContinuousRotation()
                return
            }
            
            // Otherwise, start rotating
            let rotationSpeed: Float = .pi / 2  // Adjust the speed here
            let duration: Float = 0.01  // Time interval for each rotation step
            
            let rotateAction = Timer.publish(every: TimeInterval(duration), on: .main, in: .common).autoconnect()
            
            let cancellable = rotateAction.sink { [weak self] _ in
                guard let self = self else { return }
                self.transform.rotation *= simd_quatf(angle: rotationSpeed * duration, axis: [0, 1, 0])
            }
            
            // Store the cancellable using the entity's unique identifier
            rotationCancellables[ObjectIdentifier(self)] = cancellable
        }
        
        func stopContinuousRotation() {
            // Remove and cancel the cancellable
            if let cancellable = rotationCancellables.removeValue(forKey: ObjectIdentifier(self)) {
                cancellable.cancel()
            }
        }
        
        func isRotating() -> Bool {
            return rotationCancellables[ObjectIdentifier(self)] != nil
        }
}
@MainActor
private var rotationCancellables = [ObjectIdentifier: AnyCancellable]()
