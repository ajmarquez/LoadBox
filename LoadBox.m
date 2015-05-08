//
//  LoadBox.m
//  BECOprime
//
//  Created by Abelardo Marquez on 5/5/15.
//  Copyright (c) 2015 singular. All rights reserved.
//

#import "LoadBox.h"
#import "AFNetworking.h"


@implementation LoadBox

@synthesize targetURL;
@synthesize targetFilePath;


-(NSString*)downloadFileAndCacheFrom:(NSString*)aTargetURL andNameIt:(NSString*)name{
    
    //Begin code
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:aTargetURL]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:name];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Successfully downloaded file to %@", path);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        NSLog(@"Something wrong happened when we tried to download the info");
    }];
    
    targetFilePath = path;
    
    [operation start];
    
    //End code
    
    NSLog(@"This is what is being return: %@", path);
    
    return path;
}

-(NSString*)getFilePath{
    
    return targetFilePath;
}

-(NSString*)generateURLWithCode:(NSString*)code usingThisString:(NSString*)theString {
    
    // We may add a BOOL to choose between Phone or Tablet iPhone:(BOOL)type{
    
    NSString* newURL = [NSString stringWithFormat:theString,code,code];
    
    // BecoString @"http://www.i-singular.com/clients/beco/catalogs/%@/Data/XHDPI/Phone/%@.xml"
    
    NSLog(@"The new URL is:  %@",newURL);
    
    return newURL;
    
}




@end
