//
//  HotelSearchResultsContentView.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/7/23.
//

import SwiftUI

struct HotelSearchResults: View {
    
    @StateObject var viewModel = HotelSearchResultsViewModel()
    @Environment(\.dismiss) var dismiss: DismissAction
    @State private var showingSheet = false
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.hotels, id: \.self) { hotel in
                NavigationLink(destination: HotelDetailsContentView(viewModel: HotelDetailsViewModel(hotel: hotel))) {
                    VStack(spacing: 0) {
                        ZStack {
                            AsyncImage(url: URL(string: hotel.image)){ image in
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
                                Text(hotel.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Spacer()
                                HStack {
                                    Image(SHBIcons.grade)
                                        .padding(0)
                                        .foregroundColor(.black)
                                    Text("\(hotel.rating)")
                                        .foregroundColor(.black)
                                        .padding(0)
                                }
                                
                            }
                            Spacer()
                            HStack {
                                Text(hotel.location)
                                    .foregroundColor(Color(SHBColor.grey))
                                    .fontWeight(.regular)
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text(SHBString.euroSymbol + "\(hotel.price)")
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text(SHBString.night)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .padding(0)
                                Spacer()
                            }
                        }.padding(.top, 16)
                    }
                }
            }.padding(16)
                .navigationBarBackButtonHidden(true)
                .navigationBarTitle(SHBString.searchResult)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(SHBIcons.discoverTune)
                        .frame(width: 40, height: 40)
                        .background(Color(SHBColor.veryLightGrey))
                        .foregroundColor(.black)
                        .clipShape(Circle())
                }
            }
            
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
        .sheet(isPresented: $showingSheet) {
            FilterHotelContentView(test: "test")
        }
    }
}

struct HotelSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        HotelSearchResults(viewModel: HotelSearchResultsViewModel())
    }
}


