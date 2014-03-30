//
//  SpaceshipScene.m
//  SpriteWalkthrough
//
//  Created by Tom on 3/29/14.
//  Copyright (c) 2014 The Big Round Mud. All rights reserved.
//

#import "SpaceshipScene.h"

@interface SpaceshipScene()
@property BOOL contentCreated;
@end

@implementation SpaceshipScene

#pragma mark [inheritance methods]
-(void)didMoveToView:(SKView *)view
{
    if(!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

-(void)didSimulatePhysics
{
    [self enumerateChildNodesWithName:@"rock" usingBlock:^(SKNode *node, BOOL *stop){
       if(node.position.y < 0)
       {
           [node removeFromParent];
       }
    }];
}


/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark [private helper methods]
-(void)createSceneContents
{
    // Set scene environment
    self.backgroundColor = [SKColor blackColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    
    // Create a spaceship
    //SKSpriteNode *spaceship = [self newSpaceship];
    //spaceship.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 150);
    
    //[self addChild:spaceship];
    
    
    // Add spaceship by SkTexture
    SKTexture *rocketTexture = [SKTexture textureWithImageNamed:@"rocket.png"];
    for(int i=0; i<10; i++)
    {
        SKSpriteNode *rocket = [SKSpriteNode spriteNodeWithTexture:rocketTexture];
        rocket.position = [self randomRocketLocation];
        [self addChild:rocket];
    }
    
    // Create rocks by actions
    SKAction *makeRocks = [SKAction sequence:@[
                                [SKAction performSelector:@selector(addRock) onTarget:self],
                                [SKAction waitForDuration:0.10 withRange:0.15]]];
    [self runAction:[SKAction repeatActionForever:makeRocks]];
}


static inline CGFloat skRandf()
{
    return rand()/(CGFloat)RAND_MAX;
}
static inline CGFloat skRand(CGFloat low, CGFloat high)
{
    return skRandf() * (high - low) + low;
}
-(void)addRock
{
    SKSpriteNode *rock = [[SKSpriteNode alloc]initWithColor:[SKColor brownColor] size:CGSizeMake(8, 8)];
    rock.position = CGPointMake(skRand(0, self.size.width), self.size.height - 50);
    rock.name = @"rock";
    rock.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rock.size];
    rock.physicsBody.usesPreciseCollisionDetection = YES;
        
    [self addChild:rock];
}
-(CGPoint) randomRocketLocation
{
    CGPoint p = CGPointMake(skRand(0, self.size.width), skRand(0, self.size.height));
    return p;
}


-(SKSpriteNode *)newSpaceship
{
    //SKSpriteNode *hull = [[SKSpriteNode alloc]initWithColor:[SKColor grayColor] size:CGSizeMake(64, 32)];
    SKSpriteNode *hull = [SKSpriteNode spriteNodeWithImageNamed:@"rocket.png"];
    //hull.anchorPoint = CGPointMake(0.5, 1.0);
    
    // Lights
    SKSpriteNode *light1 = [self newLight];
    light1.position = CGPointMake(-28.0, 6.0);
    [hull addChild:light1];
    
    SKSpriteNode *light2 = [self newLight];
    light2.position = CGPointMake(28.0, 6.0);
    [hull addChild:light2];
    
    // Actions move
    SKAction *hover = [SKAction sequence:@[
                            [SKAction waitForDuration:1.0],
                            [SKAction moveByX:100 y:50 duration:1.0],
                            [SKAction waitForDuration:1.0],
                            [SKAction moveByX:-100 y:-50 duration:1.0]]];
    [hull runAction:[SKAction repeatActionForever:hover]];
    
    // Action color blend
    SKAction *pulseRed = [SKAction sequence:@[
                            [SKAction colorizeWithColor:[SKColor redColor] colorBlendFactor:1.0 duration:0.15],
                            [SKAction waitForDuration:0.1],
                            [SKAction colorizeWithColorBlendFactor:0.0 duration:0.15]]];
    [hull runAction: [SKAction repeatActionForever:pulseRed]];
    
    // Physics
    hull.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:hull.size];
    hull.physicsBody.dynamic = NO;
    
    return hull;
}

-(SKSpriteNode *)newLight
{
    SKSpriteNode *light = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(8, 8)];
    
    SKAction *blink = [SKAction sequence:@[
                            [SKAction fadeOutWithDuration:0.25],
                            [SKAction fadeInWithDuration:0.25]]];
    SKAction *blinkForever = [SKAction repeatActionForever:blink];
    [light runAction:blinkForever];
    return light;
}
@end
