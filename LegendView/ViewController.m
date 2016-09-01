//
//  ViewController.m
//  LegendView
//
//  Created by 泽华伟业 on 16/8/20.
//  Copyright © 2016年 泽华伟业. All rights reserved.
//

#import "ViewController.h"
#import "LegendView.h"
#import "LabelTableViewCell.h"
#import "Header.h"

@interface ViewController ()
@property(nonatomic,strong)LegendView *legendView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *colorArray = @[RGBCOLOR(2, 12, 100),RGBCOLOR(7, 30, 120),
                            RGBCOLOR(17, 49, 139),RGBCOLOR(27, 68, 159),
                            RGBCOLOR(38, 87, 179),RGBCOLOR(48, 106, 199),
                            RGBCOLOR(59, 126, 219),RGBCOLOR(78, 138, 221),
                            RGBCOLOR(97, 150, 224),RGBCOLOR(116, 163, 226),
                            RGBCOLOR(135, 175, 229),RGBCOLOR(155, 188, 232),
                            RGBCOLOR(154, 196, 220),RGBCOLOR(153, 205, 208),
                            RGBCOLOR(152, 214, 196),RGBCOLOR(151, 232, 173),
                            RGBCOLOR(215, 222, 126),RGBCOLOR(234, 219, 112),
                            RGBCOLOR(244, 217, 99),RGBCOLOR(250, 204, 79),
                            RGBCOLOR(247, 180, 45),RGBCOLOR(242, 155, 0),
                            RGBCOLOR(241, 147, 3),RGBCOLOR(240, 132, 10),
                            RGBCOLOR(239, 117, 17),RGBCOLOR(238, 102, 24),
                            RGBCOLOR(238, 88, 31),RGBCOLOR(231, 75, 26),
                            RGBCOLOR(224, 63, 22),RGBCOLOR(217, 51, 18),
                            RGBCOLOR(208, 36, 14),RGBCOLOR(194, 0, 3),
                            RGBCOLOR(181, 1, 9),RGBCOLOR(169, 2, 16),
                            RGBCOLOR(138, 5, 25),RGBCOLOR(111, 0, 21),
                            RGBCOLOR(80, 0, 15)];
    NSArray *countArray =   @[@"<-30",@"-30~-28",@"-28~-26",@"-26~-24",@"-24~-22",                                  @"-22~-20",@"-20~-18",@"-18~-16",@"-16~-14",@"-14~-12",@"-12~-10",                                  @"-10~-8", @"-8~-6",@"-6~-4",@"-4~-2",@"-2~0",@"0~2",@"2~4",@"4~6",                                  @"6~8", @"8~10",@"10~12",@"12~14",@"14~16",@"16~18",@"18~20",                                  @"20~22",@"22~24",@"24~26",@"26~28",@"28~30",@"30~32",@"32~34",                                  @"34~36",@"36~38",@"38~40",@">40"];
    ///添加图例视图
    _legendView =[[LegendView alloc]initWithColorArray:colorArray CountArray:countArray];
    [_legendView.unitLabel setText:@"单位:(℃)"];
    [self.view addSubview:_legendView];
    [_legendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).offset (-10);
        make.size.mas_equalTo(CGSizeMake(100*wl, 30*hl+colorArray.count *10*hl));
    }];
    

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
