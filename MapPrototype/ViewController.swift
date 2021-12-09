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

    // TODO: This will likely become redundant due to the existence of VenueModel
    let venueLocations = [
        ["venue": "Bitter End Coffee House", "address": "752 Fulton St W, Grand Rapids, MI 49504", "latitude": 42.963360, "longitude": -85.687172],
        ["venue": "Grand Rapids Public Museum", "address": "272 Pearl St NW, Grand Rapids, MI 49504", "latitude": 42.966129, "longitude": -85.676666],
        ["venue": "Canopy by Hilton Grand Rapids", "address": "131 Ionia Ave SW, Grand Rapids, MI 49503", "latitude": 42.960049, "longitude": -85.670410],
        ["venue": "Brush Studio", "address": "11 Ionia Ave NW, Grand Rapids, MI 49503", "latitude": 42.963700, "longitude": -85.670250],
    ]
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
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
            locationManager.startUpdatingLocation()
            break
        case .denied:
            print("User denied request for location services")
            break
        case .restricted:
            print("User's location services are restricted")
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        @unknown default:
            print("Unknown/other location permissions (fatal)")
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
    
    func routeToVenue(_ venue: CLLocationCoordinate2D) {
        guard let currentLocation = locationManager.location?.coordinate else {
            return
        }
        
        let request = MKDirections.Request()
        let startPoint = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
        let endPoint = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude))
        
        request.source = MKMapItem(placemark: startPoint)
        request.destination = MKMapItem(placemark: endPoint)
        
        let path = MKDirections(request: request)
        path.calculate { response, error in
            guard let response = response else {
                print("Error")
                return
            }
            let route = response.routes[0]
            self.mapView.addOverlay(route.polyline)
        }
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        viewFor annotation: MKAnnotation
    ) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let identifier = "artwork"
        var view: MKMarkerAnnotationView
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
//        print(view.annotation?.coordinate ?? "home")
        routeToVenue(view.annotation!.coordinate)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        // Set the color for the line
        renderer.strokeColor = .red
        return renderer
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let lastKnownLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: lastKnownLocation, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}
