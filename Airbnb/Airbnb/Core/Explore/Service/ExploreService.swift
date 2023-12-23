//
//  ExploreService.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 16.12.2023.
//

import Foundation

class ExploreService {
    func fetchListings() throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
