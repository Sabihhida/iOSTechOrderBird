//
//  ViewController.m
//  codeChallenge
//
//  Created by Nano Suarez on 18/04/2018.
//  Copyright © 2018 Fernando Suárez. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
//https://www.flickr.com/services/api/flickr.photos.search.html
//https://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key=2ed35a9f4fda03bc96e73dbd03602780&photo_id=51854267235&format=json&nojsoncallback=1

@interface ViewController ()
@property (nonatomic, readwrite) NSArray *photos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [self loadFlickrPhotos];
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CustomCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

//TableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CustomCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [cell setData:_photos[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self navigateDetailWithPhoto:[self.photos objectAtIndex:indexPath.row]];
}

- (void)loadFlickrPhotos {
        
    __weak ViewController *weakSelf = self;
    [[Network sharedManager] getFlickrListWithTag:@"cooking" pages:@"10" sorted:true completionHandler:^( id _Nonnull res) {
        weakSelf.photos = [[res objectForKey:@"photos"] objectForKey:@"photo"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });

    }];
}



@end
