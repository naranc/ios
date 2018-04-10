//
//  TagsCollectionViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/9.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TagModel;
@interface TagsCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) ImageTextButton * tagButton;

@property (nonatomic, copy) void(^onClickTagButton)(NSInteger tag);

- (void)configeCellWithTagModel:(TagModel *)model indexPath:(NSIndexPath *)indexPath;

@end
