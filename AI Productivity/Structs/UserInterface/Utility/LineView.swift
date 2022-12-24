//
//  LineView.swift
//  AI Productivity
//
//  Created by Aviation Resources on 12/23/22.
//

import SwiftUI

/// A view that represents a simple divider with a weight and gap.
public struct LineView: View {
    //MARK: Input Properties
    ///The weight (thickness) of the line. Default - `.REGULAR`
    public let weight: LineWeight
    ///The gap position of the line.  Default - `.NONE`
    public let gapPostition: LineGap
    ///The color of the line.  Default - `Colors.primary`
    public let color: Color
    
    //MARK: Computed Properties
    public var separatorHeight: CGFloat {
        switch self.weight {
        case .REGULAR:
            return 1.0
        case .THICK:
            return 1.5
        case .THIN:
            return 0.5
        }
    }
    
    /// Enumeration describing the possible seperator weights
    public enum LineWeight {
        case THICK
        case REGULAR
        case THIN
    }

    /// Enumeration describing the possible separator gap positions
    public enum LineGap {
        case LEFT
        case RIGHT
        case NONE
        case SYMMETRICAL
    }
    
    
    //MARK: Body
    public var body: some View {
        HStack {
            GeometryReader { geo in
                switch self.gapPostition {
                case .NONE:
                    self.color
                case .LEFT:
                    Color.clear.frame(width: geo.size.width * 0.20)
                    self.color
                case .RIGHT:
                    self.color
                    Color.clear.frame(width: geo.size.width * 0.20)
                case .SYMMETRICAL:
                    Color.clear.frame(width: geo.size.width * 0.10)
                    self.color
                    Color.clear.frame(width: geo.size.width * 0.10)
                }
            }
        }.frame(height: self.separatorHeight)
    }
    
    //MARK: Init
    /// Create the style for the seperator.
    /// - Parameters:
    ///   - weight: The weight (thickness) of the line. Default - `.REGULAR`
    ///   - gapPosition: The gap position of the line.  Default - `.NONE`
    ///   - color: The color of the line.  Default - `Colors.primary.two`
    public init(weight: LineWeight = .REGULAR, gapPosition: LineGap = .NONE, color: Color = Color.primary) {
        self.weight = weight
        self.gapPostition = gapPosition
        self.color = color
    }
    
    //MARK: Functions
}




struct LineView_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 25) {
            LineView(weight: .REGULAR, gapPosition: .SYMMETRICAL)
            LineView(weight: .REGULAR, gapPosition: .LEFT)
            LineView(weight: .REGULAR, gapPosition: .RIGHT)
            LineView(weight: .REGULAR, gapPosition: .NONE)
        }
    }
}
