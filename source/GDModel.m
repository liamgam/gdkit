
#import "GDModel.h"

@implementation GDModel
@synthesize appInfo;

- (void) dealloc {
	#ifdef GDKIT_PRINT_DEALLOCS
	printf("dealloc GDModel\n");
	#endif
	[super dealloc];
}

@end
