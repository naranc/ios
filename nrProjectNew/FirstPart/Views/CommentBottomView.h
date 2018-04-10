//
//  CommentBottomView.h
//  naran
//
//  Created by 那然 on 2017/4/14.
//  Copyright © 2017年 那然. All rights reserved.
//


#import <UIKit/UIKit.h>

//@protocol CommentBottomViewDelegate <NSObject>
//
//- (void)commentViewOpertion:(NSInteger)opertion;
//
//@end


@interface CommentBottomView : UIView

- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray;

@property (strong, nonatomic) ImageTextButton * leftButton;

@property (strong, nonatomic) ImageTextButton * centerButton;

@property (strong, nonatomic) ImageTextButton * rightButton;

@property (assign, nonatomic) NSInteger leftCount;

@property (assign, nonatomic) NSInteger centerCount;

@property (assign, nonatomic) NSInteger rightCount;

@property (strong, nonatomic) NSString *leftImageStr;

@property (strong, nonatomic) NSString *centerImageStr;

@property (strong, nonatomic) NSString *rightImageStr;

//@property (weak, nonatomic) id<CommentBottomViewDelegate>delegate;

@property (nonatomic, copy) void(^onClickShareButton)(void);

@property (nonatomic, copy) void(^onClickCollectButton)(void);

@property (nonatomic, copy) void(^onClickCommentButton)(void);


@end
