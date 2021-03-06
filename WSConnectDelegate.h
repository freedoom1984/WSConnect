//
//  WSConnectDelegate.h
//
//  Created by Luigi Marino on 26/07/12.
//  Copyright (c) 2012 Creact.it All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WSConnectDelegate


@required

//This delegate method is called when there are the connection problems. In the `error` paramether you have the error information
-(void)connectionError:(NSError *)error;


//This delegate method is called when there are the JSON parsing problems. In the `stringError` paramether you have the parsing error information
-(void)errorParsingJSON:(NSString*)stringError;


//This delegate method is called when the parsing is correctly executed. In the `jsonData` object you have the ID object. You type it at the NSDictionary or NSArray object. The `tag` is the tag number of request
-(void)JSONDownloaded:(id)jsonData;



@optional
//This delegate method is called when the parsing is correctly executed. In the jsonData object you have the ID object. You type it at the NSDictionary or NSArray object. The tag is the tag number of request
-(void)JSONDownloaded:(id)jsonData withTag:(NSInteger)tag;




@end
