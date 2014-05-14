//
//  TSPDFView.h
//  TestPDF
//
//  Created by kyoshikawa on 14/5/12.
//  Copyright (c) 2014 Electricwoods LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Quartz/Quartz.h>

@interface TSPDFView : PDFView <NSTextViewDelegate>

@property (strong) IBOutlet NSTextField *labelView;
@property (strong) IBOutlet NSTextView *textView;

@end
