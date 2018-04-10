//
//  UIButton+Block.h
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(UIButton* btn);

@interface UIButton (Block)

- (void)addAction:(ButtonBlock)block;
- (void)addAction:(ButtonBlock)block forControlEvents:(UIControlEvents)controlEvents;

@end
