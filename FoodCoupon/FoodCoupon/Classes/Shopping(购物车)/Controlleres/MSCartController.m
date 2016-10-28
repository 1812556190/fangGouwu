//
//  MSCartController.m
//  FoodCoupon
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSCartController.h"

#import "MSCartView.h"
#import "MSImageTitle.h"

#import "MSGoodsCell.h"

#import "MSGoodsPrice.h"


#import "MSTableFooter.h"




@interface MSCartController ()<MSCartDelegate,MSGoodsCellDelegate,UITableViewDelegate,UITableViewDataSource>
{
    BOOL _isCart;//当前购物车的状态
    MSGoodsPrice *_goodsPrice;
}
@property (nonatomic, strong) UIButton *rightBarBtn;

@property (strong, nonatomic)UITableView *tableView;

@property (strong, nonatomic)MSImageTitle *headerView;//顶部头视图

@property (strong, nonatomic)MSImageTitle *sectionFootView;

@property (strong, nonatomic)UIView *sectionHeaderView;

@property (strong, nonatomic)MSTableFooter *tableFooterView;


@property (strong, nonatomic)UIView *editView;

@end

static NSString *cellID = @"MSGoodsCell";

@implementation MSCartController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isCart = NO;
    if (_isCart) {//当购物车为空时
        [self loadCartView];
    }else{
         [self loadSubView];
    }
    

    self.title = @"购物车";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHex:0xffffff]] forBarMetrics:0];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    //设置状态栏颜色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}


#pragma mark - 当购物车不为空时
- (void)loadSubView{
    
    self.view.backgroundColor = [UIColor colorWithHex:0xe0e0e0];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBarBtn];
    
    [self.view addSubview:self.headerView];//添加顶部时间视图
    
    [self.view addSubview:self.tableView];//添加tableView
    
    
    [self.view addSubview:self.editView];//添加编辑视图

   
  
    
 
}
#pragma mark - 导航栏右边按钮点击事件
- (void)rightBarAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    [UIView animateWithDuration:0.25 animations:^{
        self.editView.transform = CGAffineTransformMakeTranslation(0,40);
    } completion:^(BOOL finished) {
        self.editView.transform = CGAffineTransformIdentity;
    }];
    if (btn.selected) {
        _goodsPrice.isType = YES;
    }else{
        _goodsPrice.isType = NO;
    }
}


#pragma mark -
- (void)changeGoodsNumber:(NSInteger)goodsNumber{
    NSLog(@"当前商品数量为:%ld",goodsNumber);
    _goodsPrice.goodsNum = [NSNumber numberWithInteger:goodsNumber];
}



#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MSGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.goodsCellDelegate = self;
    if (indexPath.section == 1) {
        return UITableViewCell.new;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 1) {
        return [self sectionHeaderView];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return self.sectionFootView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 0;
    }
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 20;
    }
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 40;
    }
    return CGFLOAT_MIN;
}




#pragma mark - 懒加载视图

- (UIView *)editView{
    if (!_editView) {
        _editView = [[UIView alloc] initWithFrame:CGRectMake(0,XSSREENHEIGHT - 150, XSSREENWIDTH, 40)];
        //总计窗口
        _goodsPrice = [[MSGoodsPrice alloc] initWithloadViewFrame:CGRectMake(0, 0,XSSREENWIDTH,40)];
        _goodsPrice.price = @109.0;
        _goodsPrice.currentGoodsName = @"...";
        _goodsPrice.goodsNum = @1;
        [_editView addSubview:_goodsPrice];
    }
    return _editView;
}

- (UIButton *)rightBarBtn{
    if (!_rightBarBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"编辑" forState:UIControlStateNormal];
         [btn setTitle:@"确定" forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithHex:0x000000] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(rightBarAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn sizeToFit];
        _rightBarBtn = btn;
    }
    
    return _rightBarBtn;
}


- (UITableView *)tableView{
    if (!_tableView) {
        CGRect tableViewFrame = CGRectMake(0,self.headerView.height, XSSREENWIDTH,XSSREENHEIGHT - self.headerView.height - 64 - 49);
        UITableView *tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerNib:[UINib nibWithNibName:@"MSGoodsCell" bundle:nil] forCellReuseIdentifier:cellID];
        tableView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
        tableView.tableFooterView = self.tableFooterView;
        _tableView = tableView;
    }
    return _tableView;
}

- (MSTableFooter *)tableFooterView{
    if (!_tableFooterView) {
        _tableFooterView = [[MSTableFooter alloc] initWithCustomCollectionView];
        [_tableFooterView cellLoadHeight];
//        _tableFooterView.backgroundColor = [UIColor redColor];
    }
    return _tableFooterView;
}



- (MSImageTitle *)headerView{
    if (!_headerView) {
        _headerView = [[MSImageTitle alloc] initWithViewFrame:CGRectMake(0, 0, XSSREENWIDTH, 35) textType:RightTextModeAttributed leftImage:@"clock" rightText:@"19:20.9"];
    }
    return _headerView;
}

- (MSImageTitle *)sectionFootView{
    if (!_sectionFootView) {
        _sectionFootView = [[MSImageTitle alloc] initWithViewFrame:CGRectMake(0, 0, XSSREENWIDTH, 40) textType:RightTextModeOrdinary leftImage:@"cmSelectAccount" rightText:@"100%正品保保证,格格家特卖包邮。"];
        _sectionFootView.backgroundColor = [UIColor clearColor];
    }
    return _sectionFootView;
}

- (UIView *)sectionHeaderView{
    if (!_sectionHeaderView) {
        _sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XSSREENWIDTH, 40)];
        
        NSString *str = @"吃货们还买了";
        CGSize size = [str sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
        UILabel *label = [[UILabel alloc] init];
        label.text = str;
        label.textColor = [UIColor colorWithHex:0xababab];
        label.font = [UIFont systemFontOfSize:15];
        label.size = CGSizeMake(size.width,20);
        label.center = _sectionHeaderView.center;
        [_sectionHeaderView addSubview:label];
        
        [_sectionHeaderView addSubview:[self creatLineViewX:5 width:size.width]];
        [_sectionHeaderView addSubview:[self creatLineViewX:label.x + label.width + 5 width:size.width]];
        
        
    }
    return _sectionHeaderView;
}

- (UIView *)creatLineViewX:(CGFloat)x width:(CGFloat)width{
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor colorWithHex:0xe0e0e0];
    line1.x = x;
    line1.height = 2;
    line1.y = (40 - 2) / 2;
    line1.width = (XSSREENWIDTH - width - 20) / 2;
    return line1;
}


#pragma mark - 当购物车为空时加载的页面

- (void)loadCartView{
    
    MSCartView *cartView = [[MSCartView alloc] initWithLoadNibViewFrame:self.view.bounds imageGif:@"empty_shoppingCart"];
    cartView.cartDelegate = self;
    [self.view addSubview:cartView];
    
}

#pragma mark - MSCartDelegate

- (void)didSelectedAction:(UIButton *)btn{
    NSLog(@"点击了按钮!");
    //设置当前tabBarController显示的视图
    self.tabBarController.selectedIndex = 0;
}



- (void)dealloc{
    
    
}



@end
