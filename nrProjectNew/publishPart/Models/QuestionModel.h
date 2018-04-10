//
//  QuestionModel.h
//  nrProjectNew
//
//  Created by 那然 on 2017/12/25.
//  Copyright © 2017年 by Bo. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface QuestionModel : NSObject

//@property (nonatomic, strong) NSString * questionTitle;

//@property (nonatomic, strong) NSArray * questionAnswers;


//字段
@property (nonatomic, strong) NSString * orderType;

@property (nonatomic, strong) NSString * questionnaireContent;

@property (nonatomic, strong) NSNumber * questionnaireId;

@property (nonatomic, strong) NSNumber * questionnaireOrder;

@property (nonatomic, assign) BOOL questionnaireRequired;

@property (nonatomic, strong) NSArray * options;

@end


@interface Answer : NSObject

//@property (nonatomic, strong) NSString * answerText;

//@property (nonatomic, strong) NSString * subAnswerText;

@property (nonatomic, assign) BOOL answerIsSelect;

//字段
@property (nonatomic, strong) NSString * optionContent;

@property (nonatomic, strong) NSNumber * optionId;

@property (nonatomic, strong) NSNumber * optionOrder;

@property (nonatomic, strong) NSString * optionTitle;

@property (nonatomic, strong) NSNumber * questionnaireId;

@end
