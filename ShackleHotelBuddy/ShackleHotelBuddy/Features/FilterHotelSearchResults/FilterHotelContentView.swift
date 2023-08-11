//
//  FilterHotelContentView.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/9/23.
//

import SwiftUI

struct FilterHotelContentView: View {
    
    @Environment(\.dismiss) var dismiss: DismissAction
    
    @ObservedObject var slider = CustomSlider(start: 10, end: 20)
    
    @State private var sliderValueStart: CGFloat = 0.0
    @State private var sliderValueEnd: CGFloat = 1.0
    @State private var rating: Int = 0
    
    var data: String
    
    init(test: String) {
        data = test
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(SHBIcons.close)
                        .frame(width: 40, height: 40)
                        .background(Color(SHBColor.veryLightGrey))
                        .foregroundColor(.black)
                        .clipShape(Circle())
                        .padding(16)
                }
                Spacer()
            }
            
            VStack {
                HStack {
                    Text(SHBString.priceRange)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(10)
                
                HStack(spacing: 15) {
                    ZStack(alignment: .center) {  // Ensure center alignment
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 50, height: 40)
                            .border(Color.gray.opacity(0.5), width: 1)

                        Text("\(Int(sliderValueStart*100))")
                            .font(.body)
                            .foregroundColor(Color.black)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                    }
                    RangeSlider(lowerValue: $sliderValueStart, upperValue: $sliderValueEnd, minValue: 0, maxValue: 1)
                        .padding(5)
                    ZStack(alignment: .center) {  // Ensure center alignment
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 50, height: 40)
                            .border(Color.gray.opacity(0.5), width: 1)

                        Text("\(Int(sliderValueEnd*100))")
                            .font(.body)
                            .foregroundColor(Color.black)
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                    }
                }
                .padding([.leading, .trailing])
                
                HStack {
                    Text(SHBString.maxRating)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top, 20)
                .padding([.leading, .trailing], 10)
                
                HStack {
                    ForEach(1..<6) { index in
                        Image(systemName: rating >= index ? "star.fill" : "star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                            .foregroundColor(rating >= index ? Color(SHBColor.darkCyan) : Color.gray.opacity(0.5))
                            .onTapGesture {
                                rating = index
                            }
                    }
                    Spacer()
                }
                .padding(10)
            }
            .padding(.top, 16)
            .padding([.leading, .trailing])
            Spacer()
        }
    }
}

struct FilterHotelContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilterHotelContentView(test: "mock")
    }
}
