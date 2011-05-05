#import "NSObject+Additions.h"
#import <UIKit/UIKit.h>

@implementation NSObject (Additions)

- (BOOL)isDeviceAniPad
{
#ifdef UI_USER_INTERFACE_IDIOM()
	return UI_USER_INTERFACE_IDIOM();
#else
	return NO;
#endif
} 

- (BOOL) isDeviceOS4{
	UIDevice *device = [UIDevice currentDevice];
	BOOL multitaskingSupported = NO;
	if ([device respondsToSelector: @selector(isMultitaskingSupported)]) {
		multitaskingSupported = [device isMultitaskingSupported];
	}
	return multitaskingSupported;
}

@end