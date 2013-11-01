//
//  BeerFlight.m
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "Beer.h"

@interface Beer ()
@property(nonatomic, strong) NSArray *tastingStyles;
@end

@implementation Beer

- (id)initWithTastingStyles:(NSArray *)tastingStyles {
    self = [super init];
    self.tastingStyles = tastingStyles;
    return self;
}

- (BOOL)hasStyle:(TastingStyle)style {
    return [self.tastingStyles containsObject:[NSNumber numberWithInt:style]];
}

- (id)initWithName:(NSString *)string andTastingStyles:(NSArray *)styles {
    self = [super init];
    self.name = string;
    self.tastingStyles = styles;
    return self;
}

- (float)styleScore {
    float totalScore = 0;
    for(NSNumber *tastingStyle in self.tastingStyles){
        totalScore += tastingStyle.floatValue;
    }
    return totalScore/self.tastingStyles.count;
}
@end
