//
//  CCViewController.m
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import "CCViewController.h"
#import "CCFactory.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CCFactory *factory = [[CCFactory alloc] init];
    self.tilesArray = [factory createTwelveTileArray];
    self.currentPoint = CGPointMake(0,0);
    [self updateTiles];
    [self isButtonHidden];
    
    self.character = [factory character];
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)isButtonHidden
{
    if (self.currentPoint.y == 2) {
        self.northButton.hidden = YES;
    } else {
        self.northButton.hidden = NO;
    }
    if (self.currentPoint.x == 3) {
        self.eastButton.hidden = YES;
    } else {
        self.eastButton.hidden = NO;
    }
    if (self.currentPoint.y == 0) {
        self.southButton.hidden = YES;
    } else {
        self.southButton.hidden = NO;
    }
    if (self.currentPoint.x == 0) {
        self.westButton.hidden = YES;
    } else {
        self.westButton.hidden = NO;
    }
}

- (IBAction)buttonPressedNorth:(UIButton *)sender
{
    if (self.currentPoint.y < 2) {
        self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    }
    [self isButtonHidden];
    [self updateTiles];
}

- (IBAction)buttonPressedEast:(UIButton *)sender
{
    if (self.currentPoint.x < 4) {
        self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    }
    [self isButtonHidden];
    [self updateTiles];
}

- (IBAction)buttonPressedSouth:(UIButton *)sender
{
    if (self.currentPoint.y > 0) {
        self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    }
    [self isButtonHidden];
    [self updateTiles];
}

- (IBAction)buttonPressedWest:(UIButton *)sender
{
    if (self.currentPoint.x > 0) {
        self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    }
    [self isButtonHidden];
    [self updateTiles];
}

- (IBAction)buttonPressedAction:(UIButton *)sender
{
    if (self.currentTile.weapon) {
        self.character.damage = self.character.damage - self.character.weapon.damage + self.currentTile.weapon.damage;
        self.character.weapon = self.currentTile.weapon;
        self.weaponLabel.text = self.character.weapon.name;
        self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    } else if (self.currentTile.armor) {
        self.character.health = self.character.health + self.currentTile.armor.healthBonus - self.character.armor.healthBonus;
        self.character.armor = self.currentTile.armor;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
        self.armorLabel.text = self.character.armor.name;
    } else if (self.currentTile.health) {
        self.character.health = self.character.health + self.currentTile.health;
        self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
        if (self.character.health <= 0) {
            NSLog(@"You have died!");
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oh, no!"
                                                                message:@"You have died; restart the game!"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
            [self viewDidLoad];
        }
    } else if (self.currentTile.boss) {
        while (self.currentTile.boss.health >= 0) {
            self.currentTile.boss.health = self.currentTile.boss.health - self.character.damage;
            NSLog(@"Boss health is now %i", self.currentTile.boss.health);
            sleep(1);
            if (self.currentTile.boss.health <= 0) {
                NSLog(@"Boss has died!");
                self.currentTile.boss = nil;
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ahoy, Victory!"
                                                                    message:@"You have defeated the Pirate Boss! Play again?"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"Ok"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
            self.character.health = self.character.health - self.currentTile.boss.damage;
            self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
            NSLog(@"Self character health is now %i", self.character.health);
            sleep(1);
            if (self.character.health <= 0) {
                NSLog(@"You have died!");
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Arrr!"
                                                                    message:@"You have died; restart the game!"
                                                                   delegate:nil
                                                          cancelButtonTitle:@"Ok"
                                                          otherButtonTitles:nil];
                [alertView show];
                break;
            }
        }
        [self viewDidLoad];
    }
}

- (IBAction)buttonPressedReset:(UIButton *)sender
{
    [self viewDidLoad];
}

// This method needs work; there must be a better way to do this
-(void)updateTiles
{
    if (self.currentPoint.x == 0 && self.currentPoint.y == 0) {
        CCTile *newTile = [self.tilesArray objectAtIndex:0];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 0 && self.currentPoint.y == 1) {
        CCTile *newTile = [self.tilesArray objectAtIndex:1];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 0 && self.currentPoint.y == 2) {
        CCTile *newTile = [self.tilesArray objectAtIndex:2];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 1 && self.currentPoint.y == 0) {
        CCTile *newTile = [self.tilesArray objectAtIndex:3];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 1 && self.currentPoint.y == 1) {
        CCTile *newTile = [self.tilesArray objectAtIndex:4];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 1 && self.currentPoint.y == 2) {
        CCTile *newTile = [self.tilesArray objectAtIndex:5];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 2 && self.currentPoint.y == 0) {
        CCTile *newTile = [self.tilesArray objectAtIndex:6];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 2 && self.currentPoint.y == 1) {
        CCTile *newTile = [self.tilesArray objectAtIndex:7];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 2 && self.currentPoint.y == 2) {
        CCTile *newTile = [self.tilesArray objectAtIndex:8];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 3 && self.currentPoint.y == 0) {
        CCTile *newTile = [self.tilesArray objectAtIndex:9];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 3 && self.currentPoint.y == 1) {
        CCTile *newTile = [self.tilesArray objectAtIndex:10];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else if (self.currentPoint.x == 3 && self.currentPoint.y == 2) {
        CCTile *newTile = [self.tilesArray objectAtIndex:11];
        self.storyLabel.text = newTile.story;
        self.backgroundImage.image = newTile.background;
        [self.actionButtonName setTitle:newTile.actionButtonName forState:UIControlStateNormal];
        self.currentTile = newTile;
    } else {
        NSLog(@"That is not a valid location.");
    }
}

@end
