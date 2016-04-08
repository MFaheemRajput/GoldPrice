//
//  MetalCollectionViewCell.m
//  GoldPrice
//
//  Created by M.Faheem.Rajput on 07/04/2016.
//  Copyright (c) 2016 technerds. All rights reserved.
//

#import "MetalCollectionViewCell.h"

@interface MetalCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation MetalCollectionViewCell


- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    UIImage *image = [[UIImage imageNamed:@"Background"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    
    self.imageView.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.imageView.tintColor = self.color;
    
    self.nameLabel.text = self.title;
}

#pragma mark - Accessors

- (void)setTitle:(NSString *)title {
    
    _title = [title copy];
    
    self.nameLabel.text = self.title;
}

- (void)setColor:(UIColor *)color {
    
    _color = [color copy];
    
    self.backgroundView.tintColor = self.color;
}

@end
