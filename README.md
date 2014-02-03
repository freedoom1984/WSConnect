WSConnect
=========
WSConnect is a powerful library for your OBJ-C applications.
WSConnect downloads your JSON web-services data ( with synchronous or asynchronous connection ) and parses it.
With a single line of code you can download the data from the web-service, then parse the JSON and use it for your application.
WSConnect uses the delegate design pattern to return the parsed/not parsed data, notify the connection or parsing problems.

WSConnect is the library designed with love :)






Library general information
=========
DebugLevel 1 / 2 / 3 allows the log execution in the XCode Console. Specify your DebugLevel in the project Prefix file.
WSConnect library doesn't support ARC.

This library uses JSONKit ( https://github.com/johnezang/JSONKit ) for parsing the JSON downloaded data.





WSConnect Class Method
=========
`+(NSData*) sendGETRequestServerSyncWithReturnData: (NSString*)path`

This class method makes the synchronous connection at the url and returns the downloaded data in the NSData object.


`+(id) parseJSON: (NSData*)data`

This class method returns the parsed JSON contained in the NSData object. The return object is ID, you must type it in the call method


`+(id) parseJsonWithLocalPath: (NSString*)path`

This class method parses a local JSON file. This method doesn't parse a bundle file.


`+(id)sendGETRequestServerSYNC:(NSString*)path`

This class method make the synchronus connection at the url and return the parsed JSON. The return object is ID, you must type it in the call method.


`+(id)parseJsonInBundleWithFileName: (NSString*)name andExtension: (NSString*)extension`

This class method parse a bundle JSON file.



WSConnect Instance Method
=========
`- (void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del`

This instance method makes the asynchronous connection at the url and returns the downloaded data in the NSData object.
The return NSData object is provided by the WSConnect Delegate Method ( see below for WSConnect Delegate documentation )
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` parameter


`- (void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag`

This instance method makes the asynchronous connection at the url and returns the downloaded data in the NSData object.
With "Tag" you define multiple call at the same controller.
The return NSData object is provided by the WSConnect Delegate Method ( see below for WSConnect Delegate documentation )
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag`

This instance method makes the asynchronous connection at the url and returns the parsed JSON downloaded data. The return object is ID, you must type it in the call method. With "Tag" you define multiple call at the same controller.
The return object ( ID type ) is provided by the WSConnect Delegate Method ( see below for WSConnect Delegate documentation ).
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del`

This instance method makes the asynchronous connection at the url and returns the parsed JSON downloaded data. The return object is ID, you must type it in the call method.
The return object ( ID type ) is provided by the WSConnect Delegate Method ( see below for WSConnect Delegate documentation ).
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`-(void)stopAsyncRequest`

With this instance method you can stop the active async request.




WSConnect Delegate Protocol - Required Method
=========

`-(void)connectionError:(NSError *)error`

This delegate method is called when there are connection problems. The `error` parameter gives back the error information.

`-(void)errorParsingJSON:(NSString*)stringError`

This delegate method is called when there are JSON parsing problems. The `stringError` parameter gives back the parsing error information.


`-(void)JSONDownloaded:(id)jsonData`

This delegate method is called when the parsing method is correctly executed. The `jsonData` object gives back the ID object. You can type it at the NSDictionary or NSArray object. 


WSConnect Delegate Protocol - Optional Method
=========

`-(void)JSONDownloaded:(id)jsonData withTag:(NSInteger)tag`

This delegate method is called when the parsing method is correctly executed. The `jsonData` object gives back the ID object. You can type it at the NSDictionary or NSArray object. The `tag` is the tag number of request



Contact information
=========
You can contact me at info@creact.it

Creact.it - Mobile & Web
Web: www.creact.it
