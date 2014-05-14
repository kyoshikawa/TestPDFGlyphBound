//
//  TSDocument.h
//  TestPDF
//
//  Created by kyoshikawa on 14/5/12.
//  Copyright (c) 2014 Electricwoods LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

//
//	TSPDFDocument
//

@interface TSPDFDocument : NSDocument

@property (strong) IBOutlet PDFView *PDFView;
@property (strong) IBOutlet NSTextField *labelView;

@end
