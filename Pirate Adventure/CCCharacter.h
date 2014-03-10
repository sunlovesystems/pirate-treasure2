//
//  CCCharacter.h
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCArmor.h"
#import "CCWeapon.h"

@interface CCCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic, strong) CCArmor *armor;
@property (nonatomic, strong) CCWeapon *weapon;

@end
