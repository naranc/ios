//
//  HelpProtocolTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/16.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProtocolViewDelegate <NSObject>

- (void)pushWebView;

@end


@interface HelpProtocolTableViewCell : UITableViewCell

- (id)initWithFrame:(CGRect)frame text:(NSString *)text;

@property (strong, nonatomic) UIButton *imageButton;

@property (assign, nonatomic) id<ProtocolViewDelegate>delegate;
@end
