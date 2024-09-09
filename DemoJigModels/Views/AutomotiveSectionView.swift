//
//  AutomotiveSectionView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI

struct AutomotiveSectionView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 40) {
                    ForEach(viewModel.listAutomotiveModels) { automotive in
                        ItemsJigView(jigModel: automotive)
                            .frame(width: 300, height: 250)
                            .hoverEffect()
                            .cornerRadius(15)
                    }
                }
            }
            .buttonStyle(.plain)
            .padding(.leading, 50)
        } header: {
            Text("Automotive Industry")
                .font(.title3.bold())
                .padding(.vertical, 5)
                .padding(.leading, 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
}

#Preview {
    AutomotiveSectionView()
        .environment(ViewModel())
}
