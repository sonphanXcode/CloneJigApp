//
//  LibraryView.swift
//  DemoJigModels
//
//  Created by SonPT61 on 28/8/24.
//

import SwiftUI

struct LibraryView: View {
    
    @Environment(ViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        Section {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(viewModel.listJigModels) { jigModel in
                        
                        ItemsJigView(jigModel: jigModel)
                            .frame(width: 300, height: 150)
                            .hoverEffect()
                            .cornerRadius(15)
                    }
                }
            }
            .buttonStyle(.plain)
            .padding(.leading, 50)
        } header: {
            Text("Aviation Industry")
                .font(.title3.bold())
                .padding(.vertical, 5)
                .padding(.leading, 50)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
}

#Preview {
    LibraryView()
        .environment(ViewModel())
}



