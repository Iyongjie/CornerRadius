//
//  ViewController.m
//  SectionCorner
//
//  Created by 李永杰 on 2019/4/24.
//  Copyright © 2019 李永杰. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Shadow.h"
#import "TextCell.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView   *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"点击了" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(100, 50, 100, 30)];
    btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
    [btn shadow:btn cornerRadius:0 withShadow:YES withOpacity:0.8];
    
    [self.view addSubview:self.tableView];
    
    UIView *backView = [[UIView alloc]initWithFrame:self.tableView.frame];
    [self.view addSubview:backView];
    [self.view insertSubview:backView belowSubview:self.tableView];

    [self shadow:backView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld------%ld",indexPath.section,indexPath.row];
    cell.tableView = tableView;
    return cell;
}
// 设置头部
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 1 ? 30 : 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor = [UIColor blueColor];
    return section == 1 ? view : nil;

}
// 设置尾部
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(20, 20)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
        }
    }else if (indexPath.section == 1) {
//  第2个分区，分区头部，和最后一个cell，设置圆角
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(20, 20)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;

        }
    }

}
#pragma mark lazy
-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width - 100, self.view.frame.size.height - 200) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[TextCell class] forCellReuseIdentifier:@"cellid"];
        
    }
    return _tableView;
}


-(void)shadow:(UIView *)view  {

    view.layer.shadowColor = [UIColor colorWithRed:115/255.0 green:0 blue:0 alpha:0.5].CGColor;
    view.layer.shadowOpacity = 1;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = 10;
    view.layer.shouldRasterize = NO;
    view.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[view bounds] cornerRadius:0] CGPath];
    view.layer.masksToBounds = NO;
}


@end
