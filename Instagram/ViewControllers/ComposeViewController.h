//
//  ComposeViewController.h
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ComposeViewControllerDelegate
- (void)didPost;
@end

@interface ComposeViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, weak) id<ComposeViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView *captionField;
@property (weak, nonatomic) IBOutlet UIImageView *displayImage;

@end

NS_ASSUME_NONNULL_END
