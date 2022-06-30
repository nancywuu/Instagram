//
//  Post.m
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//
//  Post.m
#import "Post.h"
@implementation Post
    
@dynamic postID;
@dynamic userID;
@dynamic author;
@dynamic caption;
@dynamic image;
@dynamic likeCount;
@dynamic commentCount;
@dynamic createdAt;


+ (nonnull NSString *)parseClassName {
    return @"Post";
}

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Post *newPost = [Post new];
    newPost.image = [self getPFFileFromImage:image];
    newPost.author = [InstaUser currentUser];
    newPost.caption = caption;
    newPost.likeCount = @(0);
    newPost.commentCount = @(0);
    
    [newPost saveInBackgroundWithBlock: completion];
}

+ (void) favorite: (Post * _Nullable)post withValue: ( NSNumber * _Nullable )value withCompletion: (PFBooleanResultBlock _Nullable)completion {
    
    Post *temp = post;
    temp.likeCount = value;
    [temp saveInBackgroundWithBlock: completion];
}

+ (void) comment: (Post * _Nullable)post withValue: ( NSNumber * _Nullable )value withCompletion: (PFBooleanResultBlock _Nullable)completion {
    
    Post *temp = post;
    temp.commentCount = value;
    [temp saveInBackgroundWithBlock: completion];
}

+ (PFFileObject * )getPFFileFromImage: (UIImage * _Nullable)image {
 
    // check if image is not nil
    if (!image) {
        return nil;
    }
    
    NSData *imageData = UIImagePNGRepresentation(image);
    // get image data and check if that is not nil
    if (!imageData) {
        return nil;
    }
    
    return [PFFileObject fileObjectWithName:@"image.png" data:imageData];
}

@end
