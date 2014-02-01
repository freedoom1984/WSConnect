WSConnect
=========
WSConnect is a powerful library for your OBJ-C application.
WSConnect download your JSON web-services data ( synchrous or asynchrous connection ) and parse it.
WSConnect use the delegate design pattern to return the parsed data, notify the connection or parsing problems.

WSConnect is the library designed with love :)






Library general information
=========
DebugLevel 1 / 2 / 3 allow the log execution in the XCode Console. Specify your DebugLevel in the project Prefix file.
WSConnect library don't support ARC ( automatic reference counting )





WSConnect Class Method
=========
`+(NSData*) sendGETRequestServerSyncWithReturnData: (NSString*)path`

This class method make the synchronus connection at the url and return the downloaded data in the NSData object.


`+(id) parseJSON: (NSData*)data`

This class method return parsed JSON contained in the NSData object. The return object is ID, you must type it in the call method


`+(id) parseJsonWithLocalPath: (NSString*)path`

This class method parse the local JSON file. This method don't parse the bundle file


`+(id)sendGETRequestServerSYNC:(NSString*)path`

This class method make the synchronus connection at the url and return the parsed JSON. The return object is ID, you must type it in the call method


`+(id)parseJsonInBundleWithFileName: (NSString*)name andExtension: (NSString*)extension`

This class method parse the bundle JSON file



WSConnect Instance Method
=========
`- (void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del`

This instance method make the asynchronus connection at the url and return the downloaded data in the NSData object.
The return NSData object is provided by the WSConnect Delegate Method ( look down for WSConnect Delegate documentation )
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`- (void)sendGETRequestServerASYNCWithReturnData:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag`

This instance method make the asynchronus connection at the url and return the downloaded data in the NSData object.
With "Tag" you define multiple call at the same controller 
The return NSData object is provided by the WSConnect Delegate Method ( look down for WSConnect Delegate documentation )
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del withCallTag:(NSInteger)tag`

This instance method make the asynchronus connection at the url and return the parsed JSON downloaded data. The return object is ID, you must type it in the call method. With "Tag" you define multiple call at the same controller.
The return object ( ID type ) is provided by the WSConnect Delegate Method ( look down for WSConnect Delegate documentation ).
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`-(void)sendGETRequestServerASYNC:(NSString*)path withDelegate:(id<WSConnectDelegate>)del`

This instance method make the asynchronus connection at the url and return the parsed JSON downloaded data. The return object is ID, you must type it in the call method.
The return object ( ID type ) is provided by the WSConnect Delegate Method ( look down for WSConnect Delegate documentation ).
Specify the delegate object in the method call `(id<WSConnectDelegate>)del` paramether


`-(void)stopAsyncRequest`

With this instance method you can stop the active async request 
