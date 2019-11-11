//
//  UIImage+ExDownloadButton.m
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import "UIImage+ExDownloadButton.h"

@implementation UIImage (ExDownloadButton)

+ (UIImage *)stopImageOfSize:(CGFloat)size color:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(size, size), NO, 1.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setStroke];
    CGRect stopImageRect = CGRectMake(0.f, 0.f, size, size);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextAddRect(context, stopImageRect);
    CGContextFillRect(context, stopImageRect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)borderedImageWithFillColor:(UIColor *)fillColor radius:(CGFloat)radius lineColor:(UIColor *)lineColor lineWidth:(CGFloat)lineWidth
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(radius * 2, radius * 2), NO, 0.0f);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(lineWidth,lineWidth,(radius - lineWidth) * 2, (radius - lineWidth) * 2) cornerRadius:radius];
    bezierPath.lineWidth = lineWidth;

    if (lineColor) [lineColor setStroke];
    if (fillColor) [fillColor setFill];

    [bezierPath stroke];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(radius, radius, radius, radius)];
}
@end
