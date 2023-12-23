//
//  ListingDetailView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 12.12.2023.
//

import SwiftUI
import MapKit


struct ListingDetailView: View {
    
    var listing: Listing
    
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 40.85329,longitude: 14.305573),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    
    
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListiningImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background() {
                            Circle()
                                .fill(.white)
                                .frame(width: 32,height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading) {
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack(spacing: 2) {
                        PlaceRatingView()
                        Text("\(listing.rating)")
                        Text("28 reviews")
                            .underline()
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    Text("\(listing.city) \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity,alignment: .leading)
            Divider()
            
            //            Host info View
            HStack {
                VStack (alignment: .leading,spacing: 16) {
                    Text("Entire \(listing.type.description) hosted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250,alignment: .leading)
                    HStack(spacing: 2){
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedroms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) bathrooms")
                    }
                    .font(.caption)
                    Divider()
                    
                }
                .padding()
                .frame(width: 300,alignment: .leading)
                Spacer()
                
                Image("\(listing.ownerImage)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64,height: 64)
                    .clipShape(Circle())
                
            }
//            .padding()
            
            //            listing features
            
            VStack (alignment: .leading,spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack (alignment: .leading) {
                            Text("\(feature.title)")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            Text("\(feature.subtitle)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                    }
                }
                Divider()
            }
            .padding()
            
            
            //            Beddrooms view
            VStack (alignment: .leading, spacing: 16){
                Text("Where you`ll sleep")
                    .font(.headline)
                ScrollView (.horizontal,showsIndicators: false) {
                    HStack(spacing: 16){
                        ForEach(1 ... listing.numberOfBedroms, id: \.self) { bedroom in
                            VStack {
                                Image(systemName: "bed.double")
                                Text("Bedroom \(bedroom)")
                            }
                            .frame(width: 130, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                Divider()
            }
            .padding()
            
            
            //            listing amenities
            VStack (alignment: .leading,spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenity in
                    HStack{
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
                Divider()
            }
            .padding()
            
            VStack(alignment: .leading,spacing: 16){
                Text("Where you`ll be")
                    .font(.headline)
                
                Map(coordinateRegion: $region)
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .ignoresSafeArea()
        .padding(.bottom, 100)
        .overlay(alignment: .bottom) {
            VStack{
                Divider()
                    .padding(.bottom)
                HStack {
                    VStack (alignment: .leading){
                        Text("$\(listing.price)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Text("Oct 15-20")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding()
            }
        }
    }
}

struct ListingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListingDetailView(listing: DeveloperPreview.shared.listings[2])
    }
}
