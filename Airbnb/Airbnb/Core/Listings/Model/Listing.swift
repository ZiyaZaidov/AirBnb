//
//  Listing.swift
//  Airbnb
//
//  Created by Ziya Zaidov on 16.12.2023.
//

import Foundation

struct Listing :Identifiable,Codable,Hashable {
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingTypes
    
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImage: String
    let numberOfBedroms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var imageURL: [String]
    var price: Int
    
    let latitude: Double
    let longitude: Double
    
    let adress: String
    let city: String
    let state: String
    
    let title: String
    var rating: Double
    
}

enum ListingFeatures: Int,Identifiable,Codable,Hashable {
    
    var id: Int {return self.rawValue}
    
    case selfCheckIn
    case superHost
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self check-in"
        case .superHost:
            return "Superhost"
        }
    }

    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yor self in with the keypad"
        case .superHost:
            return "Superhost are expirienced,highly rated hosts who re commited to providing greate stars for guests"
        }
    }

    var imageName: String {
        switch self {
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
}

enum ListingAmenities: Int,Codable,Identifiable,Hashable {
    
    var id: Int {return self.rawValue}

    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }

}

enum ListingTypes: Int, Codable,Identifiable,Hashable {
case apartment
case house
case townHouse
case villa
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town House"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue}
}
