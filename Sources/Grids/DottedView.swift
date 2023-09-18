//
//  DottedView.swift
//  
//
//  Created by Nutan Niraula on 18/9/23.
//

import SwiftUI

public struct DottedView: View {
    private struct DottedLine: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.move(to: CGPoint.zero)
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            return path
        }
    }

    public var dotSize: CGFloat = 2
    public var spacing: CGFloat = 20
    
    public var body: some View {
        GeometryReader { proxy in
            let rows = Int(proxy.size.width / (spacing + dotSize)) + 1
            HStack(spacing: spacing) {
                ForEach(0..<rows, id: \.self) { _ in
                    DottedLine()
                        .stroke(style: StrokeStyle(lineWidth: dotSize, dash: [dotSize,spacing]))
                        .frame(width: dotSize, height: proxy.size.height)
                        .foregroundColor(Color.gray)
                }
            }
        }
        .drawingGroup()
    }
}


#Preview {
    DottedView()
        .frame(width: 200, height: 200)
}
