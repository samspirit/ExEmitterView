//
//  UIImage+ExDownloadButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ExDownloadButton)

+ (UIImage *)stopImageOfSize:(CGFloat)size color:(UIColor *)color;

+ (UIImage *)borderedImageWithFillColor:(UIColor *)fillColor radius:(CGFloat)radius lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth;
@end

NS_ASSUME_NONNULL_END
