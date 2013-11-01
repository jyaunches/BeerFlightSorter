//
//  BeerFlightListVC.m
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "BeerFlightListVC.h"
#import "FlightSorter.h"
#import "Beer.h"

@implementation BeerFlightListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.beersForFlight = [[FlightSorter flightSorter] sortBeers:self.beersForFlight];
    for(Beer *beer in self.beersForFlight){
        NSString *string = [self.flightTextView.text stringByAppendingString:[NSString stringWithFormat:@"%@ \n", beer.name]];
        self.flightTextView.text = string;
    }
}

@end
