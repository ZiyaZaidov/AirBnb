//
//  ListiningImageCarouselView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 12.12.2023.
//

import SwiftUI

struct ListiningImageCarouselView: View {
   
    let listing: Listing

    var body: some View {
            TabView {
                ForEach (listing.imageURL, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
                .tabViewStyle(.page)
    }
}

struct ListiningImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ListiningImageCarouselView(listing: DeveloperPreview.shared.listings[0])
    }
}
