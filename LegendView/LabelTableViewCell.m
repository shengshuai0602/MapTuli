//
//  LabelTableViewCell.m
//  Management
//
//  Created by 泽华伟业 on 16/8/16.
//  Copyright © 2016年 泽华伟业. All rights reserved.
//

#import "LabelTableViewCell.h"
#import <Masonry.h>

@implementation LabelTableViewCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self label];
    }
    return self;
}

-(UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];

        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
           }
    return _label;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
