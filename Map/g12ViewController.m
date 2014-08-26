//
//  g12ViewController.m
//  Map
//
//  Created by Anton on 8/26/14.
//  Copyright (c) 2014 g12-Squad. All rights reserved.
//

#import "g12ViewController.h"

@interface g12ViewController () {
    CLLocationDegrees latitude, longtitude;
}

@end

@implementation g12ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
}

- (void) mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {

    latitude = mapView.userLocation.coordinate.latitude;
    longtitude = mapView.userLocation.coordinate.longitude;
    mapView.centerCoordinate = mapView.userLocation.coordinate;
}

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
//{
//    static NSString *defaultPinID = @"My pin";
//    MKPinAnnotationView *pinView  = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
//    pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
//    if (annotation == mapView.userLocation)
//    {
//           return nil;
//    }
//    pinView.pinColor = MKPinAnnotationColorGreen; // you can use MKPinAnnotationColorPurple, MKPinAnnotationColorRed;
//    pinView.canShowCallout = YES;
//    pinView.animatesDrop = NO;
//    
//    return pinView;
//}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *AnnotationViewID = @"annotationViewID";
    
    MKAnnotationView *annotationView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    
    if (annotationView == nil)
    {
        annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    }
    
    if (annotation == mapView.userLocation)
    {
        return nil;
    }
    
    annotationView.image = [UIImage imageNamed:@"Sha.png"];//add any image which you want to show on map instead of red pins
    annotationView.bounds = CGRectMake(0, 0, 20, 20);
    annotationView.annotation = annotation;
    annotationView.canShowCallout = YES;
    
    return annotationView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generateShadick:(UIButton *)sender {
    
    CLLocationCoordinate2D annotationCoordinate;
    annotationCoordinate.latitude = latitude + arc4random()%50 - 25;
    annotationCoordinate.longitude = longtitude + arc4random()%50 - 25;
    //    NSLog(@"%f, %f", annotationCoordinate.latitude, annotationCoordinate.longitude);
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = annotationCoordinate;
    annotationPoint.title = @"Shadick";
    annotationPoint.subtitle = @"Shadick was everywhere";
    [_mapView addAnnotation:annotationPoint];
}
@end
