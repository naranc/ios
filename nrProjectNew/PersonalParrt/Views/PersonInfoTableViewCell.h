//
//  PersonInfoTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/20.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLProgressBar.h"
#import "ImageTextButton.h"

@interface PersonInfoTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView * userImageView;

@property (nonatomic, strong) UILabel * nickNameL;

@property (nonatomic, strong) UILabel * introL;

@property (nonatomic, strong) UIImageView * lvMarkImageView;//等级徽章

@property (nonatomic, strong) YLProgressBar * lvProgressBar;

@property (nonatomic, strong) YLProgressBar * loveProgressBar;

@property (nonatomic, strong) ImageTextButton * lvButton;

@property (nonatomic, strong) ImageTextButton * loveButton;

@property (nonatomic, strong) UILabel * lvLabel;//等级值

@property (nonatomic, strong) UILabel * loveLabel;//爱心值

@property (nonatomic, strong) UIButton * idButton;//身份认证

@property (nonatomic, copy) void(^onClickMessageButton)(void);

@property (nonatomic, copy) void(^onClickSettingButton)(void);

@property (nonatomic, copy) void(^onClickUserImageButton)(void);

@property (nonatomic, copy) void(^onClickIDButton)(void);

@end
