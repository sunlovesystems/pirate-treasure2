//
//  CCFactory.h
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTile.h"
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject

-(NSArray *)createTwelveTileArray;
-(CCCharacter *)character;
-(CCBoss *)boss;

@end
