//
//  TopSelectView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopSelectViewDelegate <NSObject>

- (void)clickTopSlectType:(NSInteger)type;

@end

@interface TopSelectView : UIView
{
    CGFloat space;
}
@property (nonatomic, strong) ImageTextButton * loveBtn;

@property (nonatomic, strong) ImageTextButton * pankBtn;

@property (nonatomic, strong) ImageTextButton * commBtn;

@property (nonatomic, strong) ImageTextButton * bookBtn;

@property (nonatomic, assign) id<TopSelectViewDelegate>delegate;

@end
