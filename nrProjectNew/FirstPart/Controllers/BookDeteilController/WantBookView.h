//
//  WantBookView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WantBookView : UIView

@property (nonatomic, strong) ImageTextButton * wantBtn;

@property (nonatomic, strong) UIImageView * lineView;

@property (nonatomic, strong) UIImageView * userImageView;

- (void)creatWantPersonUserImageViewWithArray:(NSArray *)array;

@end
