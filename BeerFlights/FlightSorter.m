//
//  FlightSorter.m
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "FlightSorter.h"

@implementation FlightSorter

+ (id)flightSorter {
    static FlightSorter *flightSorter = nil;
    if (!flightSorter)
        flightSorter = [[FlightSorter alloc] init];

    return flightSorter;
}

- (NSArray *)sortBeers:(NSArray *)beersToSort {
    NSMutableArray *mutableBeers = [beersToSort mutableCopy];
    NSSortDescriptor *createdAtDescriptor = [[NSSortDescriptor alloc] initWithKey:@"styleScore" ascending:YES];
    [mutableBeers sortUsingDescriptors:[NSArray arrayWithObjects:createdAtDescriptor, nil]];

    return mutableBeers;
}
@end
