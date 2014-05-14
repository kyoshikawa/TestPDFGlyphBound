//
//  ZUtils.m
//	ZKit
//
//  Created by Kaz Yoshikawa on 11/02/04.
//  Copyright 2011 Electricwoods LLC. All rights reserved.
//

#import "ZUtils.h"

//
//	ZUtils
//

#ifdef __cplusplus
extern "C" {
#endif

NSString *ZApplicationIdentifier()
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

NSString *ZApplicationVersion()
{
	return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

NSString *ZApplicationResourcePath()
{
	return [[NSBundle mainBundle] resourcePath];
}

BOOL NSObjectEqualToObject(NSObject *object1, NSObject *object2)
{
	return object1 ? [object1 isEqual:object2] : object2 == nil;
}

BOOL NSDataEqualToData(NSData *data1, NSData *data2)
{
	return data1 ? [data1 isEqualToData:data2] : data2 == nil;
}

BOOL NSStringEqualToString(NSString *string1, NSString *string2)
{
	return string1 ? [string1 isEqualToString:string2] : string2 == nil;
}

BOOL NSArrayEqualToArray(NSArray *array1, NSArray *array2)
{
	return array1 ? [array1 isEqualToArray:array2] : array2 == nil;
}

BOOL NSSetEqualToSet(NSSet *set1, NSSet *set2)
{
	return set1 ? [set1 isEqualToSet:set2] : set2 == nil;
}

BOOL NSDictionaryEqualToDictionary(NSDictionary *dictionary1, NSDictionary *dictionary2)
{
	return dictionary1 ? [dictionary1 isEqualToDictionary:dictionary2] : dictionary2 == nil;
}

BOOL NSNumberEqualToNumber(NSNumber *number1, NSNumber *number2)
{
	return number1 ? [number1 isEqualToNumber:number2] : number2 == nil;
}

BOOL NSValueEqualToValue(NSValue *value1, NSValue *value2)
{
	return value1 ? [value1 isEqualToValue:value2] : value2 == nil;
}

BOOL NSDateEqualToDate(NSDate *date1, NSDate *date2)
{
	return date1 ? [date1 isEqualToDate:date2] : date2 == nil;
}

void ZReportError(NSError *error)
{
	if (error) {
		NSLog(@"%@", error);
	}
}

NSString *ZDocumentDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *ZLibraryDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
}

NSString *ZCachesDirectory()
{
	return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

NSURL *ZDocumentDirectoryURL()
{
	return [NSURL fileURLWithPath:ZDocumentDirectory()];
}

NSURL *ZCachesDirectoryURL()
{
	return [NSURL fileURLWithPath:ZCachesDirectory()];
}

BOOL ZFilePathEqualToFilePath(NSString *aPath1, NSString *aPath2)
{
	NSString *path1 = [aPath1 stringByExpandingTildeInPath];
	NSString *path2 = [aPath2 stringByExpandingTildeInPath];

	return [path1 isEqualToString:path2];
}

NSString *NSStringFromBool(BOOL value)
{
	return value ? @"YES" : @"NO";
}

NSRange NSRangeFromCFRange(CFRange range)
{
	return NSMakeRange(range.location == kCFNotFound ? NSNotFound : range.location, range.length);
}

CFRange CFRangeFromNSRange(NSRange range)
{
	return CFRangeMake(range.location == NSNotFound ? kCFNotFound : range.location, range.length);
}

#if TARGET_OS_IPHONE

float ZSystemVersion()
{
	return [[[UIDevice currentDevice] systemVersion] floatValue];
}

NSString *ZUserInterfaceIdiomResourceName(NSString *name)
{
	NSString *modifier = ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? @"~iphone" : @"~ipad";
	return [name stringByAppendingString:modifier];
}
#endif

#ifdef __cplusplus
}
#endif

