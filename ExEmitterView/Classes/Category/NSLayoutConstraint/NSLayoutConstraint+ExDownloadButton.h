//
//  NSLayoutConstraint+ExDownloadButton.h
//  ExEmitterView
//
//  Created by ecarx on 2019/11/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (ExDownloadButton)

+ (NSArray *)constraintsForWrappedSubview:(UIView *)view withInsets:(UIEdgeInsets)insets;
+ (NSArray *)horizontalConstraintsForWrappedSubview:(UIView *)view withInsets:(UIEdgeInsets)insets;
+ (NSArray *)verticalConstraintsForWrappedSubview:(UIView *)view withInsets:(UIEdgeInsets)insets;
+ (NSLayoutConstraint *)constraintForView:(UIView *)view withWidth:(CGFloat)width;
+ (NSLayoutConstraint *)constraintForView:(UIView *)view withHeight:(CGFloat)height;
+ (NSArray *)constraintsForView:(UIView *)view withSize:(CGSize)size;
+ (NSArray *)constraintsWithVisualFormat:(NSString *)format views:(NSDictionary *)views;
+ (NSLayoutConstraint *)constraintForCenterByYView:(UIView *)overlay withView:(UIView *)view;
+ (NSLayoutConstraint *)constraintForCenterByXView:(UIView *)overlay withView:(UIView *)view;
// Constraints for center view above it's superview
+ (NSArray *)constraintsForCenterView:(UIView *)overlay;
+ (NSArray *)constraintsForCenterView:(UIView *)overlay withView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
