#import "Kiwi.h"
#import "Beer.h"
#import "FlightSorter.h"

SPEC_BEGIN(FlightSorterSpec)

        describe(@"FlightSorterSpec", ^{
            __block Beer *fruitStout = nil;
            __block Beer *sourFruityWheat = nil;
            __block Beer *lagerAmer = nil;
            __block Beer *wheatLagerSaison = nil;
            __block Beer *sourSaison = nil;

            beforeAll(^{
                fruitStout = [[Beer alloc] initWithTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:FRUITY],
                                                                                           [NSNumber numberWithInt:STOUT], nil]];

                sourFruityWheat = [[Beer alloc] initWithTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:SOUR],
                                                                                                [NSNumber numberWithInt:FRUITY],
                                                                                                [NSNumber numberWithInt:WHEAT], nil]];

                lagerAmer = [[Beer alloc] initWithTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:LAGER],
                                                                                          [NSNumber numberWithInt:AMBER], nil]];

                wheatLagerSaison = [[Beer alloc] initWithTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:WHEAT],
                                                                                                 [NSNumber numberWithInt:LAGER],
                                                                                                 [NSNumber numberWithInt:SAISON], nil]];

                sourSaison = [[Beer alloc] initWithTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:SOUR],
                                                                                          [NSNumber numberWithInt:SAISON], nil]];

            });

            it(@"should return same number of beers as was provided", ^{
                NSArray *sortedBeers = [[FlightSorter flightSorter] sortBeers:[NSArray arrayWithObjects:sourSaison, fruitStout, wheatLagerSaison, nil]];

                [[theValue(sortedBeers.count) should] equal:theValue(3)];
            });

            it(@"should sort given list of beer", ^{
                NSArray *sortedBeers = [[FlightSorter flightSorter] sortBeers:[NSArray arrayWithObjects:fruitStout, sourFruityWheat, lagerAmer, wheatLagerSaison, sourSaison, nil]];

                [[theValue([sortedBeers objectAtIndex:0]) should] equal:theValue(sourFruityWheat)];
                [[theValue([sortedBeers objectAtIndex:1]) should] equal:theValue(sourSaison)];
                [[theValue([sortedBeers objectAtIndex:2]) should] equal:theValue(wheatLagerSaison)];
                [[theValue([sortedBeers objectAtIndex:3]) should] equal:theValue(fruitStout)];
                [[theValue([sortedBeers objectAtIndex:4]) should] equal:theValue(lagerAmer)];
            });

        });

        SPEC_END