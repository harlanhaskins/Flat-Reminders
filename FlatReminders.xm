@interface UIImage(Color)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

@implementation UIImage(Color)

+ (UIImage*) imageWithColor:(UIColor*)color {
    return [UIImage imageWithColor:color size:CGSizeMake(1,1)];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {

    CGRect rect = CGRectMake(0,0,0,0);
    rect.size = size;

    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;

}

@end

@interface RemindersScrollingBackgroundView : UIView

+ (UIImage*) kitPaperTextureImage;

@end

%hook RemindersScrollingBackgroundView

+ (UIImage*) kitPaperTextureImage {
    return [UIImage imageWithColor:[UIColor whiteColor]];
}

- (UIImage*) textureImage {
    return [[self class] kitPaperTextureImage];
}

%end

%hook RemindersColor

+ (id)filledPressedLetterpressedCircleWithOutlineOfColor:(id)arg1 {
    id circle = %orig(arg1);
    
    %log(circle);
    
    return circle;
}

%end

%hook RemindersCheckboxView

- (UIImage*) flatUncompletedImageForColor:(UIColor*)color {
    UIImage *image = %orig(color);
    %log(image);
    return image;
}

%end
