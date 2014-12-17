//
//  Recipe.h
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, copy) NSArray *ingredients;
@property (nonatomic, copy) NSString* name;

- (instancetype)initWithName:(NSString*)name andIngredients:(NSArray*)ingredients;

@end
