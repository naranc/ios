//
//  BookTagsCollectionViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookTagsCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton * tagButton;

@property (nonatomic, copy) void(^onClickTagButton)(NSInteger tag);

- (void)configeCellWithTagModel:(NSString *)model indexPath:(NSIndexPath *)indexPath;

@end
