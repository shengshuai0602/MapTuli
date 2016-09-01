//
//  LegendView.m
//  Management
//
//  Created by 泽华伟业 on 16/8/16.
//  Copyright © 2016年 泽华伟业. All rights reserved.
//

#import "LegendView.h"
#import "LabelTableViewCell.h"
#import "Header.h"

@interface LegendView ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation LegendView

-(instancetype)initWithColorArray:(NSArray *)colorArray CountArray:(NSArray *)countArry{
    
    self = [super init];
    if (self) {
        _countArray =  countArry;
        _colorArray = colorArray;
        [self colorTableView];
        [self countTableView];
        
        self.backgroundColor = RGBACOLOR(0, 0, 0, 0.6);

    }
    
    return self;
}

-  (void)updateLegendViewWithColorArray:(NSArray *)colorArr andCountArray:(NSArray *)countArr
{
    _countArray = countArr;
    _colorArray = colorArr;
    [_colorTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(5*wl);
        make.top.equalTo(self).offset(20*hl);
        
        make.height.mas_equalTo(_colorArray.count *10*hl);
        
        make.width.mas_equalTo(40*hl);
        
        
    }];
    
    [_countTableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_colorTableView.mas_right).offset(5*wl);
        make.top.equalTo(self).offset(20*hl);
        make.height.mas_equalTo(_countArray.count *10*hl);
        
        make.width.mas_equalTo(60*hl);
    }];
    [_countTableView reloadData];
    [_colorTableView reloadData];
}


-(UITableView *)colorTableView{
    
   if (!_colorTableView) {
        _colorTableView = [[UITableView alloc]init];
        [self addSubview:_colorTableView];
        [self shezhiTableView:_colorTableView];
            [_colorTableView mas_makeConstraints:^(MASConstraintMaker *make) {
         
            make.left.equalTo(self.mas_left).offset(5*wl);
            make.top.equalTo(self).offset(20*hl);

            make.height.mas_equalTo(_colorArray.count *10*hl);
          
            make.width.mas_equalTo(40*hl);

        
        }];
 
   }


    return _colorTableView;
}

-(UITableView *)countTableView{
    if (!_countTableView) {
        _countTableView = [[UITableView alloc]init];
        [self addSubview:_countTableView];
        [self shezhiTableView:_countTableView];
        
        [_countTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_colorTableView.mas_right).offset(5*wl);
            make.top.equalTo(self).offset(20*hl);
            make.height.mas_equalTo(_countArray.count *10*hl);
            make.width.mas_equalTo(60*hl);
        }];

           }
 


   
    
    NSLog(@"=====%f,%ld",_countTableView.frame.size.height,(unsigned long)_countArray.count);
    return _countTableView;
}

-(UILabel *)unitLabel{
    if (!_unitLabel) {
        _unitLabel = [[UILabel alloc]init];
        [_unitLabel setFont:[UIFont systemFontOfSize:10]];
        _unitLabel.backgroundColor = [UIColor clearColor];
        [_unitLabel setTextColor:[UIColor whiteColor]];
        [self addSubview:_unitLabel];
        [_unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(3);
            make.size.mas_equalTo(CGSizeMake(60*wl, 18*hl));
        }];
    }
    
    return _unitLabel;
}

-(void)shezhiTableView:(UITableView *)tableView{
    tableView.delegate = self;
    tableView.dataSource = self;
    //禁止滑动
    tableView.scrollEnabled = NO;
    //去掉下划线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor clearColor];
}

#pragma mark -- tableView代理方法
///行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
         return 10*hl;
    
}
///返回row的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([tableView  isEqual:_colorTableView]) {
        
        return _colorArray.count;
    }else if ([tableView isEqual:_countTableView]){
 
        return _countArray.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if ([tableView isEqual:_colorTableView]) {
      
       static NSString *colorCell_id = @"colorCellid";
        UITableViewCell *colorCell = [tableView dequeueReusableCellWithIdentifier:colorCell_id];
        if (!colorCell) {
            colorCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:colorCell_id];
        }
        ///设置color；
        colorCell.backgroundColor = [_colorArray objectAtIndex:indexPath.row];
        
        
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return colorCell;
        
    }else if ([tableView isEqual:_countTableView]){
        static NSString *countCell_id = @"countCellid";
        LabelTableViewCell *countCell = [tableView dequeueReusableCellWithIdentifier:countCell_id];
        if (!countCell) {
            countCell = [[LabelTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:countCell_id];
        }
        //赋值数据
      
        countCell.label.text = [_countArray objectAtIndex:indexPath.row];
        countCell.label.textColor = [_colorArray objectAtIndex:indexPath.row];
        [countCell.label setFont:[UIFont systemFontOfSize:8]];
        countCell.backgroundColor = [UIColor clearColor];
        
///禁止被点击
        countCell.selectionStyle = UITableViewCellSelectionStyleNone;

        return countCell;
    }
    
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
@end
