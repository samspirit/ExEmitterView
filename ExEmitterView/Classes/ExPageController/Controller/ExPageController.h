//
//  ExPageController.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <UIKit/UIKit.h>
#import "ExPageParam.h"

NS_ASSUME_NONNULL_BEGIN

@class ExPageParam;
@interface ExPageController : UIViewController

@property(nonatomic,strong) ExPageParam *param;
/// 更新
- (void)updatePageController;
@end

NS_ASSUME_NONNULL_END
