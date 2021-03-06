/* MainController */

#import "CTBadge.h"
#import <Carbon/Carbon.h>
#import <Cocoa/Cocoa.h>

@interface MainController : NSObject {
    CTBadge* myBadge;

    __weak IBOutlet id scroller;
    __weak IBOutlet id largeBadgeView;
    __weak IBOutlet id smallBadgeView;
    __weak IBOutlet NSWindow* settingsWindow;
}

- (IBAction)setBadgeValue:(id)sender;
- (IBAction)setBadgeColor:(id)sender;
- (IBAction)setLabelColor:(id)sender;
- (IBAction)setBadgeGradientIntensity:(id)sender;

- (IBAction)setApplicationIcon:(id)sender;

@end
