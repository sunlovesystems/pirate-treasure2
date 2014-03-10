//
//  CCViewController.h
//  Pirate Adventure
//
//  Created by Transcend on 2/21/14.
//  Copyright (c) 2014 Code Coalition Project. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCharacter.h"
#import "CCTile.h"
#import "CCBoss.h"

@interface CCViewController : UIViewController

@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) NSArray *tilesArray;
@property (nonatomic, strong) CCTile *currentTile;
@property (nonatomic, strong) CCCharacter *character;
@property (nonatomic, strong) CCBoss *boss;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIButton *actionButtonName;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

-(void)isButtonHidden;
-(void)updateTiles;
- (IBAction)buttonPressedNorth:(UIButton *)sender;
- (IBAction)buttonPressedEast:(UIButton *)sender;
- (IBAction)buttonPressedSouth:(UIButton *)sender;
- (IBAction)buttonPressedWest:(UIButton *)sender;
- (IBAction)buttonPressedAction:(UIButton *)sender;
- (IBAction)buttonPressedReset:(UIButton *)sender;

@end
