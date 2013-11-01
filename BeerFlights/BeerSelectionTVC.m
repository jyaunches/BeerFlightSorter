//
//  BeerSelectionTVC.m
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "BeerSelectionTVC.h"
#import "Beer.h"
#import "BeerSelectionCell.h"
#import "BeerFlightListVC.h"

@interface BeerSelectionTVC ()

@property(nonatomic, strong) NSArray *beers;
@property(nonatomic, strong) NSMutableArray *selectedBeers;
@end

@implementation BeerSelectionTVC

- (void)viewDidLoad {
    [super viewDidLoad];

    Beer *lightSour = [[Beer alloc] initWithName:@"Light Sour" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:LIGHT],
                                                                                                          [NSNumber numberWithInt:SOUR], nil]];

    Beer *fruityWheatAmber = [[Beer alloc] initWithName:@"Fruity Wheat Amber" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:FRUITY],
                                                                                                                         [NSNumber numberWithInt:WHEAT],
                                                                                                                         [NSNumber numberWithInt:AMBER], nil]];

    Beer *amberSaison = [[Beer alloc] initWithName:@"Amber Saison" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:AMBER],
                                                                                                              [NSNumber numberWithInt:SAISON], nil]];

    Beer *lager = [[Beer alloc] initWithName:@"Lager" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:LAGER], nil]];


    Beer *fruitStout = [[Beer alloc] initWithName:@"Fruit Stout" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:FRUITY],
                                                                                                            [NSNumber numberWithInt:STOUT], nil]];

    Beer *sourFruityWheat = [[Beer alloc] initWithName:@"Sour Fruiting Wheat" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:SOUR],
                                                                                                                         [NSNumber numberWithInt:FRUITY],
                                                                                                                         [NSNumber numberWithInt:WHEAT], nil]];

    Beer *lagerAmer = [[Beer alloc] initWithName:@"Lager Amber" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:LAGER],
                                                                                                           [NSNumber numberWithInt:AMBER], nil]];

    Beer *wheatLagerSaison = [[Beer alloc] initWithName:@"Wheat Lager Saison" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:WHEAT],
                                                                                                                         [NSNumber numberWithInt:LAGER],
                                                                                                                         [NSNumber numberWithInt:SAISON], nil]];

    Beer *sourSaison = [[Beer alloc] initWithName:@"Sour Saison" andTastingStyles:[NSArray arrayWithObjects:[NSNumber numberWithInt:SOUR],
                                                                                                            [NSNumber numberWithInt:SAISON], nil]];

    self.beers = [NSArray arrayWithObjects:lightSour, fruityWheatAmber, amberSaison, lager,
                                           fruitStout, sourFruityWheat, lagerAmer, wheatLagerSaison, sourSaison, nil];
    self.selectedBeers = [NSMutableArray array];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.beers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BeerSelectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FlightBeerCell" forIndexPath:indexPath];

    Beer *beer = [self.beers objectAtIndex:[indexPath row]];
    cell.beerName.text = beer.name;
    [cell toggleSelected:[self.selectedBeers containsObject:beer]];

    return cell;
}

- (IBAction)resetClicked:(id)sender {
    self.selectedBeers = [NSMutableArray array];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Beer *beerSelected = [self.beers objectAtIndex:[indexPath row]];
    BOOL addingAsSelected = ![self.selectedBeers containsObject:beerSelected];
    if (addingAsSelected) {
        [self.selectedBeers addObject:beerSelected];
    } else {
        [self.selectedBeers removeObject:beerSelected];
    }

    BeerSelectionCell *cell = (BeerSelectionCell *) [self.tableView cellForRowAtIndexPath:indexPath];
    [cell toggleSelected:addingAsSelected];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowSortedFlightList"]) {
        BeerFlightListVC *vc = [segue destinationViewController];
        vc.beersForFlight = self.selectedBeers;
    }
}

@end
