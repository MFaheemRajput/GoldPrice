//
//  HomeViewController.m
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) SearchViewController *searchViewController;

@property (nonatomic, strong) NSString *metalSymbols;
@property (nonatomic, strong) NSString *quoteURL;


@end

@implementation HomeViewController
@synthesize metalArray,metalSymbols,quoteURL;
#pragma mark Status Bar color

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [ServiceManager sharedInstance].delegate = self;
    
    [[ServiceManager sharedInstance] getDataFromServer:Prices];
    
    
}

#pragma mark - View Lifecycle

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView setViewMode:MTCardLayoutViewModePresenting animated:YES completion:nil];
}



#pragma mark - UICollectionViewDatasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.metalArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MetalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pass" forIndexPath:indexPath];
    
    cell.titleLabel.text = [self.metalArray[indexPath.row].currencyCode capitalizedString];
    
    cell.GoldRate.text       = [NSString stringWithFormat:@"%f",[self.metalArray[indexPath.row].metalArray objectAtIndex:0].Rate ];

    cell.SilverRate.text     = [NSString stringWithFormat:@"%f",[self.metalArray[indexPath.row].metalArray objectAtIndex:1].Rate ];
    
    cell.PlatiniumRate.text  = [NSString stringWithFormat:@"%f",[self.metalArray[indexPath.row].metalArray objectAtIndex:2].Rate ];
    
    cell.PalladiumRate.text  = [NSString stringWithFormat:@"%f",[self.metalArray[indexPath.row].metalArray objectAtIndex:3].Rate ];
    
    cell.GoldLabel.text       = [self.metalArray[indexPath.row].metalArray objectAtIndex:0].Name;
    
    cell.SilverLabel.text     = [self.metalArray[indexPath.row].metalArray objectAtIndex:1].Name;
    
    cell.PlatiniumLabel.text  = [self.metalArray[indexPath.row].metalArray objectAtIndex:2].Name;
    
    cell.PalladiumLabel.text  = [self.metalArray[indexPath.row].metalArray objectAtIndex:3].Name;

    return cell;


}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    Currency * item = self.metalArray[fromIndexPath.item];
    [self.metalArray removeObjectAtIndex:fromIndexPath.item];
    [self.metalArray insertObject:item atIndex:toIndexPath.item];
}

- (void)collectionView:(UICollectionView *)collectionView didMoveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView canDeleteItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView deleteItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.metalArray removeObjectAtIndex:indexPath.item];
}

- (void)collectionView:(UICollectionView *)collectionView didDeleteItemAtIndexPath:(NSIndexPath *)indexPath
{

}


- (UIView *)collectionView:(UICollectionView *)collectionView deletionConfirmationViewForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"trashcan"] highlightedImage:[UIImage imageNamed:@"trashcan_red"]];
}

- (void)collectionView:(UICollectionView *)collectionView modifyMovingItemAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    layoutAttributes.transform3D = CATransform3DTranslate(layoutAttributes.transform3D, 0.0, -15.0, 0.0);
}

#pragma mark SearchCell

- (void)searchControllerWillBeginSearch:(SearchViewController *)controller
{
    if (self.collectionView.viewMode != MTCardLayoutViewModePresenting)
    {
        [self.collectionView setViewMode:MTCardLayoutViewModePresenting animated:YES completion:nil];
    }
}

- (void)searchControllerWillEndSearch:(SearchViewController *)controller
{
    if (self.collectionView.viewMode != MTCardLayoutViewModeDefault)
    {
        [self.collectionView setViewMode:MTCardLayoutViewModeDefault animated:YES completion:nil];
    }
}

#pragma mark Backside

- (IBAction)flip:(id)sender
{
    MetalCell *cell = (MetalCell *)[self.collectionView cellForItemAtIndexPath:[[self.collectionView indexPathsForSelectedItems] firstObject]];
    if (sender == cell.infoButton)
    {
        [cell flipTransitionWithOptions:UIViewAnimationOptionTransitionFlipFromLeft halfway:^(BOOL finished) {
            cell.infoButton.hidden = YES;
            cell.doneButton.hidden = NO;
        } completion:nil];
    }
    else
    {
        [cell flipTransitionWithOptions:UIViewAnimationOptionTransitionFlipFromRight halfway:^(BOOL finished) {
            cell.infoButton.hidden = NO;
            cell.doneButton.hidden = YES;
        } completion:nil];
    }
}


//
//- (void) handleResponce:(NSURLResponse*)responseObj withData:(id)data{
//
//    
//    NSLog(@"URL %@",[NSString stringWithFormat:@"%@",responseObj.URL]);
//    
//    if ([[responseObj.URL absoluteString] isEqualToString:[NSString stringWithFormat:@"%@%@",MetalListUrl,Token]]) {
//        
//        if ([[data valueForKey:@"Outcome"] isEqualToString:@"Success"]) {
//            
//            metalArray = [self getMetalsFromResponce:(NSMutableArray*)[data valueForKey:@"MetalList"]];
//            [self.collectionView reloadData];
//            
//            quoteURL =  [NSString stringWithFormat:@"%@Symbols=%@&Currency=USD&",MetalQuotesRealTime,metalSymbols];
//         
//            [[ServiceManager sharedInstance] getDataFromServer:quoteURL];
//            
//            NSLog(@"second URL %@",[quoteURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
//        }
//        
//    }
//    
//    else if ([[self getBaseUrlFromURL:[responseObj.URL absoluteString] ]  isEqualToString:[self getBaseUrlFromURL:quoteURL]]){
//        
//        if ([[data valueForKey:@"Outcome"] isEqualToString:@"Success"]) {
//            
//            
//        }
//    
//    }
//    else if ([[responseObj.URL absoluteString] isEqualToString:Prices]){
//        
//            
//    
//    }
//    
//}


- (void) handleResponceData:(NSMutableArray *)dataArray{

    metalArray = dataArray;
    [self.collectionView reloadData];
}

//-(NSMutableArray<Metal*>*)getMetalsFromResponce:(NSMutableArray*)param{
// 
//    metalArray = [[NSMutableArray alloc] init];
//    
//    for (NSDictionary * dataDict in param) {
//        
//        [metalArray addObject:[[Metal alloc] init:dataDict]];
//        
//    }
//    
//    metalSymbols = [[param valueForKey:@"Symbol"] componentsJoinedByString:@","];
//
//    return metalArray;
//}

-(NSString*)getBaseUrlFromURL:(NSString*)urlParam{    NSArray *stringArray = [urlParam componentsSeparatedByString:@"?"];
    
    return [stringArray firstObject];
    
}



@end
