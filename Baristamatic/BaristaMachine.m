//
//  BaristaMachine.m
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import "BaristaMachine.h"
#import "Ingredient.h"
#import "Recipe.h"

#define INGREDIENT_DEFAULT_QUANTITY 10

@implementation BaristaMachine

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initializeIngredients];
        [self initializeRecipes];
        [self logInventory];
        [self logMenu];
    }
    return self;
}

#pragma mark - Private methdos

- (void)initializeIngredients
{
    _ingredients = [[NSMutableArray alloc] init];
    for (int i = 0; i < IngredientTypeLast; i++) {
        [self.ingredients addObject:[[Ingredient alloc] initWithType:i andQuantity:INGREDIENT_DEFAULT_QUANTITY]];
    }
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [_ingredients sortUsingDescriptors:@[sortByName]];
}

- (void)initializeRecipes
{
    _recipes = [[NSMutableArray alloc] init];
    NSArray *ingredients;
    
    ingredients = @[
                    [[Ingredient alloc] initWithType:IngredientTypeCoffee andQuantity:3],
                    [[Ingredient alloc] initWithType:IngredientTypeSugar andQuantity:1],
                    [[Ingredient alloc] initWithType:IngredientTypeCream andQuantity:1]
                    ];
    [_recipes addObject:[[Recipe alloc] initWithName:@"Coffee" andIngredients:ingredients]];
    
    ingredients = @[
                    [[Ingredient alloc] initWithType:IngredientTypeDecafCoffee andQuantity:3],
                    [[Ingredient alloc] initWithType:IngredientTypeSugar andQuantity:1],
                    [[Ingredient alloc] initWithType:IngredientTypeCream andQuantity:1]
                    ];
    [_recipes addObject:[[Recipe alloc] initWithName:@"Decaf Coffee" andIngredients:ingredients]];
    
    ingredients = @[
                    [[Ingredient alloc] initWithType:IngredientTypeEspresso andQuantity:2],
                    [[Ingredient alloc] initWithType:IngredientTypeSteamedMilk andQuantity:1]
                    ];
    [_recipes addObject:[[Recipe alloc] initWithName:@"Caffe Latte" andIngredients:ingredients]];
    
    ingredients = @[
                    [[Ingredient alloc] initWithType:IngredientTypeEspresso andQuantity:3]
                    ];
    [_recipes addObject:[[Recipe alloc] initWithName:@"Caffe Americano" andIngredients:ingredients]];

    ingredients = @[
                    [[Ingredient alloc] initWithType:IngredientTypeEspresso andQuantity:1],
                    [[Ingredient alloc] initWithType:IngredientTypeCocoa andQuantity:1],
                    [[Ingredient alloc] initWithType:IngredientTypeSteamedMilk andQuantity:1],
                    [[Ingredient alloc] initWithType:IngredientTypeWhippedCream andQuantity:1]
                    ];
    [_recipes addObject:[[Recipe alloc] initWithName:@"Caffe Mocha" andIngredients:ingredients]];
    
    ingredients = @[
                    [[Ingredient alloc] initWithType:IngredientTypeEspresso andQuantity:2],
                    [[Ingredient alloc] initWithType:IngredientTypeSteamedMilk andQuantity:1],
                    [[Ingredient alloc] initWithType:IngredientTypeFoamedMilk andQuantity:1]
                    ];
    [_recipes addObject:[[Recipe alloc] initWithName:@"Cappuccino" andIngredients:ingredients]];
    
    
    NSSortDescriptor *sortByName = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [_recipes sortUsingDescriptors:@[sortByName]];
    
}

- (Ingredient*)ingredientWithType:(IngredientType)type
{
    Ingredient* ingredientToReturn = nil;
    for (Ingredient *ingredient in self.ingredients) {
        if (ingredient.type == type) {
            ingredientToReturn = ingredient;
            break;
        }
    }
    return ingredientToReturn;
}

#pragma mark - Public methods

- (void)restock
{
    for (Ingredient *ingredient in self.ingredients) {
        ingredient.quantity = INGREDIENT_DEFAULT_QUANTITY;
    }
}

- (BOOL)canProduceRecipe:(Recipe*)recipe
{
    BOOL canProduce = YES;
    
    for (Ingredient *ingredient in recipe.ingredients) {
        Ingredient *availableIngredient = [self ingredientWithType:ingredient.type];
        if (ingredient.quantity > availableIngredient.quantity) {
            canProduce = NO;
            break;
        }
    }
    
    return canProduce;
}

- (void)produceRecipe:(Recipe*)recipe
{
    for (Ingredient *ingredient in recipe.ingredients) {
        Ingredient *availableIngredient = [self ingredientWithType:ingredient.type];
        availableIngredient.quantity -= ingredient.quantity;
    }
}

- (void)logInventory
{
    cleanLog(@"Inventory:\n\n");
    for (Ingredient *ingredient in self.ingredients) {
        cleanLog(@"%@,%d\n\n", ingredient.name, ingredient.quantity);
    }
}

- (void)logMenu
{
    cleanLog(@"Menu:\n\n");
    for (int i = 0; i < self.recipes.count; i++) {
        Recipe* recipe = self.recipes[i];
        NSString *canBeProduced = @"false";
        if ([self canProduceRecipe:recipe]) {
            canBeProduced = @"true";
        }
        cleanLog(@"%d,%@,%@\n\n", i+1, recipe.name, canBeProduced);
    }
}

@end
