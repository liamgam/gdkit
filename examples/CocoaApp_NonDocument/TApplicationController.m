
#import "TApplicationController.h"

@implementation TApplicationController

- (void) initApplication {
	//NSLog(@"initApplication");
	TModel * mdl = [[[TModel alloc] init] autorelease];
	TMainMenuController * mm = [[[TMainMenuController alloc] init] autorelease];
	TModalController * mdls = [[[TModalController alloc] init] autorelease];
	TOperationsController * ops = [[[TOperationsController alloc] init] autorelease];
	TSoundController * snds = [[[TSoundController alloc] init] autorelease];
	[self lazyInitWithModel:mdl mainMenu:mm modals:mdls operations:ops windows:wins drawers:nil views:views sounds:snds];
	[super initApplication];
}

- (void) initModel {
	//NSLog(@"initModel");
	GDApplicationInfo * app = [[GDApplicationInfo alloc] init];
	[model setAppInfo:app];
}

- (void) initControllers {
	//NSLog(@"initControllers");
	externalNibTest=[[TExternalNibTest alloc] initWithGDApplicationController:self andNibName:@"TestNib"];
	[externalNibTest setDisposesNibsOnWindowClose:true];
}

- (void) initWindows {
	//NSLog(@"initWindows");
	[super initWindows];
}

- (void) initViews {
	//NSLog(@"initViews");
	[[views customView1] lazyInitWithGDApplicationController:self];
	[super initViews];
}

- (void) startApplication {
	//NSLog(@"start app");
	//kick start anything form here, these are just examples.
	[views showCustomView1];
	[mainMenu logAMenuItem];
	[operations doSomething];
	GDCallback * callback=[[[GDCallback alloc] initWithTarget:self andAction:@selector(onSomethingComplete)] autorelease];
	[operations doSomethingWithCallback:callback];
}

- (void) dealloc {
	GDRelease(externalNibTest);
	[super dealloc];
}

/*************/
//from here on down, you can expose methods for target/action, callbacks, etc.
/*************/
- (IBAction) hello:(id) sender {
	NSLog(@"hello");
}

- (IBAction) loadExternalNibTest:(id) sender {
	[externalNibTest show];
}

- (IBAction) loadExternalNibAsSheet:(id) sender {
	[externalNibTest showAsSheetForWindow:[wins mainWindow]];
}

- (IBAction) popTest:(id) sender {
	//this just demonstrates that from any object in the
	//application you have a reference to "gd".
	//Take a look at TCustomView's "testPopSound" method.
	[[views customView1] testPopSound];
}

- (void) onSomethingComplete {
	NSLog(@"something complete");
}

@end
