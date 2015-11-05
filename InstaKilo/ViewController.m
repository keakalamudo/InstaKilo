//
//  ViewController.m
//  InstaKilo
//
//  Created by Kelo Akalamudo on 11/4/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "ViewController.h"

#import "Photo.h"

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

    
    Photo *photo1 = [[Photo alloc] initWithName:@"Phonagotchi" Location:@"Vancouver" Subject:@"Screenshot" Image:[UIImage imageNamed:@"IMG_2307.PNG"]];
    
    Photo *photo2 = [[Photo alloc] initWithName:@"Hotpot" Location:@"Whistler" Subject:@"Meal" Image:[UIImage imageNamed:@"IMG_2314.JPG"]];
    
    Photo *photo3 = [[Photo alloc] initWithName:@"Snowy Peaks" Location:@"Whistler" Subject:@"Mountain" Image:[UIImage imageNamed:@"IMG_2318.JPG"]];
    
    Photo *photo4 = [[Photo alloc] initWithName:@"Snowy Peaks2" Location:@"Whistler" Subject:@"Mountain" Image:[UIImage imageNamed:@"IMG_2323.JPG"]];
    
    Photo *photo5 = [[Photo alloc] initWithName:@"Headband" Location:@"Whistler" Subject:@"Clothes" Image:[UIImage imageNamed:@"IMG_2319.JPG"]];
    
    Photo *photo6 = [[Photo alloc] initWithName:@"Whistler Village" Location:@"Whistler" Subject:@"Tourism" Image:[UIImage imageNamed:@"IMG_2317.JPG"]];
    
    Photo *photo7 = [[Photo alloc] initWithName:@"Squamish River" Location:@"Squamish" Subject:@"Tourism" Image:[UIImage imageNamed:@"IMG_2320.JPG"]];
    
    
    Photo *photo8 = [[Photo alloc] initWithName:@"Squamish River2" Location:@"Squamish" Subject:@"Tourism" Image:[UIImage imageNamed:@"IMG_2327.JPG"]];
    
    Photo *photo9 = [[Photo alloc] initWithName:@"Halloween" Location:@"Vancouver" Subject:@"School" Image:[UIImage imageNamed:@"IMG_2333.JPG"]];
    
    Photo *photo10 = [[Photo alloc] initWithName:@"Cycle" Location:@"Vancouver" Subject:@"Happy Place" Image:[UIImage imageNamed:@"IMG_2342.JPG"]];
    
    
    imageArray = [NSArray arrayWithObjects:photo1,photo2,photo3,photo4,photo5,photo6,photo7,photo8,photo9,photo10, nil];

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
    Photo *photo = imageArray[indexPath.row];
    cellImageView.image = photo.image;
    
    return cell;
}

@end
// 