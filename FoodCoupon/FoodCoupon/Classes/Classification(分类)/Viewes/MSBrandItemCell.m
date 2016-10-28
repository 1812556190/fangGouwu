//
//  MSBrandItemCell.m
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBrandItemCell.h"

@interface MSBrandItemCell ()
@property (weak, nonatomic) IBOutlet UIImageView *brandImage;

@property (weak, nonatomic) IBOutlet UIImageView *brandNameImage;
@property (weak, nonatomic) IBOutlet UILabel *brandNameLabel;


@end

@implementation MSBrandItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
