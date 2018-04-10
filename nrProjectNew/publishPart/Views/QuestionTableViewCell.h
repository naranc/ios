//
//  QuestionTableViewCell.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/25.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Answer;
@protocol QuestionTableViewCellDelegate <NSObject>

- (void)selectAnswerWithIndexPath:(NSIndexPath *)indexPath;

@end

@interface QuestionTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton * answerButton;

@property (nonatomic, assign) id<QuestionTableViewCellDelegate>delegate;

- (void)setAnswerButtonText:(Answer *)answer indexPath:(NSIndexPath *)indexPath;

@end
