//
//  SettingTableViewCell.h
//  naran
//
//  Created by 那然 on 2017/5/11.
//  Copyright © 2017年 那然. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *optionalImageView;

@property (strong, nonatomic) UILabel *optionalabel;

@property (strong, nonatomic) UIImageView *forwordImageview;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier showSwitchBtn:(BOOL)showSwitchBtn;

@end
