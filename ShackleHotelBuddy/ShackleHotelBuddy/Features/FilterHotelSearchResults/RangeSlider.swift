import SwiftUI

struct RangeSlider: View {
    @Binding var lowerValue: CGFloat
    @Binding var upperValue: CGFloat
    let minValue: CGFloat
    let maxValue: CGFloat

    private let trackHeight: CGFloat = 4.0
    private let thumbSize: CGFloat = 24.0

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Track
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(height: trackHeight)

                // Active range track
                Rectangle()
                    .foregroundColor(Color("color/darkCyan"))
                    .frame(width: geometry.size.width * (upperValue - lowerValue),
                           height: trackHeight)
                    .offset(x: geometry.size.width * lowerValue)

                // Lower thumb
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: thumbSize, height: thumbSize)
                    .shadow(radius: 2)
                    .position(x: geometry.size.width * lowerValue, y: geometry.size.height / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let newValue = (gesture.location.x / geometry.size.width)
                                self.lowerValue = min(max(minValue, newValue), upperValue)
                            }
                    )

                // Upper thumb
                Circle()
                    .foregroundColor(Color.white)
                    .frame(width: thumbSize, height: thumbSize)
                    .shadow(radius: 2)
                    .position(x: geometry.size.width * upperValue, y: geometry.size.height / 2)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let newValue = (gesture.location.x / geometry.size.width)
                                self.upperValue = min(max(newValue, lowerValue), maxValue)
                            }
                    )
            }
        }
        .frame(height: thumbSize)
    }
}

struct RangeSlider_Previews: PreviewProvider {
    @State static var lower = CGFloat(0.2)
    @State static var upper = CGFloat(0.8)

    static var previews: some View {
        RangeSlider(lowerValue: $lower, upperValue: $upper, minValue: 0, maxValue: 1)
            .padding()
    }
}

