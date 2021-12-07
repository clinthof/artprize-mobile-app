//
//  VenuModel.swift
//  MapPrototype
//
//  Created by Trevor C. Sweet on 11/30/21.
//

import Foundation
import CoreLocation
import UIKit


/**
 This class simulates the filling of data structures which would typically be handled by some type of cloud storage integration, such as Firebase.
*/
class VenueModel {
    fileprivate var venues : [Venue] = [Venue]()
    
    init() { createVenues() }
    
    func getVenues() -> [Venue] { return self.venues }
    
    fileprivate func createVenues() {
        venues.append(Venue(
            name: "Bitter End Coffee House",
            address: "752 Fulton St W, Grand Rapids, MI 49504",
            location: CLLocationCoordinate2D(latitude: 42.963360, longitude: -85687172),
            artworks: [
                Artwork(
                    title: "Grand Rapids # 1 & 2",
                    image: UIImage(named: "bitterEnd_1"),
                    artist: "Douglas Coon",
                    description: "Sometimes images require a great deal of planning and preparation, other times images fall into your lap. Grand Rapids # 1 &2 was an image that fell into my lap.",
                    medium: "Photography",
                    width: "24 in",
                    height: "18.5 in"
                ),
                Artwork(
                    title: "Together/Seperate; Beauty in a Pandemic",
                    image: UIImage(named: "bitterEnd_2"),
                    artist: "Deboarah Simms",
                    description: "This work is a 6ft by 3ft dyptch. Acrylic.The composition works individually or together, thus the name. I felt so strong about creating something beautiful in the worst of the pandemic and the statement 'Together-Seperately' used to describe the effort of working together while in the isolation of a lock down resonated in my thoughts as a composition. Finding beauty and using so much time alone to be productive was the prompt to keep me working. I viewed this time as a precious gift from God and wanted to use it wisely.",
                    medium: "Acrylics",
                    width: "6 ft",
                    height: "3 ft"
                ),
                Artwork(
                    title: "No Turnaround",
                    image: UIImage(named: "bitterEnd_3"),
                    artist: "Lorenzo Cristaudo",
                    description: nil,
                    medium: "Cement, Acrylic",
                    width: "18.75 in",
                    height: "24.75 in"
                ),
                Artwork(
                    title: "Joy and Serenity",
                    image: UIImage(named: "bitterEnd_4"),
                    artist: "Annette Radden",
                    description: nil,
                    medium: nil,
                    width: nil,
                    height: nil
                )
            ]
        ))
        // TODO: venues.append() next venue
    }
}
