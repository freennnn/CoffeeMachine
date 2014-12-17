//
//  BaristaMachine.h
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Recipe;
@interface BaristaMachine : NSObject

@property (nonatomic, readonly) NSMutableArray *ingredients;
@property (nonatomic, readonly) NSMutableArray *recipes;

- (void)restock;
- (BOOL)canProduceRecipe:(Recipe*)recipe;
- (void)produceRecipe:(Recipe*)recipe;
- (void)logInventory;
- (void)logMenu;

@end
