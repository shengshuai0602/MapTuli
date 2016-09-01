//
//  Header.h
//  LegendView
//
//  Created by 泽华伟业 on 16/8/20.
//  Copyright © 2016年 泽华伟业. All rights reserved.
//

#ifndef Header_h
#define Header_h
#import <Masonry.h>
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0f]

#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:(A)]
//适配比例，以iphone6尺寸为基准
#define wl ([UIScreen mainScreen].bounds.size.width/375)
#define hl ([UIScreen mainScreen].bounds.size.height/667)
#endif /* Header_h */
