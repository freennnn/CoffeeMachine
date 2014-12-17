//
//  main.c
//  Baristamatic
//
//  Created by alexander.pranevich on 12/16/14.
//  Copyright (c) 2014 AP. All rights reserved.
//

#include <stdio.h>
#import "BaristaMachine.h"
#import "Command.h"

#define MYMAXSTRING 8192

int main(int argc, const char * argv[]) {
    
    BaristaMachine *baristaMachine = [[BaristaMachine alloc] init];
    
    char cString[MYMAXSTRING];
    BOOL parsing = YES;
    while (parsing)
    {
        fgets(cString, MYMAXSTRING, stdin);
        NSString *inputString = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
        
        
        Command *command = [[Command alloc] initWithCommandString:inputString];
        switch (command.type) {
            case CommandTypeBaristaMachine:
            {
                [Command performBaristaMachineCommand:command withBaristaMachine:baristaMachine];
                break;
            }
            case CommandTypeNotValid:
            {
                cleanLog(@"Invalid selection: %@\n\n", inputString);
                break;
            }
            case CommandTypeQuit:
            {
                parsing = NO;
                break;
            }
            default:
                break;
        }        
    }
    return 0;
}
