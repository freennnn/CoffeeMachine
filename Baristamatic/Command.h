//
//  Command.h
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaristaMachine;

typedef NS_ENUM(NSInteger, CommandType) {
    CommandTypeBaristaMachine,
    CommandTypeQuit,
    CommandTypeNotValid
};

typedef NS_ENUM(NSInteger, BaristaMachineCommandType) {
    BaristaMachineCommandTypeOption1,
    BaristaMachineCommandTypeOption2,
    BaristaMachineCommandTypeOption3,
    BaristaMachineCommandTypeOption4,
    BaristaMachineCommandTypeOption5,
    BaristaMachineCommandTypeOption6,
    BaristaMachineTypeRestock
};


@interface Command : NSObject

@property (nonatomic) CommandType type;
@property (nonatomic) BaristaMachineCommandType baristaMachineType;


- (instancetype)initWithCommandString:(NSString*)commandString;
+ (void)performBaristaMachineCommand:(Command*)command withBaristaMachine:(BaristaMachine*)machine;

@end
