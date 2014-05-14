//
//  TSPDFView.m
//  TestPDF
//
//  Created by kyoshikawa on 14/5/12.
//  Copyright (c) 2014 Electricwoods LLC. All rights reserved.
//

#import "TSPDFView.h"
#import "NSEvent+View.h"

@interface TSPDFView ()

@property (strong) NSArray *hitIndexes;
@property (strong) PDFPage *page;

@end

@implementation TSPDFView

- (void)awakeFromNib
{
	[super awakeFromNib];
	NSParameterAssert(self.labelView);
	NSParameterAssert(self.textView);
}

- (BOOL)shouldIgnoreCharactor:(unichar)ch
{
	if (iscntrl(ch)) return YES;
	if (ch==0xfffc) return YES;
	return NO;
}

- (void)drawPage:(PDFPage *)page
{
	[super drawPage:page];

	NSUInteger numberOfCharacters = [page numberOfCharacters];
	NSLog(@"text=[%@]", page.string);

	NSColor *regularColor = [NSColor colorWithRed:0 green:0 blue:1 alpha:0.25];
	NSColor *selectedColor = [NSColor colorWithRed:1 green:0 blue:0 alpha:0.25];
	for (NSUInteger index = 0 ; index < numberOfCharacters ; index++) {

		unichar ch = [page.string characterAtIndex:index];
		CFStringIsSurrogateHighCharacter(ch);
		NSRect rect = [page characterBoundsAtIndex:index];

		if (![self shouldIgnoreCharactor:ch]) {
			NSColor *color = [self.hitIndexes containsObject:[NSNumber numberWithInteger:index]] ? selectedColor : regularColor;
			[color set];
			[[NSBezierPath bezierPathWithOvalInRect:rect] stroke];
		}
	}
}

- (void)drawPagePost:(PDFPage *)page
{
	[super drawPagePost:page];
}

- (void)mouseUp:(NSEvent *)event
{
	[super mouseUp:event];

	NSLog(@"%s", __FUNCTION__);
	NSPoint pointInView = [event locationInView:self];
	PDFPage *page = [self pageForPoint:pointInView nearest:NO];

	if (page != self.page) {
		self.textView.string = @"";
	}


	if (page) {
		NSPoint pagePt = [self convertPoint:pointInView toPage:page];

		NSString *pageString = page.string;
		NSMutableArray *hitIndexes = [NSMutableArray array];

		NSInteger index = [page characterIndexAtPoint:pagePt];
		if (index >= 0 && index < page.string.length) {
			NSRange charactorRange = NSMakeRange(index, 1);
			unichar ch = [pageString characterAtIndex:index];
			[hitIndexes addObject:[NSNumber numberWithInteger:index]];
			self.labelView.stringValue = pageString;
			self.textView.string = pageString;
			[self.textView setSelectedRange:NSMakeRange(index, 1)];
			[self.textView setEditable:NO];
			self.labelView.stringValue = [NSString stringWithCharacters:&ch length:1];
			[self.textView scrollRangeToVisible:charactorRange];
		}

		self.hitIndexes = hitIndexes;
		self.page = page;
		[self setNeedsDisplay:YES];
	}

	[self becomeFirstResponder];
}

- (void)textViewDidChangeSelection:(NSNotification *)aNotification
{
	NSMutableArray *hitIndexes = [NSMutableArray array];

	NSRange selectedRange = self.textView.selectedRange;
	if (selectedRange.location != NSNotFound && self.page) {
		for (NSInteger index = selectedRange.location ; index < NSMaxRange(selectedRange) ; index++) {
			[hitIndexes addObject:[NSNumber numberWithInteger:index]];
		}
	}
	self.hitIndexes = hitIndexes;
	[self setNeedsDisplay:YES];
}

- (void)setCurrentSelection:(PDFSelection *)selection
{
	NSLog(@"%s", __FUNCTION__);
}

@end
