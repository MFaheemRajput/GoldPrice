//
//  ServiceManager.m
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import "ServiceManager.h"

@implementation ServiceManager
@synthesize priceTempObj,metalTempObj,marrXMLData;

+ (instancetype)sharedInstance
{
    static ServiceManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ServiceManager alloc] init];
        // Do any other initialisation stuff here
        
    
    });
    return sharedInstance;
}


- (void)getDataFromServer:(NSString *)urlParam{
    marrXMLData = [[NSMutableArray alloc] init];
    
    NSXMLParser *xmlparser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:Prices]];
    
    [xmlparser setDelegate:self];
    [xmlparser parse];
    
    
    [self.delegate handleResponceData:marrXMLData];
    
    
    
//    NSString* webStringURL = [urlParam stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//
//    manager.securityPolicy.allowInvalidCertificates = YES;
//    manager.securityPolicy.validatesDomainName      = NO;
//    
//    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",webStringURL,Token]];
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:Prices]];
//    
//    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
//        
//        if (error) {
//            NSLog(@"Error: %@", error);
//        } else {
//            
//            [self.delegate handleResponce:response withData:responseObject];
//        
//        }
//    }];
//    [dataTask resume];
    
    // call service 
    
}



-(void)startParsing{



}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;
{
    
    if ([elementName isEqualToString:@"prices"]) {
    
    
    }
    else if ([elementName isEqualToString:@"currency"]){
    
    
        NSString *currencyCode = [attributeDict valueForKey:@"access"];
        //NSLog(@" currency code is %@",currencyCode);
        priceTempObj = [[Currency alloc] init];
        priceTempObj.currencyCode = currencyCode;
    }
    
    else if ([elementName isEqualToString:@"price"]){
        
        
        NSString *metalName = [attributeDict valueForKey:@"access"];
        //NSLog(@" Metal is %@",metalName);
        
        metalTempObj = [[Metal alloc] init];
        metalTempObj.Name = metalName;
        
    }
    

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    //NSLog(@" value %@",string);
    NSString *newString = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    if(string.length>0){
    
        if(!metalTempObj){
    
            metalTempObj = [[Metal alloc] init];
        }
        else {
    
            metalTempObj.Rate = (CGFloat)[string floatValue];
    
        }
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName;
{
    if ([elementName isEqualToString:@"prices"]) {
        
        //NSLog(@" prices end %@",qName);
        
        
    }
    else if ([elementName isEqualToString:@"currency"]){
        
        //NSLog(@" currency end %@",qName);
        
        [marrXMLData addObject:priceTempObj];
        
    }
    
    else if ([elementName isEqualToString:@"price"]){
        
        //NSLog(@" metal end %@",qName);
        [priceTempObj.metalArray addObject:metalTempObj];
    }

   // NSLog(@"marrXMLData %@",marrXMLData);
}

@end
