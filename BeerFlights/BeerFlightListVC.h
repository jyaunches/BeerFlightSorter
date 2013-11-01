//
//  BeerFlightListVC.h
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerFlightListVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *flightTextView;
@property(nonatomic, strong) NSArray *beersForFlight;
@end
