//
//  FlightSorter.h
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightSorter : NSObject
+ (id)flightSorter;
- (NSArray *)sortBeers:(NSArray *)beersToSort;
@end
