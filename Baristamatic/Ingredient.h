//
//  Ingredient.h
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IngredientType) {
    IngredientTypeCocoa,
    IngredientTypeCoffee,
    IngredientTypeCream,
    IngredientTypeDecafCoffee,
    IngredientTypeEspresso,
    IngredientTypeFoamedMilk,
    IngredientTypeSteamedMilk,
    IngredientTypeSugar,
    IngredientTypeWhippedCream,
    
    IngredientTypeLast
};

@interface Ingredient : NSObject

@property (nonatomic) IngredientType type;
@property (nonatomic) int quantity;

- (instancetype)initWithType:(IngredientType)type andQuantity:(int)quantity;
- (NSString*)name;
@end
