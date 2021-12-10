//
//  ArtListViewController.swift
//  MapPrototype
//
//  Created by Trevor C. Sweet on 12/7/21.
//

import Foundation
import UIKit

class ArtworkListViewController: UITableViewController {
    
    @IBOutlet weak var topBar: UINavigationItem!
    @IBOutlet var artListTable: UITableView!
    
    var artworks: [Artwork]?
    var venueName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self

        self.artworks = artworks!
        topBar.title = venueName!
    }
    
    // MARK: UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let art = self.artworks {
            return art.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ArtworkCell", for: indexPath)
        
        if let artwork = self.artworks?[indexPath.row] {
            var content = cell.defaultContentConfiguration()
            
            content.text = artwork.title
            content.secondaryText = artwork.artist
            content.image = artwork.image
            // TODO: replace image with placeholder if one is not available
            content.imageProperties.maximumSize = CGSize(width: 128, height: 128)
            
            cell.contentConfiguration = content
        }
        return cell
    }
    
    // Pass Artwork object from relevant cell to segue destination (ArtworkViewController)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artworkViewSegue" {
            if let artworkVC = segue.destination as? ArtworkViewController {
                let selectedRow = tableView.indexPathForSelectedRow!.row
                
                artworkVC.artwork = artworks![selectedRow]
            }
        }
    }
}
