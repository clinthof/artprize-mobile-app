//
//  ArtworkViewController.swift
//  MapPrototype
//
//  Created by Trevor C. Sweet on 12/8/21.
//

import Foundation
import UIKit

class ArtworkViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var artworkTitle: UITextView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var artworkDescription: UITextView!
    @IBOutlet weak var mediumLabel: UILabel!
    @IBOutlet weak var dimensionsLabel: UILabel!
    
    var artwork: Artwork!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.artworkImage.image = artwork.image
        self.artworkTitle.text = artwork.title
        self.artistName.text = artwork.artist
        self.artworkDescription.text = artwork.description ?? ""
        
        /* handling missing information for labels */
        
        if artwork.description == nil {
            descriptionLabel.isHidden = true
        }
        
        self.mediumLabel.text?.append(artwork.medium ?? "")
        
        if (artwork.width != nil) || (artwork.height != nil) {
            self.dimensionsLabel.text?.append((artwork.width!) + " x " + (artwork.height!))
        }
        
        // removes trailing edge padding from UITextViews
        self.artworkTitle.textContainer.lineFragmentPadding = 0.0
        self.artworkDescription.textContainer.lineFragmentPadding = 0.0
    }
}
