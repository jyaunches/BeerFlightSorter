#import "Kiwi.h"
#import "BeerFlight.h"

SPEC_BEGIN(BeerFlightSpec)

        describe(@"BeerFlights", ^{
            it(@"should have one or more tasting styles", ^{
                NSArray *tastingStyles = [NSArray arrayWithObjects:[NSNumber numberWithInt:LIGHT],
                                                                   [NSNumber numberWithInt:SOUR], nil];
                BeerFlight *flight = [[BeerFlight alloc] initWithTastingStyles:tastingStyles];

                [[theValue([flight hasStyle:LIGHT]) should] beTrue];
                [[theValue([flight hasStyle:SOUR]) should] beTrue];
                [[theValue([flight hasStyle:WHEAT]) should] beFalse];
            });

            it(@"should calculate a style score accurately with two styles", ^{
                NSArray *tastingStyles = [NSArray arrayWithObjects:[NSNumber numberWithInt:WHEAT],
                                                                   [NSNumber numberWithInt:SOUR], nil];
                BeerFlight *flight = [[BeerFlight alloc] initWithTastingStyles:tastingStyles];

                [[theValue(flight.styleScore) should] equal:theValue(3.0f)];
            });

            it(@"should calculate a style score accurately with three styles", ^{
                NSArray *tastingStyles = [NSArray arrayWithObjects:[NSNumber numberWithInt:AMBER],
                                          [NSNumber numberWithInt:FRUITY],
                                          [NSNumber numberWithInt:SOUR], nil];
                BeerFlight *flight = [[BeerFlight alloc] initWithTastingStyles:tastingStyles];
                
                [[theValue(flight.styleScore) should] equal:3.667 withDelta:0.001];
            });
        });

        SPEC_END