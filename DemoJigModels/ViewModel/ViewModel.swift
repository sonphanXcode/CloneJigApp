//
//  ViewModel.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI
import Observation

@Observable
class ViewModel {
    let speedConstant: Double = 0.4
    var isTitleFinished: Bool = false
    var listJigModels: [JigModel] = [
                                    JigModel(name: "jig1", image: "aviation2", immersiveStyle: .immer1),
                                    JigModel(name: "jig2", image: "aviation1", immersiveStyle: .immer2),
                                    JigModel(name: "jig3", image: "aviation4", immersiveStyle: .immer3),
                                    JigModel(name: "jig4", image: "aviation3"),
                                    JigModel(name: "jig5", image: "aviation3"),
                                    JigModel(name: "jig6", image: "aviation3"),
                                    JigModel(name: "jig7", image: "aviation3"),
                                    JigModel(name: "jig8", image: "aviation3"),
                                    ]
    
    var listAutomotiveModels: [JigModel] = [
                                    JigModel(name: "jig1", image: "automotive"),
                                    JigModel(name: "jig2", image: "automotive2"),
                                    JigModel(name: "jig3", image: "automotive3"),
                                    JigModel(name: "jig4", image: "machine1"),
                                    JigModel(name: "jig5", image: "automotive"),
                                    JigModel(name: "jig6", image: "automotive"),
                                    JigModel(name: "jig7", image: "automotive"),
                                    JigModel(name: "jig8", image: "automotive"),
                                    ]
    
}

struct JigModel: Identifiable {
    var id: UUID
    var name: String
    var image: String
    var immersiveStyle: ImmersiveStyle?
    
    init(id: UUID = UUID(), name: String, image: String, immersiveStyle: ImmersiveStyle? = nil) {
        self.id = id
        self.name = name
        self.image = image
        self.immersiveStyle = immersiveStyle
    }
}


enum ImmersiveStyle: String, Identifiable {
    case immer1, immer2, immer3
    
    var id: Self { self }
    
    var immersiveString: String {
        switch self {
        case .immer1:
            return "Immersive1"
        case .immer2:
            return "Immersive2"
        case .immer3:
            return "Immersive3"
        }
    }
}

struct ConstantValue {
    static let contentViewIdString = "ContentView"
}

struct JetEngineEntityName {
    static let PB_JetEngine_Combine = "PB_JetEngine_Combine"
    static let PB_JetEngine = "PB_JetEngine"
    static let SM_JetEngine = "SM_JetEngine"
    static let SM_JetEngine1 = "SM_JetEngine1"
    static let SM_JetEngine2 = "SM_JetEngine2"
    static let SM_Fan = "SM_Fan"
    static let SM_HalfLeft = "SM_HalfLeft"
    static let SM_HalfRight = "SM_HalfRight"
    
    
}

struct PB_JetEngine_Run_EntityName {
    static let PB_JetEngine_Run = "PB_JetEngine_Run"
}
