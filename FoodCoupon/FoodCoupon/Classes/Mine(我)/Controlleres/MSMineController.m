//
//  MSMineController.m
//  FoodCoupon
//
//  Created by apple on 16/10/17.
//  Copyright © 2016年 Lingser. All rights reserved.
//

#import "MSMineController.h"
#import "MSTabViewCell.h"
#import "MSTabCell.h"




@interface MSMineController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *icoBtn;

@property (weak, nonatomic) IBOutlet UILabel *nicknameText;
@property (weak, nonatomic) IBOutlet UIButton *membersBtn;

@end

static NSString *cellID_sys = @"CELL";
static NSString *cellID_Coustm = @"COUSTMCELL";
static NSString *cellID_Coustm_02 = @"COLLCELL";

@implementation MSMineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar setHidden:YES];
    
    
//    self.icoBtn.hidden = YES;
    self.membersBtn.hidden = YES;
    self.nicknameText.hidden = YES;
    
    
    [self setterTabView];//设置tabView
    
}


- (void)setterTabView{
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithHex:0xf5f5f5];
    
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID_sys];
    
    [self.tableView registerClass:[MSTabViewCell class] forCellReuseIdentifier:cellID_Coustm];
     [self.tableView registerClass:[MSTabCell class] forCellReuseIdentifier:cellID_Coustm_02];
    
}

#pragma mark - tabViewHeaderAction

- (IBAction)settingAction:(UIButton *)sender {
}

- (IBAction)membersAction:(UIButton *)sender {
}
- (IBAction)loginAction:(UIButton *)sender {
}



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_sys forIndexPath:indexPath];
        cell.textLabel.text = @"我的订单";
        cell.textLabel.textColor = [UIColor colorWithHex:0xb6b6b6];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else if (indexPath.section == 1){
        MSTabViewCell *msCell = [tableView dequeueReusableCellWithIdentifier:cellID_Coustm];
        return msCell;
    }else{
        MSTabCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_Coustm_02];
        
        return cell;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        return 60;
    }else if (indexPath.section == 2){
        return 161;
    }else{
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 10;
    }else{
        return 1;
    }
}




@end
