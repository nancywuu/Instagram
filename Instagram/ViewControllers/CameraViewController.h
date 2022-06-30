//
//  CameraViewController.h
//  Instagram
//
//  Created by Nancy Wu on 6/30/22.
//

#import <UIKit/UIKit.h>
#import "AVFoundation/AVFoundation.h"

NS_ASSUME_NONNULL_BEGIN

@interface CameraViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIImageView *captureImageView;

@end

NS_ASSUME_NONNULL_END
