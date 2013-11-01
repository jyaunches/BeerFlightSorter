//
//  BeerFlight.h
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    LIGHT = 1,
    SOUR,
    FRUITY,
    WHEAT,
    LAGER,
    AMBER,
    SAISON,
    STOUT
} TastingStyle;


@interface Beer : NSObject

@property(nonatomic, copy) NSString *name;

- (id)initWithTastingStyles:(NSArray *)tastingStyles;

- (BOOL)hasStyle:(TastingStyle)style;

- (id)initWithName:(NSString *)string andTastingStyles:(NSArray *)styles;

- (float)styleScore;
@end
