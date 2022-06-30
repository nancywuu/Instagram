//
//  Post.h
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"
#import "InstaUser.h"
@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) InstaUser *author;

@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFileObject *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

+ (void) favorite: (Post * _Nullable)post withValue: ( NSNumber * _Nullable )value withCompletion: (PFBooleanResultBlock _Nullable)completion;

+ (void) comment: (Post * _Nullable)post withValue: ( NSNumber * _Nullable )value withCompletion: (PFBooleanResultBlock _Nullable)completion;

@end
