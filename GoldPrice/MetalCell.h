//
//  MetalCell.h
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MetalCell : UICollectionViewCell


@property (nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) IBOutlet UIButton *infoButton;
@property (nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *GoldLabel;
@property (weak, nonatomic) IBOutlet UILabel *SilverLabel;
@property (weak, nonatomic) IBOutlet UILabel *PlatiniumLabel;
@property (weak, nonatomic) IBOutlet UILabel *PalladiumLabel;
@property (weak, nonatomic) IBOutlet UILabel *GoldRate;
@property (weak, nonatomic) IBOutlet UILabel *SilverRate;
@property (weak, nonatomic) IBOutlet UILabel *PlatiniumRate;
@property (weak, nonatomic) IBOutlet UILabel *PalladiumRate;

- (void)flipTransitionWithOptions:(UIViewAnimationOptions)options halfway:(void (^)(BOOL finished))halfway completion:(void (^)(BOOL finished))completion;


@end
