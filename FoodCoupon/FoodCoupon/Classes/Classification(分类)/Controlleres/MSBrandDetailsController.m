//
//  MSBrandDetailsController.m
//  FoodCoupon
//
//  Created by apple on 16/10/25.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSBrandDetailsController.h"

#import "MSTableFooter.h"



@interface MSBrandDetailsController ()<UITableViewDelegate,UITableViewDataSource>{
    UIButton *_btn_01;
    UIButton *_btn_02;
    UIButton *_btn_03;
}


@property (weak, nonatomic) IBOutlet UIView *tabelHeaderView;

@property (weak, nonatomic) IBOutlet UIImageView *tabHeaderImage;
@property (weak, nonatomic) IBOutlet UIImageView *brandImage;

@property (weak, nonatomic) IBOutlet UILabel *brandName;
@property (weak, nonatomic) IBOutlet UIImageView *countriImage;
@property (weak, nonatomic) IBOutlet UILabel *countriesLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIButton *showLabelBtn;

@property (strong, nonatomic)MSTableFooter *tableFooterView;




@property (strong, nonatomic) UIView *cellView;



@end

@implementation MSBrandDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    [self.navigationController.navigationBar setHidden:YES];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BrandCELL"];
    
    self.tableView.tableFooterView = self.tableFooterView;
}




#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BrandCELL"];
    [cell.contentView addSubview:self.cellView];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}


#pragma mark - 创建视图

- (MSTableFooter *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[MSTableFooter alloc] initWithCustomCollectionView];
        [_tableFooterView cellLoadHeight];
        //        _tableFooterView.backgroundColor = [UIColor redColor];
    }
    return _tableFooterView;
}

- (UIView *)cellView{
    if (!_cellView) {
        _cellView = [[UIView alloc] initWithFrame:CGRectMake(0,0, XSSREENWIDTH, 44)];
        CGFloat btnW = (XSSREENWIDTH - 2) / 3;
        
        _btn_01 = [self crectBtnX:0 btnTag:100 btnTitle:@"综合"];
        _btn_01.selected = YES;
        [_cellView addSubview:_btn_01];
        
       _btn_02 = [self crectBtnX:btnW + 1 btnTag:200 btnTitle:@"销量"];
         [_cellView addSubview:_btn_02];
       _btn_03 = [self crectBtnX:btnW * 2 + 2 btnTag:300 btnTitle:@"价格"];
        [_cellView addSubview:_btn_03];
        
        [self cellLineFrameX:btnW supView:_cellView];
        [self cellLineFrameX:btnW * 2 + 1 supView:_cellView];
        
    }
    return _cellView;
}

- (UIButton *)crectBtnX:(CGFloat)btnX btnTag:(NSInteger)btnTag btnTitle:(NSString *)title{
    
    UIButton *btton = [UIButton buttonWithType:UIButtonTypeCustom];
    btton.frame = CGRectMake(btnX,0,(XSSREENWIDTH - 2) / 3,44);
    btton.tag = btnTag;
    [btton setTitleColor:[UIColor colorWithHex:0x949494] forState:UIControlStateNormal];
    [btton setTitleColor:[UIColor colorWithHex:0xff2d19] forState:UIControlStateSelected];
    [btton setTitle:title forState:UIControlStateNormal];
    
    [btton addTarget:self action:@selector(cellBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return btton;
}

- (UIView *)cellLineFrameX:(CGFloat)frameX supView:(UIView *)cell{
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(frameX,10, 1, 22)];
    line.backgroundColor = [UIColor colorWithHex:0xe0e0e0];
    [cell addSubview:line];
    return line;
}


#pragma mark - 按钮点击事件

- (void)cellBtnAction:(UIButton *)button{
    button.selected = !button.selected;
    
    if (button.tag == 100) {
        _btn_01.selected = YES;
        _btn_02.selected = NO;
        _btn_03.selected = NO;
    }else if (button.tag == 200){
        _btn_01.selected = NO;
        _btn_02.selected = YES;
        _btn_03.selected = NO;
        
    }else{
        _btn_01.selected = NO;
        _btn_02.selected = NO;
        _btn_03.selected = YES;
    }
    
}

- (IBAction)headerBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSString *str = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";
    CGFloat h1 = self.detailsLabel.height;
    self.detailsLabel.numberOfLines = 0;
    self.detailsLabel.text = str;
    [self.detailsLabel sizeToFit];
    CGFloat h = self.detailsLabel.height;
    self.tabelHeaderView.height = 300 + h - h1;
    [self.tableView reloadData];
}

- (IBAction)leftCancelAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)rightShareBtn:(UIButton *)sender {
}

@end
