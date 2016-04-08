//
//  Metal.m
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import "Metal.h"

@implementation Metal


-(Metal*)init:(NSDictionary*)dictParam{

    self.Name       = [dictParam valueForKey:@"Name"];
    self.Symbol     = [dictParam valueForKey:@"Symbol"];
    self.Type       = [dictParam valueForKey:@"Type"];
    self.Active     = [[dictParam valueForKey:@"Active"] boolValue];
    self.Message    = [dictParam valueForKey:@"Message"];

    return self;
}

@end
