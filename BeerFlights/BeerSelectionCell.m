//
//  BeerSelectionCell.m
//  BeerFlights
//
//  Created by Julietta Yaunches on 1/11/13.
//  Copyright (c) 2013 Julietta Yaunches. All rights reserved.
//

#import "BeerSelectionCell.h"

@implementation BeerSelectionCell

- (void)toggleSelected:(BOOL)selected {
    if(selected){
       self.beerName.textColor = [UIColor colorWithRed:(143/255.0)  green:(143/255.0)  blue:(143/255.0)  alpha:1.0];
       [self.beerSelectedIcon setImage:[UIImage imageNamed:@"selected-beer-icon.png"]];
   }else{
       self.beerName.textColor = [UIColor blackColor];
       [self.beerSelectedIcon setImage:[UIImage imageNamed:@"add-beer-icon.png"]];
   }
}
@end
