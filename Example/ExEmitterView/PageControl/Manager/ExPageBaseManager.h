//
//  ExPageBaseManager.h
//  ExEmitterView_Example
//
//  Created by ecarx on 2019/11/12.
//  Copyright © 2019 11873288@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExShowPageViewController.h"
#import <ExEmitterView/ExEmitterView.h>

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

NS_ASSUME_NONNULL_BEGIN

@interface ExPageBaseManager : NSObject

- (void)pushWithViewController:(UIViewController *)viewController withIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
