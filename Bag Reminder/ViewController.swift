//
//  ViewController.swift
//  Bag Reminder
//
//  Created by Dominic Fox on 10/31/14.
//  Copyright (c) 2014 Presidential Applicaitons. All rights reserved.
//

import UIKit
import MapKit
import Foundation
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    let locationManager = CLLocationManager()
    
    
    var stores:[CLLocationCoordinate2D] = []
    var regions: [CLCircularRegion] = []
    
    @IBOutlet weak var theMapView: MKMapView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
     
       
        
        
        

      
        
        
        
        
        
        //Requesting Permission
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = 1
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedAlways) {
            locationManager.requestAlwaysAuthorization()
        
        }
        
       

        
        locationManager.startUpdatingLocation()
        locationManager.distanceFilter = 10
       
        
        
        
        
               //This makes app zoom in to Auburn after loading.
        var latOfCa:CLLocationDegrees = 38.8986
        var lonOfCa:CLLocationDegrees = -121.0744
        
        var latDelta:CLLocationDegrees = 0.2000
        var lonDelta:CLLocationDegrees = 0.2000
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var whereIsCali:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfCa, lonOfCa)
        
       
        var initialZoom:MKCoordinateRegion = MKCoordinateRegionMake(whereIsCali, theSpan)
        
        self.theMapView.setRegion(initialZoom, animated: true)
        
        
        
        var localNotificationTest:UILocalNotification = UILocalNotification()
        localNotificationTest.alertAction = "unlock it, Dingle💰"
        localNotificationTest.alertBody = "Grab your Bags!"
        localNotificationTest.fireDate = NSDate(timeIntervalSinceNow: 10)
         localNotificationTest.soundName = UILocalNotificationDefaultSoundName
        UIApplication.sharedApplication().scheduleLocalNotification(localNotificationTest)
        
        // Drops pins (annotations) on locations.
       
        //--------------------Trader Joes------------------
        var traderJoesAnnotation = MKPointAnnotation()
        var latOfTraderJoes:CLLocationDegrees = 38.746223
        var lonOfTraderJoes:CLLocationDegrees = -121.275029
        var traderJoes:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfTraderJoes, lonOfTraderJoes)
        var traderJoesRegion = CLCircularRegion(center: traderJoes, radius: CLLocationDistance(14), identifier:"traderJoes")
        
        traderJoesAnnotation.coordinate = traderJoes
        traderJoesAnnotation.title = "Trader Joes"
        traderJoesAnnotation.subtitle = "Don't forget to get Dom some candy!"
        self.theMapView.addAnnotation(traderJoesAnnotation)
        
        //-------------------SaveMart-----------------------
        var saveMartAnnotation = MKPointAnnotation()
        var latOfSaveMart:CLLocationDegrees = 38.905367
        var lonOfSaveMart:CLLocationDegrees = -121.073568
        var saveMart:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfSaveMart,lonOfSaveMart)
        var saveMartRegion = CLCircularRegion(center: saveMart, radius: CLLocationDistance(14), identifier:"saveMart")
        //regions.append(initWithCenter(traderJoes,25,"Trader Joes"))
        saveMartAnnotation.coordinate = saveMart
        saveMartAnnotation.title = "SaveMart"
        saveMartAnnotation.subtitle = "Grab Dom some icecream!"
        self.theMapView.addAnnotation(saveMartAnnotation)
        
        //------------------------Bel Air---------------------
        var latOfBelAir:CLLocationDegrees = 38.934786
        var lonOfBelAir:CLLocationDegrees = -121.091205
        var belAir:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfBelAir, lonOfBelAir)
        var belAirAnnotation = MKPointAnnotation()
        var belAirRegion = CLCircularRegion(center: belAir, radius: CLLocationDistance(14), identifier:"belAir")
        belAirAnnotation.coordinate = belAir
        belAirAnnotation.title = "Bel Air"
        belAirAnnotation.subtitle = "Maybe go next door and grab Dom a Jamba!"
        self.theMapView.addAnnotation(belAirAnnotation)
        
        //-------------------------------Grocery Outlet-------------
        var latOfGroveryOutlet:CLLocationDegrees = 38.904783
        var lonOfGroceryOutlet:CLLocationDegrees = -121.075567
        var groceryOutlet:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfGroveryOutlet, lonOfGroceryOutlet)
        var groceryOutletAnnotation = MKPointAnnotation()
        var groceryOutletRegion = CLCircularRegion(center: groceryOutlet, radius: CLLocationDistance(14), identifier:"groceryOutlet")
        groceryOutletAnnotation.coordinate = groceryOutlet
        groceryOutletAnnotation.title = "Grocery Outlet"
        groceryOutletAnnotation.subtitle = "Grab Dom an arizona😘"
        self.theMapView.addAnnotation(groceryOutletAnnotation)
        
        //------------------------------------Raleys--------------------------
        var latOfRaleys:CLLocationDegrees = 38.924291
        var lonOfRaleys:CLLocationDegrees = -121.054348
        var raleys:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfRaleys,lonOfRaleys)
        var raleysAnnotation = MKPointAnnotation()
        var raleysRegion = CLCircularRegion(center: raleys, radius: CLLocationDistance(14), identifier:"raleys")
        raleysAnnotation.coordinate = raleys
        raleysAnnotation.title = "Raley's"
        raleysAnnotation.subtitle = "Dom wants 4.5 lbs of Red Vines"
        self.theMapView.addAnnotation(raleysAnnotation)
        
        //--------------------------------Safeway-----------------------------------
        var latOfSafeway = 38.944064
        var lonOfSafeway = -121.092657
        var safeway:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfSafeway, lonOfSafeway)
        var safewayAnnotation = MKPointAnnotation()
        var safewayRegion = CLCircularRegion(center: safeway, radius: CLLocationDistance(14), identifier:"safeway")
        safewayAnnotation.coordinate = safeway
        safewayAnnotation.title = "Safeway"
        safewayAnnotation.subtitle = "Dom would LOVE a Starbucks"
        self.theMapView.addAnnotation(safewayAnnotation)
        
        //------------------------------------Nugget---------------------------------
        var latOfNugget = 38.789639
        var lonOfNugget = -121.279869
        var nugget:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfNugget, lonOfNugget)
        var nuggetAnnotation = MKPointAnnotation()
        var nuggetRegion = CLCircularRegion(center: nugget, radius: CLLocationDistance(14), identifier:"nugget")
        nuggetAnnotation.coordinate = nugget
        nuggetAnnotation.title = "Nugget"
        nuggetAnnotation.subtitle = "What the hell is the Nugget?"
        self.theMapView.addAnnotation(nuggetAnnotation)
        
        //---------------------------------------Whole Foods-----------------------------
        var latOfWholeFoods = 38.767393
        var lonOfWholeFoods = -121.267256
        var wholeFoods:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfWholeFoods, lonOfWholeFoods)
        var wholeFoodsAnnotation = MKPointAnnotation()
        var wholeFoodsRegion = CLCircularRegion(center: wholeFoods, radius: CLLocationDistance(14), identifier:"wholeFoods")
        wholeFoodsAnnotation.coordinate = wholeFoods
        wholeFoodsAnnotation.title = "Whole Foods"
        wholeFoodsAnnotation.subtitle = "Grab Dom a cake!"
        self.theMapView.addAnnotation(wholeFoodsAnnotation)
        
        /*/----------Pat's House for testing
        var latOfPatsHouse = 39.014286
        var lonOfPatsHouse = -121.020237
        var patsHouse:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latOfPatsHouse, lonOfPatsHouse)
        var patsHouseAnnotation = MKPointAnnotation()
        patsHouseAnnotation.coordinate = patsHouse
        patsHouseAnnotation.title = "Herro Apple"
        patsHouseAnnotation.subtitle = "🍏"
        self.theMapView.addAnnotation(patsHouseAnnotation) */
        
        
      
        //---------Getting location-------------
        
        stores.append(traderJoes)
        stores.append(saveMart)
        stores.append(belAir)
        stores.append(groceryOutlet)
        stores.append(raleys)
        stores.append(safeway)
        stores.append(nugget)
        stores.append(wholeFoods)
       // stores.append(patsHouse)
        regions.append(traderJoesRegion)
        regions.append(saveMartRegion)
        regions.append(belAirRegion)
        regions.append(groceryOutletRegion)
        regions.append(raleysRegion)
        regions.append(safewayRegion)
        regions.append(nuggetRegion)
     //   regions.append(CLCircularRegion(center: patsHouse, radius: 100, identifier:"pat"))
        regions.append(wholeFoodsRegion)
        
        for(var i = 0; i < regions.count; i++){
            locationManager.startMonitoringForRegion(regions[i])
        }
        for(var i = 0; i < locationManager.monitoredRegions.count; i++){
            //println( locationManager.monitoredRegions.allObjects[i] )
        }
    
       // println(locationManager.location.coordinate.latitude.description + " " + locationManager.location.coordinate.longitude.description)
    

        
        
    }

    
    
   func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        println("here")
    var localNotification:UILocalNotification = UILocalNotification()
    localNotification.alertAction = "it Dingle💰"
    localNotification.alertBody = "💰Grab your Bags💰"
    localNotification.soundName = UILocalNotificationDefaultSoundName
    localNotification.fireDate = NSDate(timeIntervalSinceNow: 3)
    UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
   

        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        
    }
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error.localizedDescription)
    }
    
     func locationManager(manager: CLLocationManager!, didStartMonitoringForRegion region: CLRegion!) {
        //println("here")

    }
        
    


 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

