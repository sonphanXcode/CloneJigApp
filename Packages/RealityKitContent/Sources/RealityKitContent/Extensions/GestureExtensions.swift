/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
App-specific extension on Gesture.
*/

import Foundation
import RealityKit
import SwiftUI

// MARK: - Rotate -
@MainActor
/// Gesture extension to support rotation gestures.
public extension Gesture where Value == EntityTargetValue<RotateGesture3D.Value> {
    
    /// Connects the gesture input to the `GestureComponent` code.
    func useGestureComponent() -> some Gesture {
        onChanged { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            gestureComponent.onChanged(value: value)
            
            value.entity.components.set(gestureComponent)
        }
        .onEnded { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            gestureComponent.onEnded(value: value)
            
            value.entity.components.set(gestureComponent)
        }
    }
}

// MARK: - Drag -

@MainActor
/// Gesture extension to support drag gestures.
public extension Gesture where Value == EntityTargetValue<DragGesture.Value> {
    
    /// Connects the gesture input to the `GestureComponent` code.
    func useGestureComponent() -> some Gesture {
        onChanged { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            gestureComponent.onChanged(value: value)
            
            value.entity.components.set(gestureComponent)
        }
        .onEnded { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            gestureComponent.onEnded(value: value)
            
            value.entity.components.set(gestureComponent)
        }
    }
}

// MARK: - Magnify (Scale) -
@MainActor
/// Gesture extension to support scale gestures.
public extension Gesture where Value == EntityTargetValue<MagnifyGesture.Value> {
    
    /// Connects the gesture input to the `GestureComponent` code.
    func useGestureComponent() -> some Gesture {
        onChanged { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            gestureComponent.onChanged(value: value)
            
            value.entity.components.set(gestureComponent)
        }
        .onEnded { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            gestureComponent.onEnded(value: value)
            
            value.entity.components.set(gestureComponent)
        }
    }
}

@MainActor
// MARK: - Tap Gesture Extension

public extension Gesture where Value == EntityTargetValue<TapGesture.Value> {
    
    /// Kết nối tap gesture với `GestureComponent`.
    func useTapGestureComponent() -> some Gesture {
        onEnded { value in
            guard var gestureComponent = value.entity.gestureComponent else { return }
            
            // Gọi hàm xử lý tap
            gestureComponent.onTap(value: value)
            
            // Gán lại gesture component sau khi xử lý
            value.entity.components.set(gestureComponent)
        }
    }
}
