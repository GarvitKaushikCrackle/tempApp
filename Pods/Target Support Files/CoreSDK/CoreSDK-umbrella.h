#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "GAMLoader.h"
#import "ISLoader.h"
#import "MAXLoader.h"

FOUNDATION_EXPORT double CoreSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char CoreSDKVersionString[];

