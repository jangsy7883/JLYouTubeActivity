# JLYouTubeActivity

[![Version](https://img.shields.io/cocoapods/v/JLYouTubeActivity.svg?style=flat)](http://cocoadocs.org/docsets/JLYouTubeActivity)
[![License](https://img.shields.io/cocoapods/l/JLYouTubeActivity.svg?style=flat)](http://cocoadocs.org/docsets/JLYouTubeActivity)
[![Platform](https://img.shields.io/cocoapods/p/JLYouTubeActivity.svg?style=flat)](http://cocoadocs.org/docsets/JLYouTubeActivity)

`JLYouTubeActivity` is a `UIActivity` subclass that provides an "YouTube" action to a `UIActivityViewController`.

![JLYouTubeActivity screenshot](https://github.com/jangsy7883/JLYouTubeActivity/blob/master/ScreenShots/1.png?raw=true "JLYouTubeActivity screenshot")

##Installation
JLYouTubeActivity is available on CocoaPods. Add to your Podfile:
```bash
pod 'JLYouTubeActivity'
```
and run 
```bash
pod install
```

## Usage

### Objective-C

```objectivec
NSURL *URL = [NSURL URLWithString:@"https://youtu.be/_NMQl74qrR8"];

JLYoutubeActivity *activity = [[JLYoutubeActivity alloc] init];
UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[URL] applicationActivities::@[activity]];
```

##Licence 

The MIT License (MIT)

Copyright (c) 2016 JL

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
