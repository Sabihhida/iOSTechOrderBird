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
@interface ViewController ()
@property (nonatomic, readwrite) NSArray *photos;
@end

@implementation ViewController

- (void)viewDidLoad {
    [self loadFlickrPhotos:nil];
    self.title = @"List";
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CustomCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

//TableViewDatasource

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    FlickrListHeader *headerView = (FlickrListHeader*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"FlickrListHeader"];
    if (!headerView) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"FlickrListHeader" owner:nil options:nil];
        headerView = [nibArray lastObject];
    }
    headerView.delegate = self;
    return headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  44.0;
}

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

- (void)loadFlickrPhotos:(NSDictionary*)optional {
    
    __weak ViewController *weakSelf = self;
    [[Network sharedManager] getFlickrListWithTag:@"cooking" pages:@"10" optional:optional completionHandler:^( id _Nonnull res) {
        weakSelf.photos = [[res objectForKey:@"photos"] objectForKey:@"photo"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } failureHandller:^(NSString * _Nonnull __strong message) {
        [weakSelf showAlertWithController:weakSelf msg:message completion:nil];
    }];
   
}

-(void)clickSort:(NSString *)sort {
    [self loadFlickrPhotos:@{@"sort":sort,@"geo_context":@"1"}];
}

@end
