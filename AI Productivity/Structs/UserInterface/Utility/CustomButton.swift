//
//  CustomButton.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/23/22.
//

import Foundation
import SwiftUI

/// Insert some documentation here
struct CustomButton: View {
    //MARK: Environment and State objects
    
    //MARK: State and Binding objects
    @Binding var networkingState: NetworkingState
    //MARK: Other properties
    let imageName: String?
    let buttonText: String
    let color: Color
    let tintColor: Color
    
    //MARK: View Body
    var body: some View {
        HStack(spacing: 8) {
            switch networkingState {
            case .neverCalled, .finished, .noResults:
                if let imageName = imageName {
                    Image(systemName: imageName).font(.title3.bold()).foregroundColor(tintColor)
                }
                Text(buttonText).font(.body.bold()).foregroundColor(tintColor)
            case .networking:
                ProgressView().progressViewStyle(.automatic).foregroundColor(tintColor)
            case .error(let error):
                Image(systemName: "goforward").font(.title3.bold()).foregroundColor(tintColor)
                switch error {
                case let convertable as CustomStringConvertible:
                    Text(convertable.description).font(.body.bold()).foregroundColor(tintColor)
                default:
                    Text(error.localizedDescription).font(.body.bold()).foregroundColor(tintColor)
                }
            }
        }
        .padding([.leading, .trailing], 24)
        .padding([.top, .bottom], 12)
        .background(color)
        .clipShape(Capsule(style: .circular))
        .shadow(radius: 3, x: 0, y: 3)
    }
    
    //MARK: Init if needed
    internal init(networkingState: Binding<NetworkingState> = .constant(.neverCalled), imageName: String? = nil, buttonText: String, color: Color, tintColor: Color) {
        self._networkingState = networkingState
        self.imageName = imageName
        self.buttonText = buttonText
        self.color = color
        self.tintColor = tintColor
    }
    
    //MARK: Functions
    
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomButton(imageName: "paperplane", buttonText: "Send", color: Color.green, tintColor: Color.darkModeWhite)
            CustomButton(networkingState: .constant(.error(NetworkingError.noAPIKey)), imageName: "paperplane", buttonText: "Send", color: Color.green, tintColor: Color.darkModeWhite)
        }
        
    }
}
