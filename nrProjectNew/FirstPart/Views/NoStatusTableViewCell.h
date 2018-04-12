//
//  NoStatusTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/12.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoStatusTableViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView * noBooksImage;

@property (strong, nonatomic) UILabel * noBooksLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier noBookHelp:(BOOL)noBook;

@property (strong, nonatomic) UIView * bgView;

@property (strong, nonatomic) UIImageView * helpBooksImage;

@property (strong, nonatomic) UILabel * helpBooksLabel;

@property (strong, nonatomic) UILabel * helpBookContentsLabel;

@end
