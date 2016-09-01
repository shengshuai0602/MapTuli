//
//  LegendView.h
//  Management
//
//  Created by 泽华伟业 on 16/8/16.
//  Copyright © 2016年 泽华伟业. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LegendView : UIView
///图例tableView
@property(nonatomic,strong)UITableView * colorTableView;
///数值tableView
@property(nonatomic,strong)UITableView *countTableView;

@property(nonatomic,strong)UILabel *unitLabel;

///颜色数值
@property(nonatomic,strong)NSArray *colorArray;
///数值数组
@property(nonatomic,strong)NSArray *countArray;

///初始化方法
-(instancetype)initWithColorArray:(NSArray *)colorArray CountArray:(NSArray *)countArry;

- (void)updateLegendViewWithColorArray:(NSArray *)colorArr andCountArray:(NSArray *)countArr;
@end
