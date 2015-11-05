//
//  ViewController.m
//  InstaKilo
//
//  Created by Kelo Akalamudo on 11/4/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "ViewController.h"
#import "HeaderCollectionReusableView.h"
#import "Photo.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>
{
//    NSArray *imageArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) NSMutableDictionary *layoutType;
@property (nonatomic) NSMutableDictionary *photoLocations;
@property (nonatomic) NSMutableDictionary *photoSubjects;
@property (nonatomic) NSArray *imageArray;
@property (nonatomic) BOOL viewValue;
@property (weak, nonatomic) IBOutlet UISegmentedControl *layoutControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _layoutType = [[NSMutableDictionary alloc]init];
    
    Photo *photo1 = [[Photo alloc] initWithName:@"Phonagotchi" Location:@"Vancouver" Subject:@"Screenshot" Image:[UIImage imageNamed:@"IMG_2307.PNG"]];
    Photo *photo2 = [[Photo alloc] initWithName:@"Hotpot" Location:@"Whistler" Subject:@"Meal" Image:[UIImage imageNamed:@"IMG_2314.JPG"]];
    Photo *photo3 = [[Photo alloc] initWithName:@"Snowy Peaks" Location:@"Whistler" Subject:@"Mountain" Image:[UIImage imageNamed:@"IMG_2318.JPG"]];
    Photo *photo4 = [[Photo alloc] initWithName:@"Snowy Peaks2" Location:@"Squamish" Subject:@"River" Image:[UIImage imageNamed:@"IMG_2323.JPG"]];
    Photo *photo5 = [[Photo alloc] initWithName:@"Headband" Location:@"Whistler" Subject:@"Clothes" Image:[UIImage imageNamed:@"IMG_2319.JPG"]];
    Photo *photo6 = [[Photo alloc] initWithName:@"Whistler Village" Location:@"Whistler" Subject:@"Tourism" Image:[UIImage imageNamed:@"IMG_2317.JPG"]];
    Photo *photo7 = [[Photo alloc] initWithName:@"Squamish River" Location:@"Whistler" Subject:@"Tourism" Image:[UIImage imageNamed:@"IMG_2320.JPG"]];
    Photo *photo8 = [[Photo alloc] initWithName:@"Squamish River2" Location:@"Squamish" Subject:@"Tourism" Image:[UIImage imageNamed:@"IMG_2327.JPG"]];
    Photo *photo9 = [[Photo alloc] initWithName:@"Halloween" Location:@"Vancouver" Subject:@"School" Image:[UIImage imageNamed:@"IMG_2333.JPG"]];
    Photo *photo10 = [[Photo alloc] initWithName:@"Cycle" Location:@"Vancouver" Subject:@"Happy Place" Image:[UIImage imageNamed:@"IMG_2342.JPG"]];
    self.imageArray = @[photo1, photo2, photo3, photo4, photo5, photo6, photo7, photo8, photo9, photo10];
    
    [self filterBySubject];
    [self filterByLocation];
    
    self.layoutType = self.photoLocations;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)filterByLocation{
    self.photoLocations = [NSMutableDictionary dictionary];
    for (Photo *photos in self.imageArray){
        NSMutableArray *currPhotos = [self.photoLocations[photos.location] mutableCopy];
        
        if (!currPhotos) {
            currPhotos = [NSMutableArray array];
        }
        
        [currPhotos addObject:photos];
        self.photoLocations[photos.location] = currPhotos;
    }
}

-(void)filterBySubject{
    self.photoSubjects = [NSMutableDictionary dictionary];
    for (Photo *photos in self.imageArray){
        NSMutableArray *currPhotos = [self.photoSubjects[photos.subject] mutableCopy];
        
        if (!currPhotos) {
            currPhotos = [NSMutableArray array];
        }
        
        [currPhotos addObject:photos];
        self.photoSubjects[photos.subject] = currPhotos;
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.layoutType.allKeys.count;
}

//Sets the number of the items in section to number of images in the image array.
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return  [[self.layoutType allValues][section] count];
}


- (IBAction)layoutChanged:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.layoutType= self.photoLocations;
                break;
        case 1: self.layoutType= self.photoSubjects;
                break;
        default:break;
    }
    [self.collectionView reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIImageView *cellImageView = (UIImageView *)[cell viewWithTag:100];
    Photo *photo = [self.layoutType allValues][indexPath.section][indexPath.item];
    cellImageView.image = photo.image;

    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HeaderCollectionReusableView *sectionHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    NSArray* title = self.layoutType.allKeys;
    sectionHeader.sectionTitleLabel.text = title[indexPath.section];
    

    return sectionHeader;
    
    
}


@end
// 