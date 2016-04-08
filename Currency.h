

//
//  Currency.h
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Metal.h"

@interface Currency : NSObject

@property (nonatomic,strong) NSString *currencyCode;
@property (nonatomic,strong) NSString *currencyName;
@property (nonatomic,strong) NSString *currencyShortName;
@property (nonatomic,strong) NSMutableArray<Metal*> *metalArray;

@end
