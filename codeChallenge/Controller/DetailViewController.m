//
//  DetailViewController.m
//  codeChallenge
//
//  Created by Sabih Hida Tahir on 01/02/2022.
//  Copyright © 2022 Fernando Suárez. All rights reserved.
//

#import "DetailViewController.h"
#import "codeChallenge-Swift.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInterface];
   
    // Do any additional setup after loading the view.
}
-(void)setInterface {
    [self.imageView imageFromServerURLWithUrlString:self.photo[@"url_m"] PlaceHolderImage:[UIImage imageNamed:@"defaultPhoto"] completion:^(UIImage * _Nonnull image) {
        self.imageView.image = image;
    }];
    self.titleLabel.text = self.photo[@"title"];
    self.detailTextView.text = self.photo[@"description"][@"_content"];
}

@end
