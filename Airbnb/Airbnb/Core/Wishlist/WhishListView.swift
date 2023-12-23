//
//  WhishListView.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 15.12.2023.
//

import SwiftUI

struct WhishListView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlist")
                        .font(.headline)
                    Text("You can create, view or edit wishlist once you've log in")
                        .font(.footnote)
                }
                LogInButton()
                Spacer()
            }
            .padding()
            .navigationTitle("Whishlist")
        }
    }
}

struct WhishListView_Previews: PreviewProvider {
    static var previews: some View {
        WhishListView()
    }
}
