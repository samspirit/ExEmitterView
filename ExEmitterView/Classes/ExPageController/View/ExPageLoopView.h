//
//  ExPageLoopView.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>
#import "ExPageNavigationButton.h"
#import "ExPageParam.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ExPageLoopDelegate <NSObject>
@optional
- (void)selectWithBtn:(UIButton*)btn first:(BOOL)first;
@end

@interface ExPageLoopView : UIView

@property(nonatomic,strong)UIScrollView *mainView;

@property(nonatomic,strong)UIButton *lineView;

@property(nonatomic,strong)NSMutableArray *btnArr;

@property(nonatomic,weak)id <ExPageLoopDelegate> loopDelegate;

- (instancetype)initWithFrame:(CGRect)frame param:(ExPageParam *)param;

- (void)scrollToIndex:(NSInteger)newIndex;

@end

NS_ASSUME_NONNULL_END
