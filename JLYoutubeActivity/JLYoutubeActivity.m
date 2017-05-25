//
//  JLYoutubeActivity.m
//  onekm
//
//  Created by IM049 on 2015. 10. 21..
//  Copyright © 2015년 ces. All rights reserved.
//

#import "JLYoutubeActivity.h"

static NSString *YoutubeURLSchema = @"youtube://";
//static NSString *YoutubeBaseURL = @"http://www.youtube.com/v/";
static NSString *YoutubeBaseURL = @"youtube://watch?v=";

@interface JLYoutubeActivity ()

@property (nonatomic, strong) NSURL *URL;;
@end

@implementation JLYoutubeActivity

- (NSString *)activityType {
    return NSStringFromClass([self class]);
}

- (NSString *)activityTitle {
    return @"YouTube";
}

- (UIImage *)activityImage {
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [UIImage imageNamed:@"JLYoutubeActivity.bundle/youtube" inBundle:[NSBundle bundleForClass:self.class] compatibleWithTraitCollection:nil];
    }
    else {
        return [UIImage imageNamed:@"JLYoutubeActivity.bundle/youtube-7"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:YoutubeURLSchema]] == YES) {
        for (id activityItem in activityItems) {
            return [self isYouTubeURL:activityItem];
        }
    }
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id activityItem in activityItems) {
        if ([self isYouTubeURL:activityItem] == YES) {
            NSString *videoIdentifier = [self videoIdentifierForUrl:activityItem];
            
            if (videoIdentifier != nil) {
                self.URL = [NSURL URLWithString:[YoutubeBaseURL stringByAppendingString:videoIdentifier]];
                break;
            }
        }
    }
}

- (void)performActivity {
    
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:self.URL
                                           options:@{}
                                 completionHandler:^(BOOL success) {
                                     [self activityDidFinish:success];
                                 }];
    }
    else {
        BOOL completed = [[UIApplication sharedApplication] openURL:self.URL];
        [self activityDidFinish:completed];
    }
}

- (NSString*)videoIdentifierForUrl:(NSURL*)url {
    if ([url isKindOfClass:[NSURL class]]) {
        NSDictionary *parameters = [self queryParametersForURL:url];
        if (parameters[@"v"] != nil) {
            return parameters[@"v"];
        }
    }
    return nil;
}

- (BOOL)isYouTubeURL:(NSURL*)url {
    if ([url isKindOfClass:[NSURL class]]) {
        NSDictionary *parameters = [self queryParametersForURL:url];
        if ([parameters[@"feature"] isEqualToString:@"youtu.be"]) {
            return YES;
        }
    }
    return NO;
}

- (NSDictionary*)queryParametersForURL:(NSURL*)url {
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *param in [[url query] componentsSeparatedByString:@"&"])
    {
        NSArray *parts = [param componentsSeparatedByString:@"="];
        if([parts count] < 2) continue;
        [params setObject:[parts objectAtIndex:1] forKey:[parts objectAtIndex:0]];
    }
    return params;
}

@end
