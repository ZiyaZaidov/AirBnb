//
//  ExploreViewModel.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 16.12.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var listings: [Listing] = []
    private var service: ExploreService
    
    init(service: ExploreService) {
        self.service = service
        Task {await fetchlisting() }
    }
    
    func fetchlisting() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed fetching \(error.localizedDescription)")
        }
    }
}
