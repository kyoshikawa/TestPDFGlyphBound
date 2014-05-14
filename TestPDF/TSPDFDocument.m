//
//  TSDocument.m
//  TestPDF
//
//  Created by kyoshikawa on 14/5/12.
//  Copyright (c) 2014 Electricwoods LLC. All rights reserved.
//

#import "TSPDFDocument.h"
#import "ZUtils.h"
@class PDFView;
@class PDFDocument;

//
//	PDFDocument ()
//

@interface TSPDFDocument ()

@property (strong) PDFDocument *PDFDocument;

@end

//
//	TSPDFDocument
//

@implementation TSPDFDocument

- (id)init
{
    self = [super init];
    if (self) {
		// Add your subclass-specific initialization here.
    }
    return self;
}

- (NSString *)windowNibName
{
	// Override returning the nib file name of the document
	// If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
	return @"TSPDFDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
	[super windowControllerDidLoadNib:aController];

	NSParameterAssert(self.PDFView);
	self.PDFView.displayBox = kPDFDisplayBoxMediaBox;
	self.PDFView.document = self.PDFDocument;
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
	if (NSStringEqualToString(typeName, @"PDFDocumentType")) {
		self.PDFDocument = [[PDFDocument alloc] initWithData:data];
		return YES;
	}
	return NO;
}


@end
