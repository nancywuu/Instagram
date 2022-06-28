//
//  DetailViewController.h
//  Instagram
//
//  Created by Nancy Wu on 6/27/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Post.h"
#import "CommentCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Post *obj;
@end

NS_ASSUME_NONNULL_END
