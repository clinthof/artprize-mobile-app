//
//  Venue.swift
//  MapPrototype
//
//  Created by Trevor C. Sweet on 11/30/21.
//

import Foundation
import CoreLocation
import UIKit

/**
 This structure hold information relevant to points on the map, as well as associating venues to works of art.
*/
struct Venue {
    let name : String?
    let image : UIImage?
    let address : String?
    let location : CLLocationCoordinate2D?
    let description : String?
    let artworks : [Artwork]?
    
    init(name: String?, image: UIImage?, address: String?, location: CLLocationCoordinate2D?, artworks: [Artwork]?, description: String?) {
        self.name = name
        self.image = image
        self.address = address
        self.location = location
        self.description = description
        self.artworks = artworks
    }
    
    init() { self.init(name: nil, image: nil, address: nil, location: nil, artworks: nil, description: nil) }
}

/**
This structure holds all information relevant to a single work of art, as well as associates that work of art to a venue.
*/
struct Artwork {
    let title : String?
    let image : UIImage?
    let artist : String?
    let description : String?
    let medium : String?
    let width : String?
    let height : String?
    
    init(title: String?, image: UIImage?, artist: String?, description: String?, medium: String?, width: String?, height: String?) {
        self.title = title
        self.image = image
        self.artist = artist
        self.description = description
        self.medium = medium
        self.width = width
        self.height = height
    }
    
    init() { self.init(title: nil, image: nil, artist: nil, description: nil, medium: nil, width: nil, height: nil) }
}
