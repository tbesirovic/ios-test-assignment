//
//  SearchHotelContentView.swift
//  ShackleHotelBuddy
//
//  Created by Timur on 8/6/23.
//

import SwiftUI
import Combine

struct SearchHotelContentView: View {
 
    @StateObject private var viewModel = SearchHotelViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
        
                Image(SHBImage.backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Image(SHBImage.logoImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 50)
                            .padding(.top, 20)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Text(SHBString.selectData)
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                        .padding(.trailing,50 )
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        EntryView(label: SHBString.checkInDate, content: {
                            DatePicker("", selection: $viewModel.checkInDate, in: Date()..., displayedComponents: .date)
                        })
                        
                        EntryView(label: SHBString.checkOutDate, content: {
                            DatePicker("", selection: $viewModel.checkOutDate, in: viewModel.checkInDate..., displayedComponents: .date)
                        })
                        
                        EntryView(label: SHBString.numberOfGuests, content: {
                            Stepper(value: $viewModel.numberOfGuests, in: 1...10) {
                                Text("\(viewModel.numberOfGuests)")
                                    .foregroundColor(.black)
                            }
                        })
                        
                        EntryView(label: SHBString.numberOfChildren, content: {
                            Stepper(value: $viewModel.numberOfChildren, in: 0...10) {
                                Text("\(viewModel.numberOfChildren)")
                                    .foregroundColor(.black)
                            }
                        })
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.getHotelsRequest()
                                  
                                  
                              
                    }) {
                        Text(SHBString.search)
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding()
                            .padding(.horizontal, 100)
                            .background(Color(SHBColor.darkCyan))
                            .cornerRadius(20)
                        
                    }
                    .padding(.bottom, 30)
                    NavigationLink(
                        destination: HotelSearchResults(),
                        isActive: $viewModel.hotelsDataReceived,
                        label: {
                            EmptyView()
                        }
                    )
                }
                .foregroundColor(.white)
                .padding()
            }
        }
    }
}

struct EntryView<Content: View>: View {
    var label: String
    var content: () -> Content
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.black)
                .frame(width: 150, alignment: .leading)
            
            content()
        }
        .padding(.vertical, 8)
    }
}

struct SearchHotelContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHotelContentView()
    }
}

