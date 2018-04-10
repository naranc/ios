//
//  WallTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WallTableViewCell : UITableViewCell

//@property (strong, nonatomic) UIImageView * leftImageView;

//@property (strong, nonatomic) UIImageView * rightImageView;

@property (nonatomic, copy) void(^onClickWishImageButton)(void);

@property (nonatomic, copy) void(^onClickDonateImageButton)(void);

@end
