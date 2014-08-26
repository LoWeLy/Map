//
//  g12ViewController.h
//  Map
//
//  Created by Anton on 8/26/14.
//  Copyright (c) 2014 g12-Squad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface g12ViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)generateShadick:(UIButton *)sender;

@end
