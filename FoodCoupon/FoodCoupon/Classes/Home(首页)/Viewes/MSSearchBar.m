//
//  MSSearchBar.m
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSSearchBar.h"

@interface MSSearchBar ()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *textField;

@end

@implementation MSSearchBar



- (instancetype)initWithSearchViewFrameWidth:(CGFloat)width placeholderText:(NSString *)placeholderText{
    
    self = [self initWithFrame:CGRectMake(0, 5,width,34)];
    
    [self addSubview:self.textField];
    
    self.textField.placeholder = placeholderText;
    
    
    return self;
}




#pragma mark - 设置视图
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _textField.delegate = self;
        _textField.backgroundColor = [UIColor colorWithHex:0xf0f0f0];
        
        _textField.leftView = [self leftSearchImage];
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeySearch;
        
        _textField.layer.cornerRadius = 5.0;//设置圆角
        _textField.frame = CGRectMake(0, 0, self.width, self.height);
        
    }
    return _textField;
}

- (UIImageView *)leftSearchImage{

    UIImage *image = [UIImage imageNamed:@"UMS_find"];
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,5,34, 24)];
    leftImage.contentMode = UIViewContentModeScaleAspectFit;
    leftImage.image = image;
    return leftImage;
}



@end
