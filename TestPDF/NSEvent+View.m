//
//  NSEvent+View.m
//  Electricnotes
//
//  Created by kyoshikawa on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSEvent+View.h"


@implementation NSEvent (View)

- (NSPoint)locationInView:(NSView *)aView;
{
	NSParameterAssert(aView.window == self.window);
	return [aView convertPoint:[self locationInWindow] fromView:nil];
}

@end
