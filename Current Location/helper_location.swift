import CoreLocation

class LocationHelper:NSObject {

    private let locationManager = CLLocationManager()
    private var accuracy = CLLocationAccuracy()
    private var stopUpdate = Bool()
    
    var lastLocation = CLPlacemark()
    
    override init(){
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()//just with the app open
        //locationManager.requestAlwaysAuthorization() //in the background too
    }
    
    convenience init(accuracy: CLLocationAccuracy){
        self.init()
        locationManager.desiredAccuracy = accuracy
    }
    
    private func displayLocationInfo(placemark: CLPlacemark){
        lastLocation = placemark
        println(placemark.locality)
        println(placemark.postalCode)
        println(placemark.administrativeArea)
        println(placemark.country)
    }
    
    func start(){
        stopUpdate = false
        locationManager.startUpdatingLocation()
    }
    
    func stop(){
        locationManager.stopUpdatingLocation()
    }
    
    func updateLocationOnce(){
        stopUpdate = true
        locationManager.startUpdatingLocation()
    }
}

extension LocationHelper: CLLocationManagerDelegate{
    private func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        if self.stopUpdate{
            self.stopUpdate = false
            self.locationManager.stopUpdatingLocation()
        }
        CLGeocoder().reverseGeocodeLocation(manager.location)
        {(placemarks, error) -> Void in
            if (error != nil){println("Error reversegeocoding location with error: \(error.localizedDescription)")}
            if placemarks.count > 0
            {
                if let pm = placemarks[0] as? CLPlacemark{
                    self.displayLocationInfo(pm)
                }
            } else {println("Error with the data.")}
        }
    }
    
    private func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!)
    {
        println("Location manager did fail with message: \(error.localizedDescription)")
    }


}