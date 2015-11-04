//
//  ViewController.m
//  InstaKilo
//
//  Created by Kelo Akalamudo on 11/4/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *imageArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.\
    
    imageArray = [NSArray arrayWithObjects:@"IMG_2307.PNG",@"IMG_2314.JPG",@"IMG_2318.JPG",@"IMG_2323.JPG",@"IMG_2319.JPG",@"IMG_2317.JPG",@"IMG_2320.JPG",@"IMG_2327.JPG",@"IMG_2333.JPG",@"IMG_2342.JPG", nil];
//                  rrayWithObjects:@"IMG_2307.PNG","IMG_2314.JPG","IMG_2318.JPG","IMG_2323.JPG","IMG_2319.JPG","IMG_2317.JPG","IMG_2320.JPG","IMG_2327.JPG","IMG_2331-1.JPG","IMG_2342.JPG", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Sets the number of the items in section to number of images in the image array.
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return imageArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *cellImageView = (UIImageView *)[cell viewWithTag:100];
    cellImageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
