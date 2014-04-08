//
//  CCFactory.m
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"

@implementation CCFactory

-(NSArray *)createTwelveTileArray
{
    CCTile *firstTile = [[CCTile alloc] init];
    firstTile.story = @"Swashbuckling derring-do! Adventure calls! But you are defenseless. You'll need to find some heavy weaponry first. A small silver dagger lies on the ground.";
    firstTile.actionButtonName = @"Pick up dagger";
    firstTile.background = [UIImage imageNamed:@"PirateStart.jpg"];
    firstTile.weapon = [[CCWeapon alloc] init];
    firstTile.weapon.name = @"Small Silver Dagger";
    firstTile.weapon.damage = 4;
    firstTile.currentPoint = CGPointMake (0,0);
    
    CCTile *secondTile = [[CCTile alloc] init];
    secondTile.story = @"Silver seaweed hangs from the ceiling of a damp cave. In the distance, ocean waves echo. A small, drunk pirate sprawls on the ground, leering at you.";
    secondTile.actionButtonName = @"Attack pirate";
    secondTile.background = [UIImage imageNamed:@"PirateAttack.jpg"];
    secondTile.health = -5;
    secondTile.currentPoint = CGPointMake (0,1);
    
    CCTile *thirdTile = [[CCTile alloc] init];
    thirdTile.story = @"Ocean waves break against the shore, and a small ship rocks against a quay. A leather vest lies abandoned on the dock.";
    thirdTile.actionButtonName = @"Take leather vest";
    thirdTile.background = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    thirdTile.armor = [[CCArmor alloc] init];
    thirdTile.armor.name = @"Leather Vest";
    thirdTile.armor.healthBonus = 15;
    thirdTile.currentPoint = CGPointMake (0,2);
    
    CCTile *fourthTile = [[CCTile alloc] init];
    fourthTile.story = @"A colorful parrot sits atop a chainmail tunic. 'Don't steal my tunic!' it squawks.";
    fourthTile.actionButtonName = @"Steal tunic";
    fourthTile.background = [UIImage imageNamed:@"PirateParrot.jpg"];
    fourthTile.armor = [[CCArmor alloc] init];
    fourthTile.armor.name = @"Chainmail Tunic";
    fourthTile.armor.healthBonus = 40;
    fourthTile.currentPoint = CGPointMake (1,0);
    
    CCTile *fifthTile = [[CCTile alloc] init];
    fifthTile.story = @"A pirate blacksmith hammers molten steel in his forge here. A curved scimitar rests just outside the forge door, sparkling in the sun.";
    fifthTile.actionButtonName = @"Take scimitar";
    fifthTile.background = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    fifthTile.weapon = [[CCWeapon alloc] init];
    fifthTile.weapon.name = @"Curved Scimitar";
    fifthTile.weapon.damage = 35;
    fifthTile.currentPoint = CGPointMake (1,1);
    
    CCTile *sixthTile = [[CCTile alloc] init];
    sixthTile.story = @"A huge octopus curls its tentacles around the pilings of the dock. Are you ready to fight it?";
    sixthTile.actionButtonName = @"Fight octopus";
    sixthTile.background = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    sixthTile.health = -45;
    sixthTile.currentPoint = CGPointMake (1,2);
    
    CCTile *seventhTile = [[CCTile alloc] init];
    seventhTile.story = @"A pile of gold is here, along with some odds and ends and a small red potion.";
    seventhTile.actionButtonName = @"Drink red potion";
    seventhTile.background = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    seventhTile.health = -50;
    seventhTile.currentPoint = CGPointMake (2,0);
    
    CCTile *eighthTile = [[CCTile alloc] init];
    eighthTile.story = @"Pirate treasure is here. Amid the sparkling gold you notice a small green potion.";
    eighthTile.actionButtonName = @"Drink green potion";
    eighthTile.background = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    eighthTile.health = 100;
    eighthTile.currentPoint = CGPointMake (2,1);
    
    CCTile *ninthTile = [[CCTile alloc] init];
    ninthTile.story = @"A huge pirate ship rests at the dock, swarming with pirates. Think twice before attacking!";
    ninthTile.actionButtonName = @"Attack pirates";
    ninthTile.background = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    ninthTile.health = -50;
    ninthTile.currentPoint = CGPointMake (2,2);
    
    CCTile *tenthTile = [[CCTile alloc] init];
    tenthTile.story = @"A dark cave angles into the ground here, leading toward a distant sound of shouting. A pile of weapons is on the ground, including a brilliant sword.";
    tenthTile.actionButtonName = @"Take brilliant sword";
    tenthTile.background = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tenthTile.weapon = [[CCWeapon alloc] init];
    tenthTile.weapon.name = @"Brilliant Sword";
    tenthTile.weapon.damage = 75;
    tenthTile.currentPoint = CGPointMake (3,0);
    
    CCTile *eleventhTile = [[CCTile alloc] init];
    eleventhTile.story = @"A huge pirate blocks your way, telling you to walk the plank. The plank doesn't look very inviting.";
    eleventhTile.actionButtonName = @"Attack pirate";
    eleventhTile.background = [UIImage imageNamed:@"PiratePlank.jpg"];
    eleventhTile.health = -50;
    eleventhTile.currentPoint = CGPointMake (3,1);
    
    CCTile *twelfthTile = [[CCTile alloc] init];
    twelfthTile.story = @"The pirate boss towers over you, laughing. 'No one passes me!' he roars.";
    twelfthTile.actionButtonName = @"Duel!";
    twelfthTile.background = [UIImage imageNamed:@"PirateBoss.jpeg"];
    twelfthTile.boss = [[CCBoss alloc] init];
    twelfthTile.currentPoint = CGPointMake (3,2);
    
    NSArray *totalArray = [[NSArray alloc] initWithObjects:firstTile, secondTile, thirdTile, fourthTile, fifthTile, sixthTile, seventhTile, eighthTile, ninthTile, tenthTile, eleventhTile, twelfthTile, nil];
    return totalArray;
}

-(CCCharacter *)character
{
    CCCharacter *character = [[CCCharacter alloc] init];
    return character;
}

-(CCBoss *)boss
{
    CCBoss *boss = [[CCBoss alloc] init];
    return boss;
}

@end
