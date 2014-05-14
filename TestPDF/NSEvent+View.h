//
//  NSEvent+View.h
//  Electricnotes
//
//  Created by kyoshikawa on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSEvent (View)

- (NSPoint)locationInView:(NSView *)aView;

@end
