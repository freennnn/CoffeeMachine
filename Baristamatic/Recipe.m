//
//  Recipe.m
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe

- (instancetype)initWithName:(NSString*)name andIngredients:(NSArray *)ingredients
{
    self = [self init];
    if (self) {
        _ingredients = [ingredients copy];
        _name = [name copy];
    }
    return self;
}


@end
