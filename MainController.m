#import "MainController.h"

@implementation MainController

- (void)awakeFromNib
{
    myBadge = [[CTBadge alloc] init];
    [self setBadgeValue:scroller];
    [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
}

- (void)windowWillClose:(NSNotification *)aNotification
{
    [NSApp terminate:self];
}

- (IBAction)setBadgeValue:(id)sender
{
    int value = [sender intValue];
    
    [largeBadgeView setImage:[myBadge largeBadgeForValue:value]];
    [smallBadgeView setImage:[myBadge smallBadgeForValue:value]];
    [myBadge badgeApplicationDockIconWithValue:value insetX:3 y:0];
}

- (IBAction)setBadgeColor:(id)sender
{
    myBadge.badgeColor = [sender color];
    [self setBadgeValue:scroller];
}


- (IBAction)setLabelColor:(id)sender
{
    myBadge.labelColor = [sender color];
    [self setBadgeValue:scroller];
}

- (IBAction)setBadgeGradientIntensity:(id)sender
{
    myBadge.badgeGradientIntensity = [sender state] == NSControlStateValueOn ? 1 : 0;
    [self setBadgeValue:scroller];
}

- (IBAction)setApplicationIcon:(id)sender
{
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.directoryURL = [NSURL URLWithString:NSHomeDirectory()];
    openPanel.allowedFileTypes = @[@"icns"];
    [openPanel beginSheetModalForWindow: settingsWindow completionHandler:^(NSModalResponse result) {
        if (result == NSModalResponseOK)
        {
            [self application:nil openFile:[openPanel URL].path];
        }
    }];
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{
    NSImage *newAppIcon = [[NSImage alloc] initWithContentsOfFile:filename];
    [(NSImage *)[NSImage imageNamed:@"NSApplicationIcon"] setName:nil];
    [newAppIcon setName:@"NSApplicationIcon"];
    
    [self setBadgeValue:scroller];
    return YES;
}

@end
