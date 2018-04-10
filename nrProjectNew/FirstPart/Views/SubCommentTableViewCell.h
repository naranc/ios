//
//  SubCommentTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SubComment;
@interface SubCommentTableViewCell : UITableViewCell

- (void)configCommentViewWithSubModel:(SubComment *)subModel indexPath:(NSIndexPath *)indexPath;

@end
