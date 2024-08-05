//
//  ImageSliderView.swift
//  VAIDid13
//
//  Created by Krish Mittal on 05/08/24.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var sliderPosition: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("before").resizable().scaledToFit()
                Image("after").resizable().scaledToFit()
                    .mask {
                        Rectangle()
                            .offset(x: sliderPosition + geometry.size.width / 2)
                    }
                Rectangle().fill(.white)
                    .frame(width: 4)
                    .overlay {
                        Circle()
                            .fill(.white)
                            .frame(width: 30, height: 30)
                    }.offset(x: sliderPosition)
            }
            .padding(.top, 30)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        sliderPosition = min(max(value.location.x - geometry.size.width / 2, -geometry.size.width / 2), geometry.size.width / 2)
                    })
            )
        }
    }
}

#Preview {
    ImageSliderView()
}
