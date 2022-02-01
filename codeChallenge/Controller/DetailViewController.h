//
//  DetailViewController.h
//  codeChallenge
//
//  Created by Sabih Hida Tahir on 01/02/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *detailTextView;
@property (strong, nonatomic) NSDictionary *photo;
@end

NS_ASSUME_NONNULL_END
