//
//  LoadBox.h
//  BECOprime
//
//  Created by Abelardo Marquez on 5/5/15.
//  Copyright (c) 2015 singular. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoadBox : NSObject

@property (nonatomic, copy) NSString* targetURL;
@property (nonatomic, copy) NSString* targetFilePath;


/**
 This fuction is used to download contents from the specified URL (aTagetURL) and then save it on the NSCachesDirectory, the result is the path of the resourse.
 */

-(NSString*)downloadFileAndCacheFrom:(NSString*)aTargetURL andNameIt:(NSString*)name;
-(NSString*)generateURLWithCode:(NSString*)code usingThisString:(NSString*)theString;

@end
