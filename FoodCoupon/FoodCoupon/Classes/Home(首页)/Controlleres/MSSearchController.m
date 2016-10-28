//
//  MSSearchController.m
//  FoodCoupon
//
//  Created by apple on 16/10/21.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSSearchController.h"

#import "MSSearchBar.h"

#import "MSSearchCell.h"

#import <Masonry.h>

@interface MSSearchController ()<UITableViewDelegate,UITableViewDataSource,MSSearchCellDelegate>{
    UIButton *_clearBtn;
}

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) UIView *footerView;

@property (strong, nonatomic) NSMutableArray *btnTitles;



@end
static NSString *cellID = @"MSSearchCell";

@implementation MSSearchController


#pragma mark - 数据

- (NSMutableArray *)btnTitles{
    if (!_btnTitles) {
        _btnTitles = [NSMutableArray array];
        [_btnTitles addObject:@[@"坚果",@"柚子",@"饼干",@"牛排",@"巧克力",@"酵素",@"swisse",@"蜂蜜",@"麦片",@"奶粉"]];
        [_btnTitles addObject:@[@"麦片",@"奶粉"]];
    }
    return _btnTitles;
}


- (void)viewDidLoad {
    [super viewDidLoad];

   
    [self setterNaviItem];//设置导航栏
    [self.view addSubview:self.tableView];//加载tabView
    
   
    //判断历史搜索记录是否为空
    if ([self.btnTitles[1] count] > 0) {
        [self setterBtnStataBtn:_clearBtn btnBackColor:[UIColor colorWithHex:0xe0e0e0] btnEnabled:YES btnTitle:@"清空历史记录"];
    }
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //设置状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


- (void)setterNaviItem{
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏背景颜色
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xffffff]] forBarMetrics:UIBarMetricsDefault];
    
    //设置右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem customItemNormalColor:[UIColor colorWithHex:0x000000] selectedColor:[UIColor colorWithHex:0x000000] target:self action:@selector(rightBtnAction:) btnTitle:@"取消"];
    
    //设置搜索栏
    MSSearchBar *searchBar = [[MSSearchBar alloc] initWithSearchViewFrameWidth:XSSREENWIDTH - 80 placeholderText:@"搜索喜欢的宝贝"];
//    searchBar.backgroundColor = [UIColor redColor];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
}

#pragma mark - 清除历史记录
- (void)clearBtnAction:(UIButton *)btn{
    
    self.btnTitles[1] = @[];
    [self setterBtnStataBtn:btn btnBackColor:[UIColor clearColor] btnEnabled:NO btnTitle:@"历史搜索记录为空"];
    
    //局部刷新cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


#pragma mark - MSSearchCellDelegate

- (void)didSelectCellBtn:(UIButton *)btn{
    
    NSLog(@"%@",btn.titleLabel.text);
    
}


#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.searchCellDelegate = self;
    NSArray *tites = self.btnTitles[indexPath.row];
    if (indexPath.row == 0) {
        cell.cellTitle = @"热门搜索";
        cell.btnTitles = tites;
    }else{
        cell.cellTitle = @"历史搜索";
        cell.btnTitles = tites;
        cell.separatorInset = UIEdgeInsetsMake(0,0,0, XSSREENWIDTH);
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat count = [self.btnTitles[indexPath.row] count] / 5.0;
    
    if (count < 1 &&  count > 0) {
        count = 1;
    }else if (count == 0){
        
    }
    CGFloat height = (int)count * 30 + ((int)count - 1) * 10;

    return height + 90;
}





#pragma mark - 懒加载所有视图

- (UITableView *)tableView{
    if (!_tableView) {
        CGRect tableViewFrame = CGRectMake(0, 0, XSSREENWIDTH, XSSREENHEIGHT - 64);
        UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsHorizontalScrollIndicator = YES;
        [tableView registerClass:[MSSearchCell class] forCellReuseIdentifier:cellID];
        tableView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
        tableView.tableFooterView = self.footerView;
        _tableView = tableView;
        
    }
    return _tableView;
}


- (UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XSSREENWIDTH, 50)];
        _footerView.backgroundColor = [UIColor clearColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置按钮的状态
        [self setterBtnStataBtn:btn btnBackColor:[UIColor clearColor] btnEnabled:NO btnTitle:@"历史搜索记录为空"];
        [btn addTarget:self action:@selector(clearBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleColor:[UIColor colorWithHex:0x757575] forState:UIControlStateNormal];
        CGFloat w = XSSREENWIDTH * 0.75;
        btn.frame = CGRectMake((XSSREENWIDTH - w) / 2, 10,w, 30);
        _clearBtn = btn;
        [_footerView addSubview:btn];
    }
    return _footerView;
}

#pragma mark - 清除按钮的样式
- (void)setterBtnStataBtn:(UIButton *)btn btnBackColor:(UIColor *)color btnEnabled:(BOOL)enabed btnTitle:(NSString *)title{
    btn.backgroundColor = color;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.enabled = enabed;
}



#pragma mark - 导航栏右边的取消按钮

- (void)rightBtnAction:(UIButton *)btn{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
