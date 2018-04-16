//
//  BookIntroView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookIntroView : UIView

@property (nonatomic, strong) UIImageView *picImageView;

@property (nonatomic, strong) UILabel * bookNameLabel;

@property (nonatomic, strong) UIButton * borrowButton;

@property (nonatomic, strong) UILabel * bookauthorLabel;

@property (nonatomic, strong) UILabel * donateLabel;

@property (nonatomic, strong) ImageTextButton * userImageView;

@property (nonatomic, strong) UILabel * gradeLabel;

@property (nonatomic, strong) UIView * starView;

@property (nonatomic, strong) UIImageView * verticalImageView;

@property (nonatomic, strong) ImageTextButton * reviewerButton;

@property (nonatomic, strong) UIImageView * horizontalImageView;

@property (nonatomic, strong) ImageTextButton * statusButton;

@property (nonatomic, strong) ImageTextButton * locationButton;

@end
