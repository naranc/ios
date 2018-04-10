//
//  CollectionTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/19.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CollectionTableViewCelllDelegate <NSObject>

- (void)clickType:(NSIndexPath *)indexPath;

@end

@interface CollectionTableViewCell : UITableViewCell

@property (nonatomic, assign) id<CollectionTableViewCelllDelegate>delegate;

@end
