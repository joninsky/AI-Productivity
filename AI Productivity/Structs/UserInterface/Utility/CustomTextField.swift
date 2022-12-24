//
//  CustomTextField.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/24/22.
//

import Foundation
import SwiftUI

/// Insert some documentation here
struct CustomTextField: View {
    //MARK: Environment and State objects
    
    //MARK: State and Binding objects
    @Binding var inputText: String
    @State var showPlaceholder: Bool = true
    
    //MARK: Other properties
    
    let onSubmit: (() -> Void)
    
    //MARK: View Body
    var body: some View {
        VStack {
            ZStack {
                switch showPlaceholder {
                case true:
                    HStack {
                        Text("Human input").font(.body.italic()).foregroundColor(Color.darkModeWhite)
                        Spacer()
                    }
                case false:
                    EmptyView()
                }
                if #available(iOS 16.0, *) {
                    TextField("", text: $inputText, axis: .vertical).onSubmit({
                        onSubmit()
                    })
                    .textFieldStyle(.plain)
                    .foregroundColor(Color.darkModeWhite)

                } else {
                    TextField("", text: $inputText, onCommit: {
                        onSubmit()
                    })
                    .textFieldStyle(.plain)
                    .foregroundColor(Color.darkModeWhite)
                }

            }.onChange(of: inputText) { newValue in
                showPlaceholder = newValue.isEmpty
            }
            Color.darkModeWhite.frame(height: 1)
        }.padding([.leading, .trailing], 24).padding([.top, .bottom], 12).background(Color.green).clipShape(Capsule(style: .circular))
    }
    
    //MARK: Init if needed
    internal init(inputText: Binding<String>, onSubmit: @escaping (() -> Void)) {
        self._inputText = inputText
        self.onSubmit = onSubmit
    }
    
    //MARK: Functions
    
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomTextField(inputText: .constant("")) {
                
            }
        }
    }
}
