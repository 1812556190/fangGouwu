//
//  MSRightView.m
//  FoodCoupon
//
//  Created by apple on 16/10/26.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSRightView.h"

#import "MSRightCell.h"

@interface MSRightView ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat _cellHeight;
}

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSArray *testCellArray;

@end

@implementation MSRightView


- (instancetype)initWithCustomRightViewFrame:(CGRect)frame{
    self = [self initWithFrame:frame];
    
    self.testCellArray = @[@"曲奇威化",@"夹心饼干",@"蛋卷",@"西式糕点",@"中式糕点",@"日式糕点",@"其他糕点"];
    
    [self addSubview:self.tableView];
   

    return self;
}


#pragma mark - 改变数据刷新表格

- (void)setCellInfo:(NSArray *)cellInfo{
    _cellInfo = cellInfo;
  
    self.testCellArray = self.cellInfo;
    
    
    [self.tableView reloadData];//刷新表格
}


#pragma mark - 懒加载视图

- (UITableView *)tableView{
    if (!_tableView) {
        CGRect tableViewFrame = CGRectMake(0, 0,self.width, self.height);
        UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[MSRightCell class] forCellReuseIdentifier:@"MSRightCell"];
        _tableView = tableView;
    }
    return _tableView;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSRightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MSRightCell"];
    
    cell.btnTitles = self.testCellArray;
    
    _cellHeight = cell.cellHeight;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _cellHeight;
}



@end
