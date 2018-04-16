//
//  BookInfoTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookInfoTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel * bookInfottTitleL;

@property (nonatomic, strong)UITextField * bookInfoTF;

@property (nonatomic, strong)UIImageView * lineView;

- (void)setBookInfoCellTitleAndContent:(NSString *)title content:(NSString *)content indexPath:(NSIndexPath *)indexPath;

@end
