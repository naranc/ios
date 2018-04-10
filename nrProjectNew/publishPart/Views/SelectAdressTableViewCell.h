//
//  SelectAdressTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/6.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AdressModel;
@interface SelectAdressTableViewCell : UITableViewCell

- (id)initWithNullAdressStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

- (void)configCellWithModel:(AdressModel *)model indexPath:(NSIndexPath *)indexPath;

@end
