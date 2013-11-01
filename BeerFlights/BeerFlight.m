//
//  BeerFlight.m
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "BeerFlight.h"

@interface BeerFlight ()
@property(nonatomic, strong) NSArray *tastingStyles;
@end

@implementation BeerFlight

- (id)initWithTastingStyles:(NSArray *)tastingStyles {
    self = [super init];
    self.tastingStyles = tastingStyles;
    return self;
}

- (BOOL)hasStyle:(TastingStyle)style {
    return [self.tastingStyles containsObject:[NSNumber numberWithInt:style]];
}

- (float)styleScore {
    float totalScore = 0;
    for(NSNumber *tastingStyle in self.tastingStyles){
        totalScore += tastingStyle.floatValue;
    }
    return totalScore/self.tastingStyles.count;
}
@end
