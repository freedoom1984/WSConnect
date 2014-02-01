//
//  WSConnect-JSONKit.h
//
//  Created by Luigi Marino on 26/07/12.
//  Copyright (c) 2012 Creact.it All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "WSConnectDelegate.h"

@interface WSConnect_JSONKit : NSObject <NSURLConnectionDataDelegate>
{
    id<WSConnectDelegate>delegate;
    
    NSInteger callTag;
    BOOL isCallTag;
    BOOL isMethodReturnData;

    //async object mutable data
    NSMutableData *mutableData;
    NSURLConnection *connection;
    NSURLRequest *request;
    BOOL connectionStopped;
    BOOL connectionTerminated;
}



#pragma mark Class Method
//This class method make the synchronus connection at the url and return the downloaded data in the NSData object.
+(NSData*)sendGETRequestServerSyncWithReturnData:(NSString*)path;


//This class method return parsed JSON contained in the NSData object. The return object is ID, you must type it in the origin method
+(id)parseJSON:(NSData*)data;


//This class method parse the local JSON file
+(id)parseJsonWithLocalPath:(NSString*)path;


//This class method make the synchronus connection at the url and return the parsed JSON. The return object is ID, you must type it in the call method
+(id)sendGETRequestServerSYNC:(NSString*)path;


//This class method parse the bundle JSON file
+(id)parseJsonInBundleWithFileName:(NSString*)name andExtension:(NSString*)extension;


#pragma mark Class Instance Method
//This instance method make the asynchronus connection at the url and return the downloaded data in the NSData object.
- (void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del;


/*This instance method make the asynchronus connection at the url and return the downloaded data in the NSData object.
With "Tag" you define multiple call at the same controller*/
- (void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag;


//This instance method make the asynchronus connection at the url and return the parsed JSON downloaded data.
-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag;


//This instance method make the asynchronus connection at the url and return the parsed JSON downloaded data.
-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del;


//With this instance method you can stop the active async request
-(void)stopAsyncRequest;




@end
