//
//  HomeViewController.h
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MetalCell.h"
#import "MTCardLayout.h"
#import "UICollectionView+CardLayout.h"
#import "UICollectionView+DraggableCardLayout.h"
#import "MTCardLayoutHelper.h"
#import "SearchViewController.h"
#import "ServiceManager.h"
#import "Constant.h"
#import "Metal.h"
#import "Currency.h"


@interface HomeViewController : UIViewController <SearchViewControllerDelegate,UICollectionViewDataSource_Draggable, UICollectionViewDelegate_Draggable,ApiProtocol>


@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;




@property (nonatomic,strong) Metal *metal;
@property (nonatomic,strong) NSMutableArray<Currency *>* metalArray;


- (IBAction)flip:(id)sender;

@end
