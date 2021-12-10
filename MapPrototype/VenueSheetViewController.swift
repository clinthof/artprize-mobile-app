//
//  BottomSheetViewController.swift
//  MapPrototype
//
//  Created by Daniel Shamburger on 12/4/21.
//

import UIKit
import MapKit

class VenueSheetViewController: UIViewController {

    var venue: Venue = VenueModel().getVenues()[0]
    private var toArtworkList: UIStoryboardSegue!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .pageSheet
      
        self.isModalInPresentation = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func routeToVenue(venue: Venue) {
//        guard let currentLocation = locationManager.location?.coordinate else {
//            print("Error: No user location available.  Check device settings.")
//            return
//        }
//        let venueCoordinates = CLLocationCoordinate2DMake(venue.latitude, venue.longitude)
//
//        let request = MKDirections.Request()
//        let startPoint = MKPlacemark(
//            coordinate: CLLocationCoordinate2D(latitude: currentLocation.latitude, longitude: currentLocation.longitude))
//        let endPoint = MKPlacemark(coordinate: venueCoordinates)
//
//        request.source = MKMapItem(placemark: startPoint)
//        request.destination = MKMapItem(placemark: endPoint)
//
//        let path = MKDirections(request: request)
//
//        resetRoute(path)
//
//        path.calculate { response, error in
//            guard let response = response else {
//                print("Error: \(String(describing: error))")
//                return
//            }
//            let route = response.routes[0]
//            self.mapView.addOverlay(route.polyline)
//            self.mapView.setVisibleMapRect(route.polyline.boundingMapRect,
//                                           edgePadding: UIEdgeInsets(top: 0.0, left: 100.0,
//                                                                     bottom: 0.0, right: 100.0),
//                                           animated: true)
//        }
//
        let venuePlacemark = MKPlacemark(coordinate: venue.location!, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: venuePlacemark)
        
        mapItem.name = venue.name
        mapItem.openInMaps(launchOptions: nil)
    }
    
//    func resetRoute(_ route: MKDirections) {
//        mapView.removeOverlays(mapView.overlays)
//        routeArray.append(route)
//        routeArray.map { $0.cancel() }
//        routeArray.removeSubrange(0..<routeArray.count)
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let venueName = UILabel()
        
        venueName.textAlignment = .left
        venueName.text = venue.name
        venueName.font = UIFont.boldSystemFont(ofSize: 22)

        self.view.addSubview(venueName)
        
        venueName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            venueName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            venueName.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let venueAddress = UILabel()
        
        venueAddress.textAlignment = .left
        venueAddress.text = venue.address
        venueAddress.textColor = UIColor.systemGray
        venueAddress.adjustsFontSizeToFitWidth = false
        venueAddress.lineBreakMode = .byWordWrapping
        venueAddress.numberOfLines = 2
        
        self.view.addSubview(venueAddress)
        venueAddress.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueAddress.topAnchor.constraint(equalTo: venueName.bottomAnchor, constant: 5),
            venueAddress.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            venueAddress.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
        ])
        
        let venueButton = UIButton(type: .system, primaryAction: UIAction(title: "View Artwork", handler: { _ in
            self.openArtworkList()
        }))

        venueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        venueButton.setTitleColor(UIColor.white, for: .normal)
        venueButton.backgroundColor = UIColor.systemBlue
        venueButton.layer.cornerRadius = 5
        
        self.view.addSubview(venueButton)
        
        venueButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            venueButton.topAnchor.constraint(equalTo: venueAddress.bottomAnchor, constant: 30),
            venueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            venueButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            venueButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        let directionsButton = UIButton(type: .system, primaryAction: UIAction(title: "Open in Maps", handler: { _ in
            self.routeToVenue(venue: self.venue)
        }))

        directionsButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        directionsButton.setTitleColor(UIColor.systemBlue, for: .normal)
        directionsButton.backgroundColor = UIColor.systemGray5
        directionsButton.layer.cornerRadius = 5
        
        self.view.addSubview(directionsButton)
        
        directionsButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            directionsButton.topAnchor.constraint(equalTo: venueButton.bottomAnchor, constant: 10),
            directionsButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            directionsButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            directionsButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
    }
    
    func openArtworkList() {
        print("view artwork list tapped!!!!")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateViewController(withIdentifier: "artworkListController") as! ArtworkListViewController
        
        navigationController.artworks = venue.artworks
        navigationController.venueName = venue.name
        self.present(navigationController, animated: true, completion: nil)
    }
    
}
