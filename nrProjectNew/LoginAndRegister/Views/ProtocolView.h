//
//  ProtocolView.h
//  naran
//
//  Created by 那然 on 2017/3/8.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProtocolViewDelegate <NSObject>

- (void)pushWebView;

@end


@interface ProtocolView : UIView

- (id)initWithFrame:(CGRect)frame text:(NSString *)text;

@property (strong, nonatomic) UIButton *imageButton;

@property (assign, nonatomic) id<ProtocolViewDelegate>delegate;

@end
