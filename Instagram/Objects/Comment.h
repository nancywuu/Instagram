//
//  Comment.h
//  Instagram
//
//  Created by Nancy Wu on 6/30/22.
//

#import <Parse/Parse.h>
#import <Foundation/Foundation.h>
#import "InstaUser.h"
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comment : PFObject<PFSubclassing>
@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) InstaUser *author;

+ (void) postComment: ( NSString * _Nullable )post withUser: ( InstaUser * _Nullable )user withText: ( NSString * _Nullable )text withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end

NS_ASSUME_NONNULL_END
