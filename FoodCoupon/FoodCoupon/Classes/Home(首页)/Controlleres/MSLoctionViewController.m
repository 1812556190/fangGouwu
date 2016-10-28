//
//  MSLoctionViewController.m
//  FoodCoupon
//
//  Created by apple on 16/10/20.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSLoctionViewController.h"

#import "MSLoctionCell.h"

#define HeaderSectionHeight 30

@interface MSLoctionViewController ()<UITableViewDelegate, UITableViewDataSource,MSLoctionCellDelegate>{
    UILabel *_sectionTitle;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic)NSMutableArray *chinaInfoes;//所有的省份

@property (strong, nonatomic)NSMutableArray *indexTites;//所有的索引

@property (strong, nonatomic)UIView *headerSection;

@end

static NSString *cellID = @"MienCELL";

static NSString *CELL_CUSTOM = @"MSLoctionCell";

@implementation MSLoctionViewController


#pragma mark - 懒加载数据

- (NSMutableArray *)indexTites{
    if (!_indexTites) {
        _indexTites = [NSMutableArray array];
    }
    return _indexTites;
}

- (NSMutableArray *)chinaInfoes{
    if (!_chinaInfoes) {
        _chinaInfoes = [NSMutableArray array];
        
        //加载plist文件
         NSString *filePath = [[NSBundle mainBundle] pathForResource:@"China" ofType:@"plist"];
        NSArray *tempArr = [[NSArray alloc] initWithContentsOfFile:filePath];
        
        
        for (NSDictionary  *dict in tempArr) {
            [_chinaInfoes addObject:dict[@"Itemes"]];
            [self.indexTites addObject:dict[@"title"]];
        }
    }
    
    return _chinaInfoes;
}

#pragma mark - viewDidLoad

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = @"选择地区";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor lightGrayColor]] forBarMetrics:UIBarMetricsDefault];
   
    //设置索引属性
    
    self.tableView.sectionIndexColor = [UIColor colorWithHex:0x33383b];//字体颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];//背景色
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.tableView registerClass:[MSLoctionCell class] forCellReuseIdentifier:CELL_CUSTOM];
    
}




#pragma mark - UITableViewDelegate && UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.chinaInfoes.count + 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 1;
    }else{
        NSArray *item = self.chinaInfoes[section - 2];
        return item.count;
    }
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.textColor = [UIColor colorWithHex:0x3e3b3d];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"locationIcon"];
        cell.textLabel.text = @"四川";
    }else if (indexPath.section == 1){
        
        MSLoctionCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_CUSTOM];
        cell.loctionCellDelegate = self;
        cell.btnTites = @[@"杭州",@"成都",@"巴中"];
        
        
        return cell;
    }else{
       
        NSArray *item = self.chinaInfoes[indexPath.section - 2];
        cell.textLabel.text = item[indexPath.row];
        cell.imageView.image = nil;
        
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        return 50;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HeaderSectionHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 1) {
        return 10;
    }
    return CGFLOAT_MIN;
}


//每一组的头视图

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
     UIView *headeView  = [self creatSectionHeaderView];
    if (section == 0) {
        _sectionTitle.text = @"当前定位地区";
    }else if(section == 1){
         _sectionTitle.text = @"热门城市";
    }else{
        _sectionTitle.leftMargin = 35;
        _sectionTitle.text = self.indexTites[section - 2];
    }
    return headeView;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 1) {
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XSSREENWIDTH, 10)];
        footerView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
        return footerView;
    }
    return nil;
}


//设置索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.indexTites;
}
//点击索引时调用
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    
    [XSHUDView showSectionIndexViewTitle:title];
    
    return index;
}

//设置每组的头视图
- (UIView *)creatSectionHeaderView{
    UIView *headeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XSSREENWIDTH,HeaderSectionHeight)];
    headeView.backgroundColor = [UIColor colorWithHex:0xe0e0e0];
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor colorWithHex:0x7a7a7a];
    label.frame = CGRectMake(15,(HeaderSectionHeight - 20) / 2, 100, 20);
    [headeView addSubview:label];
    _sectionTitle = label;
    
    return headeView;
}

//点击cell时调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    [self didcancelCellTitle:cell.textLabel.text];
    
}

#pragma mark - MSLoctionCellDelegate

- (void)didSelectCellBtn:(UIButton *)btn{
    
    [self didcancelCellTitle:btn.titleLabel.text];
    
}

#pragma mark - 返回上一个页面
- (void)didcancelCellTitle:(NSString *)text{
    
    if (self.cellTitBlock) {
        self.cellTitBlock(text);//传值回到上一个页面
        [self.navigationController popViewControllerAnimated:YES];
    }
}



@end
