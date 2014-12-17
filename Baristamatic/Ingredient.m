//
//  Ingredient.m
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import "Ingredient.h"

@implementation Ingredient

- (instancetype)initWithType:(IngredientType)type andQuantity:(int)quantity
{
    self = [self init];
    if (self) {
        self.type = type;
        self.quantity = quantity;
    }
    return self;
}

- (NSString*)name
{
    switch (self.type) {
        case IngredientTypeCocoa:
            return @"Cocoa";
            break;
        case IngredientTypeCoffee:
            return @"Coffee";
            break;
        case IngredientTypeCream:
            return @"Cream";
            break;
        case IngredientTypeDecafCoffee:
            return @"Decaf Coffee";
            break;
        case IngredientTypeEspresso:
            return @"Espresso";
            break;
        case IngredientTypeFoamedMilk:
            return @"Foamed Milk";
            break;
        case IngredientTypeSteamedMilk:
            return @"Steamed Milk";
            break;
        case IngredientTypeSugar:
            return @"Sugar";
            break;
        case IngredientTypeWhippedCream:
            return @"Whipped Cream";
            break;
        case IngredientTypeLast:
            return nil;
            break;
        default:
            break;
    }
}

@end
