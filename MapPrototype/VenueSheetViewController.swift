//
//  BottomSheetViewController.swift
//  MapPrototype
//
//  Created by Daniel Shamburger on 12/4/21.
//

import UIKit

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let venueName = UILabel()
        
        venueName.textAlignment = .left
        venueName.text = venue.name
        venueName.font = UIFont.systemFont(ofSize: 20)

        self.view.addSubview(venueName)
        
        venueName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            venueName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
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
        
        let venueButton = UIButton(type: .system, primaryAction: UIAction(title: "View Art", handler: { _ in
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
        
        let directionsButton = UIButton(type: .system)

        directionsButton.setTitle("Get Directions", for: .normal)
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
