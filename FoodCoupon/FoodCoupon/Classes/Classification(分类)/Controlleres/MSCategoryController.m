//
//  MSCategoryController.m
//  FoodCoupon
//
//  Created by apple on 16/10/24.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSCategoryController.h"

#import "MSSelectView.h"

#import "MSRightView.h"


@interface MSCategoryController ()<MSSelectViewDelegate>{
    NSInteger _currentTag;
}


@property (nonatomic, strong)MSRightView *rightView;

@property (nonatomic, strong) MSSelectView *selectView;

@property (nonatomic, strong) NSMutableArray *dataGoodses;




@end

@implementation MSCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    [self.view addSubview:self.selectView];
    
    [self.view addSubview:self.rightView];
    
    

    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    STATUSBarDEFAULT
    
}

#pragma mark - 数据

- (NSMutableArray *)dataGoodses{
    if (!_dataGoodses) {
        _dataGoodses = [NSMutableArray array];
        for (NSInteger i = 0; i < 8; i ++) {
            NSArray *array = @[@"美颜美容",@"排毒瘦身",@"美白丰胸",@"改善亚健康",@"女性养护",@"心脑血管",@"关节养护",@"肠胃健康",@"男士养护"];
            [_dataGoodses addObject:array];
        }
    }
    return _dataGoodses;
}





#pragma mark - MSSelectViewDelegate

- (void)didSelectBtnOnAction:(UIButton *)btn{
    
    NSLog(@"点击了按钮！");
    if (btn.tag == _currentTag) {
        return;
    }
    
    self.rightView.cellInfo = self.dataGoodses[btn.tag];
    
}




#pragma mark - 懒加载左右视图


- (MSSelectView *)selectView{
    if (!_selectView) {
        MSSelectView *selectView = [[MSSelectView alloc] initWithSclectViewFrame:CGRectMake(0,0,CATEGORYSELECTWIDHT, XSSREENHEIGHT - 64 - 49) scrollBarTitles:@[@"休闲零食",@"保健滋补",@"茶饮酒水",@"母婴健康",@"水果生鲜",@"粮油干活",@"手工美食",@"调味素食"]];
        selectView.selectDelegate = self;
        _selectView = selectView;
    }
    return _selectView;
}

- (MSRightView *)rightView{
    if (!_rightView) {
        MSRightView *rightView = [[MSRightView alloc] initWithCustomRightViewFrame:CGRectMake(self.selectView.width,0,XSSREENWIDTH - self.selectView.width,XSSREENHEIGHT - 64 - 49)];
        _rightView = rightView;
        _currentTag = 0;
    }
    return _rightView;
}






@end
