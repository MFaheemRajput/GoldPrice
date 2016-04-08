//
//  Metal.h
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Metal : NSObject


@property(nonatomic) float Rate;
@property(nonatomic,strong) NSString* Name;
@property(nonatomic,strong) NSString* Symbol;
@property(nonatomic,strong) NSString* Type;
@property(nonatomic)        BOOL Active;
@property(nonatomic,strong) NSString* Message;



-(Metal*)init:(NSDictionary*)dictParam;

@end
