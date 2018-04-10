//
//  ImageTextButton.h
//  naran
//
//  Created by 那然 on 2017/3/23.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ImageTextButtonStyle) {
    ImageTextButtonStyleLeftImageRightTitle,
    ImageTextButtonStyleLeftTitleRightImage,
    ImageTextButtonStyleUpImageDownTitle,
    ImageTextButtonStyleUpTitleDownImage,
    ImageTextButtonStyleFirstSraechBar,
    ImageTextButtonNSTextAlignmentLeft,
    ImageTextButtonNSTextAlignmentRight
};

@interface ImageTextButton : UIButton
/// 布局方式
@property (nonatomic, assign) ImageTextButtonStyle layoutStyle;
/// 图片和文字的间距，默认值8
@property (nonatomic, assign) CGFloat midSpacing;
/// 指定图片size
@property (nonatomic, assign) CGSize imageSize;

@end
