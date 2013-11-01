//
//  BeerSelectionCell.h
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerSelectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *beerName;
@property (weak, nonatomic) IBOutlet UIImageView *beerSelectedIcon;


- (void)toggleSelected:(BOOL)selected;
@end
