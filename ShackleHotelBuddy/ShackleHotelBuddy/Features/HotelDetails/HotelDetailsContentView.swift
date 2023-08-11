//
//  HotelDetailsContentView.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/9/23.
//

import SwiftUI

struct HotelDetailsContentView: View {

    @ObservedObject var viewModel: HotelDetailsViewModel
    @Environment(\.dismiss) var dismiss: DismissAction

    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 0) {
                    ZStack {
                        AsyncImage(url: URL(string: viewModel.hotel.image)){ image in
                            image
                                .resizable()
                                .frame(height: 200)
                                .aspectRatio(contentMode: .fill)
                                .padding(0)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } placeholder: {
                            Image(SHBImage.backgroundImage)
                        }
                    }


                    VStack {
                        HStack {
                            Text(viewModel.hotel.name)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Spacer()
                            HStack {
                                Image(SHBIcons.grade)
                                    .padding(0)
                                    .foregroundColor(.black)
                                Text("\(viewModel.hotel.rating)")
                                    .foregroundColor(.black)
                                    .padding(0)
                            }

                        }
                        Spacer()
                        HStack {
                            Text(viewModel.hotel.location)
                                .foregroundColor(Color(SHBColor.grey))
                                .fontWeight(.regular)
                            Spacer()
                        }
                        Spacer()
                        HStack {
                            Text(SHBString.euroSymbol + "\(viewModel.hotel.price) ")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text(SHBString.night)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .padding(0)
                            Spacer()
                        }
                    }.padding(.top, 16)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                }
                .frame(maxHeight: 300)
                Spacer()
            }
        }
        .frame(alignment: .top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image(SHBIcons.arrowBack)
                        .frame(width: 40, height: 40)
                        .background(Color(SHBColor.veryLightGrey))
                        .foregroundColor(.black)
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct HotelDetailsContentView_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetailsContentView(viewModel: HotelDetailsViewModel(hotel: Hotel(id: "", name: "", location: "", image: "", price: 0, rating: 0)))
    }
}

