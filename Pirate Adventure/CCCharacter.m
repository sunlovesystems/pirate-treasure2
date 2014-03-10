//
//  CCCharacter.m
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import "CCCharacter.h"

@implementation CCCharacter

-(id)init
{
    self = [super init];
    if (self) {
        self.health = 100;
        self.damage = 2;
        self.armor = [[CCArmor alloc] init];
        self.weapon = [[CCWeapon alloc] init];
        self.armor.name = @"Shirt";
        self.armor.healthBonus = 0;
        self.weapon.name = @"Fists";
        self.weapon.damage = 2;
    }
    return self;
}

@end
