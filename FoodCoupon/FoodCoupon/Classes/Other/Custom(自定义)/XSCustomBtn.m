//
//  XSShareBtn.m
//  TensNews
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "XSCustomBtn.h"

#define ImageWH 20
#define MarGan 10
#define TitH 13
@implementation XSCustomBtn


//自定义文字的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    return CGRectMake(0,self.height - MarGan,contentRect.size.width,TitH);
}
//自定义图片的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake((self.width -ImageWH) / 2,MarGan,ImageWH,ImageWH);
    
}




//加载子视图
- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;//设置文字对齐方式
    self.titleLabel.textColor = [UIColor lightGrayColor];//设置文字颜色
    self.titleLabel.font = [UIFont systemFontOfSize:11];//设置文字大小
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;//设置图片显示格式
}

@end
