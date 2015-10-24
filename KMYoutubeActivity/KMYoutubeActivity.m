//
//  KMYoutubeActivity.m
//  onekm
//
//  Created by IM049 on 2015. 10. 21..
//  Copyright © 2015년 ces. All rights reserved.
//

#import "KMYoutubeActivity.h"

//static NSString *YoutubeBaseURL = @"youtube://";
static NSString *YoutubeBaseURL = @"http://www.youtube.com/v/";

@implementation KMYoutubeActivity
{
    NSURL *_URL;
}

- (NSString *)activityType
{
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle
{
    return @"YouTube";
}

- (UIImage *)activityImage
{
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)])
    {
        return [UIImage imageNamed:@"KMYouTubeActivity.bundle/youtube" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
    }
    else
    {
        return [UIImage imageNamed:@"KMYouTubeActivity.bundle/youtube-7"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:YoutubeBaseURL]] == YES)
    {
        for (id activityItem in activityItems)
        {
            return [self isYouTubeURL:activityItem];
        }
    }
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id activityItem in activityItems)
    {
        if ([self isYouTubeURL:activityItem] == YES)
        {
            NSString *videoIdentifier = [self videoIdentifierForUrl:activityItem];
            
            if (videoIdentifier != nil)
            {
                _URL = [NSURL URLWithString:[YoutubeBaseURL stringByAppendingString:videoIdentifier]];
                break;
            }
        }
    }
}

- (void)performActivity
{
    BOOL completed = [[UIApplication sharedApplication] openURL:_URL];
    [self activityDidFinish:completed];
}

- (NSString*)videoIdentifierForUrl:(NSURL*)url
{
    if ([url isKindOfClass:[NSURL class]])
    {
        NSURLComponents *components = [NSURLComponents componentsWithString:[url absoluteString]];
        
        for(NSURLQueryItem *item in components.queryItems)
        {
            if([item.name isEqualToString:@"v"])
            {
                return item.value;
            }
        }
    }
    return nil;
}

- (BOOL)isYouTubeURL:(NSURL*)url
{
    if ([url isKindOfClass:[NSURL class]])
    {
        NSURLComponents *components = [NSURLComponents componentsWithString:[url absoluteString]];
        
        for(NSURLQueryItem *item in components.queryItems)
        {
            if([item.name isEqualToString:@"feature"] && [item.value isEqualToString:@"youtu.be"])
            {
                return YES;
            }
        }
    }
    return NO;
}

@end

