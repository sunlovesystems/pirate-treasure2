//
//  CCTile.h
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCArmor.h"
#import "CCWeapon.h"
#import "CCBoss.h"

@interface CCTile : NSObject

@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) UIImage *background;
@property (nonatomic, strong) NSString *actionButtonName;
@property (nonatomic, strong) CCArmor *armor;
@property (nonatomic, strong) CCWeapon *weapon;
@property (nonatomic) int health;
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) CCBoss *boss;

@end
