//
//  PlaceRatingView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 12.12.2023.
//

import SwiftUI

struct PlaceRatingView: View {
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
            Text("")
            
        }
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceRatingView()
    }
}
