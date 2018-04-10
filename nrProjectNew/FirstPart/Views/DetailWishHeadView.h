//
//  DetailWishHeadView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/18.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WishModel;

@interface DetailWishHeadView : UIView
- (id)initWithFrame:(CGRect)frame model:(WishModel *)wishModel;

- (id)initWithFrame:(CGRect)frame HasOnePic:(BOOL)hasOnePic model:(WishModel*)wishModel;

- (id)initWithFrame:(CGRect)frame morePic:(BOOL)morePic model:(WishModel*)wishModel;
@end
