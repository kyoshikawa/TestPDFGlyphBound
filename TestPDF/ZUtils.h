//
//  ZUtils.h
//	ZKit
//
//  Created by Kaz Yoshikawa on 11/02/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

//
//	ZUtils
//


#ifdef __cplusplus
extern "C" {
#endif


extern NSString *ZApplicationIdentifier(void);
extern NSString *ZApplicationVersion(void);
extern NSString *ZApplicationResourcePath(void);
extern BOOL NSObjectEqualToObject(NSObject *object1, NSObject *object2);
extern BOOL NSDataEqualToData(NSData *data1, NSData *data2);
extern BOOL NSStringEqualToString(NSString *string1, NSString *string2);
extern BOOL NSArrayEqualToArray(NSArray *array1, NSArray *array2);
extern BOOL NSSetEqualToSet(NSSet *set1, NSSet *set2);
extern BOOL NSDictionaryEqualToDictionary(NSDictionary *dictionary1, NSDictionary *dictionary2);
extern BOOL NSNumberEqualToNumber(NSNumber *number1, NSNumber *number2);
extern BOOL NSValueEqualToValue(NSValue *value1, NSValue *value2);
extern BOOL NSDateEqualToDate(NSDate *date1, NSDate *date2);
extern void ZReportError(NSError *error);
extern NSString *ZDocumentDirectory(void);
extern NSString *ZLibraryDirectory(void);
extern NSString *ZCachesDirectory(void);
extern NSURL *ZDocumentDirectoryURL(void);
extern NSURL *ZCachesDirectoryURL(void);
extern BOOL ZFilePathEqualToFilePath(NSString *aPath1, NSString *aPath2);
extern NSString *NSStringFromBool(BOOL value);
extern NSRange NSRangeFromCFRange(CFRange range);
extern CFRange CFRangeFromNSRange(NSRange range);

#if TARGET_OS_IPHONE
extern float ZSystemVersion();
extern NSString *ZUserInterfaceIdiomResourceName(NSString *name);
#endif


#ifdef __cplusplus
}
#endif


