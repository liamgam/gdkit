
#import "GDModalController.h"

@implementation GDModalController

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDModalController\n");
	#endif
	[super dealloc];
}

@end
