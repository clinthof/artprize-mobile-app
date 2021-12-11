# iOS MapKit ArtPrize Application

## Overview

## Getting Started
### Setting up the environment

## Coding Instructions
### General
### Setting up MapKit
The first step in using the MapKit API is importing it into the project.  Since the MapKit library is already in Swift, it can simply be imported at the top level of the main ViewController.  Next, open the object library, find an ``MKMapView``, and drag it into the main screen, setting the margins to the edges beyond the safe zone.  In the main view controller, create an outlet named mapView of type ``MKMapView?`` to reference this view.  Lastly, in the ``viewDidLoad`` function, set the mapView's delegate to self. This could alternatively be done programmatically by defining an MKMapView object and editing some of its properties.

### Setting up a location manager
Import CoreLocation under MapKit.  Define a new private constant locationManager and initialize it as a ``CLLocationManager`` object.  This object is what allows you to deliver and handle location-related events in the application.  Right now, we will use it to handle the user's location information and changes to its state.  To do so, the next thing to be done is make the view controller conform to the ``CLLocationManagerDelegate`` protocol via an extension below the primary class.  

We will override three of the delegate functions within this: ``didUpdateLocations``, which will be used to update the map based on user location changes; ``didFailWithError``, which is recommended by the Apple documentation to respond to any errors while updating the location; and ``didChangeAuthorization``, checking the state of the user's location permissions given to the application.  For now, leave these empty as we will write functions to handle these conditions and call them in them later on.

### User location functions
With a location manager defined, the next step is to begin writing functions to handle the user's location.

Write a new function named ``setUpLocationManager``.  This will be used to set the location manager to self, set the desired accuracy, and start updating the user location by calling ``startUpdatingLocation`` on the ``locationManager`` object.  It should resemble the following:
```swift
func setUpLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.startUpdatingLocation()
}
```
``startUpdatingLocation`` returns immediately and will cause ``locationManager`` to grab an initial location and notify the delegate.

Write another function, ``checkLocationPermissions``, that will check if the device's location services are enabled.  If so, it will set up the location manager and next check the location authorization, the logic of which will be in a following function.  Otherwise, indicate that the location services are disabled on the device.  This function should look like this:
```swift
func checkLocationPermissions() {
    if CLLocationManager.locationServicesEnabled() {
        setUpLocationManager()
        checkLocationAuthorization()
    } else {
        print("Location services are disabled on current device.")
    }
}
```
---
**Note**

Ideally, you would display an alert to the user to notify them of these issues, but since the primary focus is on map functionality and setting up custom alerts can be tedious, this is ommitted and we just print a meaningful message to the console.

---
The next function will be the aforementioned ``checkLocationAuthorization`` function called in the previous one.  This will include an exhaustive switch statement that will be important for checking the ``authorizationStatus`` property on the ``locationManager`` object to check the location permissions the user has given the application.  Swift requires that this be exhaustive, but not every case will be relevant to this tutorial.  The statement should follow the format:
```swift
switch locationManager.authorizationStatus {
case .authorizedAlways:
    mapView.showsUserLocation = true
    centerOnUserLocation()
    locationManager.startUpdatingLocation()
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
```
In either case of the user authorizing constant location tracking or just when in use, we will tell the mapView to show the user location and call ``centerOnUserLocation``, which will be written later.  We will then start updating the location.  If the user has denied the request, or the services are restricted in settings, print a specific statement to the console.  Again, this would ideally be handled with a custom alert so that the user is aware of what went wrong.  If not determined, we will simply request the location for when the application is in use as a constant location outside of using the app is not relevant.  Otherwise, if the state is unknown, print a statement indicating so to the console.

The next important function is ``centerOnUserLocation`` as it is called in some cases of the previous function.  This will just make sure that the screen's focal point is the user's current location.  First, unwrap ``locationManager.location?.coordinate`` via optional binding into a variable ``location`` and initialize an ``MKCoordinateRegion`` to center on this location.  Set the ``latitudinalMeters`` and ``longitudinalMeters`` each to 10000 (this is more appropriately done with a global constant) and call ``setRegion`` on the ``mapView`` to center on the predefined region.
```swift
func centerOnUserLocation() {
    if let location = locationManager.location?.coordinate {
        let region = MKCoordinateRegion.init(center: location,
                                             latitudinalMeters: regionInMeters,
                                             longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
}
```
### Delegate Extensions
Because the main view controller conforms to both the ``MKMapViewDelegate`` and ``CLLocationManagerDelegate`` protocols, it must implement their required functions.  This can be done a few different ways, but Swift style practices suggest these in extensions of the ViewController for better code organization.  

In the ``CLLocationManagerDelegate``, we will now write the bodies of the previously mentioned functions.  For ``didUpdateLocations``, we will need to unwrap ``locations.last``, this time using the ``guard`` syntax so that the function will return on nil.  The purpose of this function is to update the location on the map when it changes (e.g., when the user moves, etc.), so we will want a variable holding the coordinates of their last known location.  Next, define and initialize a region variable similar to how it was done in ``centerOnUserLocation``, this time centered on the user's last known location, and finally set the ``mapView`` region to this region.  The [source code](https://github.com/clinthof/artprize-mobile-app/blob/main/MapPrototype/ViewController.swift) can be referenced to see how these functions are written.

---
**Note**

Per the [source code](https://github.com/clinthof/artprize-mobile-app/blob/main/MapPrototype/ViewController.swift), you might also consider overriding the ``MKMapViewDelegate`` ``rendererFor`` function to change the line color (and potentially other ``polyline`` properties).  We used red, but there are several available.

---

## Further Reading and Conclusions
### Full directions functionality
For the sake of this tutorial, we did not fully implement directions within the application as this became lengthy and complex.  However, this is still something supported by MapKit, and can be done with an MKDirections object and directions requests.  This is partially implemented in the code for demonstration, but requires more in order to give step-by-step routes with time estimates, travel methods, and dozens of other features.  For our purposes, we just used a button on the venue halfsheet to redirect to iOS's existing maps application, but this functionality is still very much accessible.  We geared our focus more toward displaying venue information on a map that gives visitors a better idea of what is nearby.
