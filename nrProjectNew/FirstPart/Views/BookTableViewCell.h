//
//  BookTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView * bookImageView;

@property (strong, nonatomic) UILabel * bookNameLabel;

@property (strong, nonatomic) UILabel * bookIntroLabel;

@property (strong, nonatomic) ImageTextButton * locationBtn;

@property (strong, nonatomic) UIImageView * lineView;

@end
