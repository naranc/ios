//
//  ApproveView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/1/10.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApproveView : UIView

@property (nonatomic, copy) void(^onClickApproveButton)(void);

@property (nonatomic, copy) void(^onClickCloseButton)(void);

@end
