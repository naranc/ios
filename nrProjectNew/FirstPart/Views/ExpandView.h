//
//  ExpandView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/15.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandView : UIView

@property (nonatomic, copy) void(^onClickShareButton)(void);

@property (nonatomic, copy) void(^onClickCollectButton)(void);

@property (nonatomic, copy) void(^onClickCommentButton)(void);

@end
