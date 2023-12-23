//
//  ListingItemView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 11.12.2023.
//

import SwiftUI

struct ListingItemView: View {
    
    var listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            //            images
           
            ListiningImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //            listing details
            HStack(alignment: .top) {
//                details
                VStack (alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3-10")
                        .foregroundStyle(.gray)
                    HStack (spacing: 4){
                        Text("$\(listing.price)")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                //                rating
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\(listing.rating)")
                }
            }
            .foregroundStyle(.black)
            .font(.footnote)
        }
        .padding()
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingItemView(listing: DeveloperPreview.shared.listings[3])
    }
}
