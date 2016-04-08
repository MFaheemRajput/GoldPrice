//
//  ServiceManager.h
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Constant.h"
#import "Currency.h"


@protocol ApiProtocol <NSObject>

@optional

-(void) handleResponce:(NSURLResponse*)response withData:(id)data;
-(void) handleResponceData:(NSMutableArray*)dataArray;


@end


@interface ServiceManager : NSObject <NSXMLParserDelegate>

@property (nonatomic, strong) NSMutableDictionary *dictData;
@property (nonatomic,strong) NSMutableArray *marrXMLData;
@property (nonatomic,strong) NSMutableString *mstrXMLString;
@property (nonatomic,strong) NSMutableDictionary *mdictXMLPart;

@property (nonatomic,strong) id <ApiProtocol>delegate;
@property (nonatomic,strong) NSMutableArray<Currency *>* priceArray;
@property (nonatomic,strong) Currency *priceTempObj;
@property (nonatomic,strong) Metal *metalTempObj;


+ (instancetype)sharedInstance;
- (void)getDataFromServer:(NSString *)urlParam;

@end
