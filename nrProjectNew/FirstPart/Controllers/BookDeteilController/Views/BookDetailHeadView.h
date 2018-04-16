//
//  BookDetailHeadView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/13.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookIntroView.h"

@interface BookDetailHeadView : UIView<UITableViewDelegate, UITableViewDataSource>

{
    CGFloat cellHeight;
    NSString * introStr;
}
@property (nonatomic, strong) UITableView *bookTopTableView;


@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) BookIntroView * bookIntroView;

@end
