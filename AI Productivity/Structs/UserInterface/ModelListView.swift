//
//  ModelListView.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/17/22.
//

import Foundation
import SwiftUI

/// Insert some documentation here
struct ModelListView: View {

    //MARK: Environment and State objects
    @EnvironmentObject var conversationController: ConversationController
    @EnvironmentObject var model: ModelListController
    //MARK: State and Binding objects
    
    //MARK: Other properties
    var modelSelected: ((_ model: OpenAIModel) -> Void)?
    
    //MARK: View Body
    var body: some View {
        ZStack {
            switch model.networkingState {
            case .networking:
                ProgressView()
            case .error(let error):
                VStack {
                    Image(systemName: "xmark")
                    Text(error.localizedDescription)
                }
            case .finished, .neverCalled:
                modelList
            case .noResults:
                Text("No results")
            }
        }.task {
            await model.queryModelList()
        }

    }
    
    var modelList: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(model.filteredData) { model in
                    Button {
                        modelSelected?(model)
                    } label: {
                        HStack {
                            Text(model.humanReadableName()).font(.title3).foregroundColor(Color.primary)
                            Spacer()
                            switch model == conversationController.selectedModel {
                            case true:
                                Image(systemName: "checkmark.circle").foregroundColor(Color.green).font(.body)
                            case false:
                                EmptyView()
                            }
                        }
                    }
                }
            }
        }
    }
    
    //MARK: Init if needed

    
    //MARK: Functions
    
}

struct ModelListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ModelListView()
            ModelListView()
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            ModelListView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            ModelListView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
            ModelListView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
            ModelListView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)")).previewInterfaceOrientation(InterfaceOrientation.landscapeLeft)
                .preferredColorScheme(.dark)
        }
        
    }
}
