//
//  HomeTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/8.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView * bgView;

@property (nonatomic, strong) UIImageView * bookImageView;

@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * authorLabel;

@property (nonatomic, strong) UILabel * introLabel;

@property (nonatomic, strong) ImageTextButton * locationBtn;

- (void)bookDetailViewConfigCellWithModel:(NSDictionary *)model indexPath:(NSIndexPath *)indexPath;

@end
