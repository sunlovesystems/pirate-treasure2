//
//  CCBoss.m
//  Pirate Adventure
//
//  Created by Transcend on 2/23/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import "CCBoss.h"

@implementation CCBoss

-(id)init
{
    self = [super init];
    if (self) {
        self.health = 225;
        self.damage = 25;
    }
    return self;
}

@end
