# iOS MaoKit ArtPrize Application

## Overview

## Getting Started
### Setting up the environment

## Coding Instructions
### Setting up MapKit
The first step in using the MapKit API is importing it into the project.  Since the MapKit library is already in Swift, it can simply be imported at the top level of the main ViewController.  Next, open the object library, find an MKMapView, and drag it into the main screen, setting the margins to the edges beyond the safe zone.  In the main view controller, create an outlet named mapView of type MKMapView? to reference this view.  Lastly, in the viewDidLoad function, set the mapView's delegate to self. This could alternatively be done programmatically by defining an MKMapView object and editing some of its properties.

### Setting up a location manager
Import CoreLocation under MapKit.  Define a new private constant locationManager and initialize it as a CLLocationManager object.  This object is what allows you to deliver and handle location-related events in the application.  Right now, we will use it to handle the user's location information and changes to its state.  To do so, the next thing to be done is make the view controller conform to the CLLocationManagerDelegate protocol via an extension below the primary class.  

We will override two of the delegate functions within this: didUpdateLocations, which will be used to update the map based on user location changes; and didChangeAuthorization, checking the state of the user's location permissions given to the application.  For now, leave these empty as we will write functions to handle these conditions and call them in them later on.

### User location functions
With a location manager defined, the next step is to begin writing functions to handle the user location.
<img width="93" alt="Screen Shot 2021-12-10 at 4 28 41 PM" src="https://user-images.githubusercontent.com/73394309/145643611-4c33be64-6a88-491f-96c6-d659a75be7c6.png">

Write a new function named setUpLocationManager.  This will be 

## Further Reading and Conclusions
