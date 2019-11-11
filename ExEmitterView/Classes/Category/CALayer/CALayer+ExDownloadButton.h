//
//  CALayer+PKDownloadButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (ExDownloadButton)
- (void)addRotationAnimationWithKey:(NSString *)animationKey fullRotationDuration:(NSTimeInterval)fullRotationDuration;
- (void)removeRotationAnimationWithKey:(NSString *)animationKey;
- (void)removeRotationAnimationWithKey:(NSString *)animationKey fullRotationDuration:(NSTimeInterval)fullRotationDuration;
@end

NS_ASSUME_NONNULL_END
