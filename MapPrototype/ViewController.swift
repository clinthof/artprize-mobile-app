//
//  ViewController.swift
//  MapPrototype
//
//  Created by Felix clinthorne on 11/16/21.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    private let locationManager = CLLocationManager()
    let regionInMeters: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        checkLocationPermissions()
        createAnnotations(locations: venueLocations)
    }

    let venueLocations = [
        ["venue": "Bitter End Coffee House", "address": "752 Fulton St W, Grand Rapids, MI 49504", "latitude": 42.963360, "longitude": -85.687172],
        ["venue": "Grand Rapids Public Museum", "address": "272 Pearl St NW, Grand Rapids, MI 49504", "latitude": 42.966129, "longitude": -85.676666],
        ["venue": "Canopy by Hilton Grand Rapids", "address": "131 Ionia Ave SW, Grand Rapids, MI 49503", "latitude": 42.960049, "longitude": -85.670410],
        ["venue": "Brush Studio", "address": "11 Ionia Ave NW, Grand Rapids, MI 49503", "latitude": 42.963700, "longitude": -85.670250],
    ]
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // harder on battery
        locationManager.startUpdatingLocation()
    }
    
    func checkLocationPermissions() {
        if CLLocationManager.locationServicesEnabled() {
            setUpLocationManager()
            checkLocationAuthorization()
        } else {
            // show alert notifying user
        }
    }
    
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerOnUserLocation()
            break
        case .denied:
            // show alert instructing how to turn on permissions
            break
        case .restricted:
            // show an alert w/ explanation
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        @unknown default:
            fatalError()
        }
    }
    
    func centerOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func createAnnotations(locations: [[String: Any]]) {
        for location in locations {
            let annotation = MKPointAnnotation(
                __coordinate: CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees),
                title: location["venue"] as? String,
                subtitle: location["address"] as? String
            )
            mapView.addAnnotation(annotation)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
        if annotation is MKUserLocation {
            return nil
        }
        if let dequeuedView = mapView.dequeueReusableAnnotationView(
          withIdentifier: identifier) as? MKMarkerAnnotationView {
          dequeuedView.annotation = annotation
          view = dequeuedView
        } else {
          view = MKMarkerAnnotationView(
            annotation: annotation,
            reuseIdentifier: identifier)
          view.canShowCallout = true
          view.calloutOffset = CGPoint(x: -5, y: 5)
          view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
        print("callout clicked")
    }

}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // code here
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // code here
    }
    
}
