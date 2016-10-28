//
//  MSHomeController.m
//  FoodCoupon
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSHomeController.h"

#import "DTScrollStatusView.h"

#import "MSTabViewHeader.h"

#import "MSHeaderInfo.h"


#import "XSToolHttpRequst.h"

#import "MSNavLisetRequest.h"

#import "MSTitImageCell.h"

#import "MSHomeTabSectionHeader.h"

#import "MSTitleTimeCell.h"


#import "MSLoctionViewController.h"
#import "MSSearchController.h"


#import <Masonry.h>
#import <MJExtension.h>


#import "XSText.h"

@interface MSHomeController ()<DTScrollStatusDelegate>{
    UIButton *_loctionBtn;
}
@property (nonatomic, strong) UIView *titView;

@property (nonatomic, strong) DTScrollStatusView *bodyView;

@property (nonatomic, strong) NSMutableArray *tabViewHeaderViewes;//保存所有的头视图

@property (nonatomic , strong) NSMutableArray *tabHeaderInfoes;//头视图本地信息

@end

@implementation MSHomeController



#pragma mark - 按钮点击事件
//跳转到搜索页面
- (void)rightAction:(UIButton *)btn{
    
    MSSearchController *searchVc = [[MSSearchController alloc] init];
    searchVc.hidesBottomBarWhenPushed = YES;//隐藏底部的tabbar
    
    [self.navigationController pushViewController:searchVc animated:YES];
}

//进入定位界面
- (void)loctionbtnAction:(UIButton *)btn{
    
    MSLoctionViewController *loctionVc = [self.storyboard instantiateViewControllerWithIdentifier:@"MSLoctionViewController"];
    loctionVc.hidesBottomBarWhenPushed = YES;
    
    //实现block
    loctionVc.cellTitBlock = ^(NSString *title){
        [_loctionBtn setTitle:title forState:UIControlStateNormal];
    };
    [self.navigationController pushViewController:loctionVc animated:YES];
}

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self requestLoadnavList];//网络请求

    [self setterNaviGation];//设置导航栏
    
    [self setterBodyView];//设置首页主视图
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //设置导航栏颜色
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"moviePlayer_minimumTrack"] forBarMetrics:UIBarMetricsDefault];

    
}




- (void)requestLoadnavList{
    
    MSNavLisetRequest *request = [[MSNavLisetRequest alloc] init];
    request.accountId = @"0";
    request.channel = @"3";
    request.imei = @"662ADF7C3600DE9CE292B2F14347B9EA";
    request.os = @"1";
    request.params = @{@"type":@"123546789abcd",@"accountId":@"0",@"province":@"510000",@"city":@"510100@"};
    request.sign = @"325069BF825241BE";
    request.version = @"2.7";

    
    
    [XSToolHttpRequst requstNativeParameter:request.mj_keyValues withSuccessHander:^(id resulst, NSError *error) {
        
        if (error) {
            NSLog(@"---%@",error);
        }else{
            NSLog(@"%@",resulst);
        }
        
    }];
    
}

//设置tabView

- (void)setterBodyView{
  
    [self.view addSubview:self.bodyView];
    
    NSArray *tabViewes = self.bodyView.tableArr;
    
    //设置所有视图的头视图
    for (NSInteger i = 0; i < self.tabViewHeaderViewes.count; i ++) {
        UITableView *tab = tabViewes[i];
        tab.tableHeaderView = self.tabViewHeaderViewes[i];
        if (i == 0 || i == 1) {
            [tab registerClass:[MSTitImageCell class] forCellReuseIdentifier:@"CELLIMAGE"];
        }else if (i == 2){
            [tab registerNib:[UINib nibWithNibName:@"MSTitleTimeCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TitleTimeCell"];
        }
    }
}



#pragma mark -懒加载本地数据
- (NSMutableArray *)tabHeaderInfoes{
    if (!_tabHeaderInfoes) {
        _tabHeaderInfoes = [NSMutableArray array];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"MSHeaderBtnInfo" ofType:@"plist"];
        NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:filePath];
        for (NSArray *temp in dict[@"HeaderInfo"]) {
            MSHeaderInfo *info = [[MSHeaderInfo alloc] init];
            info.btnTitles = temp[0];
            //        info.btnImages = arr[1];//数据为空时会报错
            [_tabHeaderInfoes addObject:info];
        }
    }
    return _tabHeaderInfoes;
}


- (NSMutableArray *)tabViewHeaderViewes{
    if (!_tabViewHeaderViewes) {
        _tabViewHeaderViewes = [NSMutableArray array];
        for (NSInteger i = 0; i < 7; i ++) {
            
           MSHeaderInfo *info = self.tabHeaderInfoes[i];
            
            MSTabViewHeader *header = [[MSTabViewHeader alloc] initWithTabViewHeaderScrollImagees:info.scrollImages btnImagees:nil btnTitle:info.btnTitles];
            [_tabViewHeaderViewes addObject:header];
        }
    }
    return _tabViewHeaderViewes;
}



#pragma mark - DTScrollStatusDelegate
- (void)refreshViewWithTag:(int)tag andIsHeader:(BOOL)isHeader{
    if (isHeader) {
        if (tag == 1) {
            NSLog(@"呵呵");
        }
    }
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag == 1) {
        MSTitImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLIMAGE"];
        cell.imageUrl = @"http://yangege.b0.upaiyun.com/11e47bbdfa98b.jpg";
        return cell;
    }else if (tableView.tag == 2){
        MSTitImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELLIMAGE"];
        cell.btnImagees = @[@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2",@"activityTips2"];
        return cell;
    }else if (tableView.tag == 3){
        MSTitleTimeCell *timeCell = [tableView dequeueReusableCellWithIdentifier:@"TitleTimeCell"];
        return timeCell;
    }
    
   return UITableViewCell.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 1) {
        return 150;
    }else{
        return 200;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
//    NSLog(@"%ld",section);
    
    MSHomeTabSectionHeader *headerView = [[MSHomeTabSectionHeader alloc] initWithTabViewSectionHeaderViewTitle:@"超级品牌团" subTitle:@"大牌低折 30天低价 抢购稀缺"];
    
    return headerView;
}




- (void)setterNaviGation{
    
    //设置右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem customItemNormalImage:@"navItemSearch2" selectedImage:nil target:self action:@selector(rightAction:)];
    
    
   //设置中间的视图
    self.navigationItem.titleView = self.titView;
    
}


#pragma mark - 设置视图

- (UIView *)titView{
    if (!_titView) {
        UIView *titView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,200,44)];

        UILabel *label = [[UILabel alloc] init];
        label.text = @"格格家";
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
//        label.backgroundColor = [UIColor whiteColor];
        [titView addSubview:label];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn customBtnImage:@"nationPullArrow" btnAction:@selector(loctionbtnAction:) btnTarget:self btnTitColor:nil btnTitle:@"四川"];
        btn.imageEdgeInsets = UIEdgeInsetsMake(10,28,0,0);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0,-28, 0,0);
        _loctionBtn = btn;
        [titView addSubview:btn];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(titView);
        }];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_top).offset(10);
            make.bottom.equalTo(label.mas_bottom);
            make.leading.equalTo(label.mas_trailing).offset(10);
        }];
        
        _titView = titView;
    }
    return _titView;
}

- (DTScrollStatusView *)bodyView{
    if (!_bodyView) {
        NSArray *conTitle = @[@"首页",@"保健润资",@"休闲零食",@"茶饮酒水",@"水果生鲜",@"格格厨房",@"母婴辅食",@"最后疯抢",@"即将开抢"];
        _bodyView = [[DTScrollStatusView alloc] initWithTitleArr:conTitle andType:ScrollTapTypeWithNavigationAndTabbar andNormalTabColor:[UIColor colorWithHex:0x797979] andSelectTabColor:[UIColor redColor]];
        _bodyView.scrollStatusDelegate = self;
    }
    
    return _bodyView;
}


@end
