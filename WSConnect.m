//
//  WSConnect-JSONKit.m
//
//  Created by Luigi Marino on 26/07/12.
//  Copyright (c) 2012 Creact.it All rights reserved.
//

#import "WSConnect-JSONKit.h"

//DebugLevel = 1 low debug level
//DebugLevel = 2 medium debug level
//DebugLevel = 3 high debug level

@implementation WSConnect_JSONKit


//Init method
-(id)init
{
    if(self)
        [super init];

	return self;
}



+(NSData*)sendGETRequestServerSyncWithReturnData:(NSString*)path
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if(DebugLevel == 3)
        NSLog(@"URL: %@", path);
    
    NSURL *jsonURL = [NSURL URLWithString:path];
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonURL];
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    
    return jsonData;
}



-(void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del
{
    
    isMethodReturnData = TRUE;
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:path];
    
    
    if(DebugLevel == 3)
        NSLog(@"URL: %@",url);
    
    
    delegate = del;
    request = [[NSURLRequest alloc]
                             initWithURL:url
                             cachePolicy: NSURLRequestReloadIgnoringLocalCacheData
                             timeoutInterval: 30
                             ];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}




-(void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag
{
    callTag = tag;
    isCallTag = TRUE;
    isMethodReturnData = TRUE;
    
    
    [self sendGETRequestServerASYNCWithReturnData:path withDelegate:del];
}







+(id)sendGETRequestServerSYNC:(NSString*)path
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    if(DebugLevel == 3)
        NSLog(@"URL: %@", path);
    
    
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSURL *jsonURL = [[NSURL alloc]initWithString:path];
    NSData *jsonData = [[NSData alloc]initWithContentsOfURL:jsonURL];    
    
    NSError *error = nil;
    id data = [decoder objectWithData:jsonData error:&error];
    
    if(error)
    {
        NSLog(@"Error: %@", [error localizedDescription]);
    }
        

    
    if(DebugLevel <= 3)
        NSLog(@"Downloaded data: %@", data);
    
    [jsonData release];
    [jsonURL release];
    [decoder release];
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    
    return data;
}





-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del
{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSURL *url = [NSURL URLWithString:path];
    
    if(DebugLevel == 3)
        NSLog(@"URL: %@",url);
    
    
    delegate = del;
    request = [[NSURLRequest alloc]
                             initWithURL:url
                             cachePolicy: NSURLRequestReloadIgnoringLocalCacheData
                             timeoutInterval: 30
                             ];
    
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}






//assgno un tag alla chiamata in modo da poterne fare varie nello stesso controller
-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag
{
    callTag = tag;
    isCallTag = TRUE;
    
    [self sendGETRequestServerASYNC:path withDelegate:del];
}




//Effettua il parsing di un file JSON presente in app
+(id)parseJsonWithLocalPath:(NSString*)path
{
    if(DebugLevel == 3)
        NSLog(@"URL: %@", path);
    
    
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSData *jsonData = [[NSData alloc]initWithContentsOfFile:path];
    id data = [decoder objectWithData:jsonData];
    
    if(DebugLevel == 1)
        NSLog(@"Parsed data: %@", data);
    
    
    [jsonData release];
    [decoder release];
    return data;
}



//Effettua il parsing di un JSON 
+(id)parseJSON:(NSData*)data
{
    if(DebugLevel == 3)
        NSLog(@"Passed NSData: %@", data);
    
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    id finalData = [decoder objectWithData:data];
    
    if(DebugLevel == 1)
        NSLog(@"Parsed data: %@", finalData);
    
    [decoder release];
    
    
    return finalData;
}


+(id)parseJsonInBundleWithFileName:(NSString*)name andExtension:(NSString*)extension
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    
    
    if(DebugLevel == 3)
        NSLog(@"Path: %@", filePath);
    
    
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    id data = [decoder objectWithData:jsonData];
    
    if(DebugLevel == 1)
        NSLog(@"Parsed data: %@", data);
    
    
    [decoder release];
    return data;
    
}








#pragma mark Async Download - Delegate

// Start connection and download
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	// creo il contenitore dei dati
    mutableData = [[NSMutableData data] retain];
}

// I pacchetti (chunck) vengono accodati
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)dataDownloaded {
    [mutableData appendData:dataDownloaded];
}

// Errore
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error 
{
    NSLog(@"Error Connection");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
    [delegate connectionError:error];
}


// Connessione terminata con successo - si può elaborare il contenuto
// precedentemente accodato in mutableData
- (void)connectionDidFinishLoading:(NSURLConnection *)connection 
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
        
    //download elemento terminato, parsa e restituisce risultato
    //intercettato dal delegato
    
    
    JSONDecoder *decoder = [[JSONDecoder alloc]init];
    
    
    
    NSError *error = nil;
    id result = [decoder objectWithData:mutableData error:&error];
    
    
    
    if(error)
    {
        NSLog(@"Error: %@", [error localizedDescription]);
        [delegate errorParsingJSON:[error localizedDescription]];
    }
    else
    {
        if(isMethodReturnData)
        {
            if(isCallTag)
                [delegate JSONDownloaded:mutableData withTag:callTag];
            else
                [delegate JSONDownloaded:mutableData];
        }
        else
        {
            if(isCallTag)
                [delegate JSONDownloaded:result withTag:callTag];
            else
                [delegate JSONDownloaded:result];
        }
    }
}




-(void)stopAsyncRequest
{
    if(!connectionTerminated)
    {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
        if(connection )
            
            connectionStopped = TRUE;
        [connection cancel];
    }
}




-(void)dealloc
{
    [request release];
    [connection release];
    [mutableData release];
    [super dealloc];
}



@end
