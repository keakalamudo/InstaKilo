//
//  Photo.m
//  InstaKilo
//
//  Created by Kelo Akalamudo on 11/4/15.
//  Copyright © 2015 Kelo. All rights reserved.
//

#import "Photo.h"

@implementation Photo

-(instancetype)initWithName:(NSString *)name Location:(NSString *)location Subject:(NSString *)subject Image:(UIImage *)image{
    self = [super init];
    if (self) {
        _name = name;
        _location = location;
        _subject = subject;
        _image = image;
        
    }
    return self;
}

@end
