//
//  BoxView.swift
//
//
//  Created by Nutan Niraula on 18/9/23.
//

import SwiftUI

public struct BoxView: View {
    public var interval: CGFloat
    public var dividerViewWidth = 0.5
    
    public var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height
            let rows = Int(height / interval)
            let columns = Int(width / interval)
            ZStack {
                HStack(spacing: interval) {
                    ForEach(0..<columns, id: \.self) { _ in
                        Divider()
                            .frame(width: dividerViewWidth)
                    }
                }
                VStack(spacing: interval) {
                    ForEach(0..<rows, id: \.self) { _ in
                        Divider()
                            .frame(height: dividerViewWidth)
                    }
                }
            }
            .drawingGroup()
        }
    }
}


#Preview {
    BoxView(interval: 10)
        .frame(width: 300, height: 200)
}
