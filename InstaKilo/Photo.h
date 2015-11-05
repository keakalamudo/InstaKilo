//
//  Photo.h
//  InstaKilo
//
//  Created by Kelo Akalamudo on 11/4/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Photo : NSObject

@property (nonatomic) UIImage* image;
@property (nonatomic) NSString* name;
@property (nonatomic) NSString* location;
@property (nonatomic) NSString* subject;


-(instancetype)initWithName:(NSString*)name Location:(NSString*)location Subject:(NSString*)subject Image:(UIImage*)image;

@end
