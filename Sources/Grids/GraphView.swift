// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct GraphView: View {
    public var interval: CGFloat
    public var subInterval = 5
    public var dividerWidth = 0.5
    
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let rows = Int(height / interval)
            let columns = Int(width / interval)
            ZStack {
                HStack(spacing: interval) {
                    ForEach(0..<columns, id: \.self) { index in
                        Divider()
                            .frame(width: dividerWidth)
                            .overlay(index % subInterval == 0 ? Color.gray : Color.gray.opacity(0.2))
                    }
                }
                VStack(spacing: interval) {
                    ForEach(0..<rows, id: \.self) { index in
                        Divider()
                            .frame(height: dividerWidth)
                            .overlay(index % subInterval == 0 ? Color.gray : Color.gray.opacity(0.2))
                    }
                }
            }
            .drawingGroup()
        }
    }
}

#Preview {
    GraphView(interval: 10).frame(width: 300, height: 200)
}
