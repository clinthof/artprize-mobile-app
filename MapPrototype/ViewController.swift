//
//  ViewController.swift
//  MapPrototype
//
//  Created by Felix clinthorne on 11/16/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coordinate = CLLocationCoordinate2D(latitude: 42.949, longitude: -85.694)
        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        createAnnotations(locations: venueLocations)

    }

    let venueLocations = [
        ["venue": "Bitter End Coffee House", "address": "752 Fulton St W, Grand Rapids, MI 49504", "latitude": 42.963360, "longitude": -85.687172],
        ["venue": "Grand Rapids Public Museum", "address": "272 Pearl St NW, Grand Rapids, MI 49504", "latitude": 42.966129, "longitude": -85.676666],
        ["venue": "Canopy by Hilton Grand Rapids", "address": "131 Ionia Ave SW, Grand Rapids, MI 49503", "latitude": 42.960049, "longitude": -85.670410],
        ["venue": "Brush Studio", "address": "11 Ionia Ave NW, Grand Rapids, MI 49503", "latitude": 42.963700, "longitude": -85.670250],
    ]
    
    func createAnnotations(locations: [[String: Any]]) {
        for location in locations {
            let annotation = MKPointAnnotation()
            annotation.title = location["venue"] as? String
            annotation.subtitle = location["address"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            mapView.addAnnotation(annotation)
        }
        
    }

}

