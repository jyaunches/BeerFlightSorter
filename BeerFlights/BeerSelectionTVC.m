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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
