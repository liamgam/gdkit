
#import "GDContextMenuController.h"

@implementation GDContextMenuController

- (void) invalidate{}

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDContextMenuController\n");
	#endif
	[super dealloc];
}

@end
