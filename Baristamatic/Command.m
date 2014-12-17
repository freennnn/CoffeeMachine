//
//  Command.m
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import "Command.h"
#import "Recipe.h"
#import "BaristaMachine.h"

@implementation Command

- (instancetype)initWithCommandString:(NSString*)commandString
{
    self = [self init];
    if (self) {
        commandString = [commandString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        if ([[commandString uppercaseString] isEqualToString:@"R"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineTypeRestock;
        }
        else if ([[commandString uppercaseString] isEqualToString:@"Q"]) {
            _type = CommandTypeQuit;
        }
        else if ([commandString isEqualToString:@"1"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineCommandTypeOption1;
        }
        else if ([commandString isEqualToString:@"2"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineCommandTypeOption2;
        }
        else if ([commandString isEqualToString:@"3"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineCommandTypeOption3;
        }
        else if ([commandString isEqualToString:@"4"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineCommandTypeOption4;
        }
        else if ([commandString isEqualToString:@"5"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineCommandTypeOption5;
        }
        else if ([commandString isEqualToString:@"6"]) {
            _type = CommandTypeBaristaMachine;
            _baristaMachineType = BaristaMachineCommandTypeOption6;
        }
        else {
            _type = CommandTypeNotValid;
        }
    }
    return self;
}

+ (void)performBaristaMachineCommand:(Command*)command withBaristaMachine:(BaristaMachine*)machine;
{
    if (command.type != CommandTypeBaristaMachine) {
        return;
    }
    Recipe *recipe = nil;
    switch (command.baristaMachineType) {
        case BaristaMachineCommandTypeOption1:
        case BaristaMachineCommandTypeOption2:
        case BaristaMachineCommandTypeOption3:
        case BaristaMachineCommandTypeOption4:
        case BaristaMachineCommandTypeOption5:
        case BaristaMachineCommandTypeOption6:
        {
            recipe = machine.recipes[command.baristaMachineType];
            if ([machine canProduceRecipe:recipe]) {
                [machine produceRecipe:recipe];
                cleanLog(@"Dispensing: %@\n\n", recipe.name);
                [machine logInventory];
                [machine logMenu];
            }
            else {
                cleanLog(@"Out of stock: %@\n\n", recipe.name);
            }
            break;
        }
        case BaristaMachineTypeRestock:
        {
            [machine restock];
            [machine logInventory];
            [machine logMenu];
            break;
        }
        default:
            break;
    }
}

@end
