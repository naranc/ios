//
//  PersonalTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/20.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol PersonalTableViewCellDelegate <NSObject>

- (void)clickWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface PersonalTableViewCell : UITableViewCell

@property (nonatomic, assign) id<PersonalTableViewCellDelegate>delegate;

@end
