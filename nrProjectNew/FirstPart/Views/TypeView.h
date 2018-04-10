//
//  TypeView.h
//  nrProjectNew
//
//  Created by 那然 on 2018/4/9.
//  Copyright © 2018年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TypeViewDelegate <NSObject>

- (void)clickBookStore;

@end

@interface TypeView : UIView

@property (nonatomic, assign) id<TypeViewDelegate>delegate;

@end
