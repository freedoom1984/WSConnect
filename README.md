WSConnect
=========
WSConnect is a powerful library for your OBJ-C application.
WSConnect download your JSON web-services data ( synchrous or asynchrous connection ) and parse it.
WSConnect use the delegate design pattern to return the parsed data, notify the connection or parsing problems.

WSConnect is the library designed with love :)




Library information
=========
DebugLevel 1 / 2 / 3 allow the log execution in the XCode Console. Specify your DebugLevel in the project Prefix file.


WSConnect Class Method
=========

+(NSData*) sendGETRequestServerSyncWithReturnData: (NSString*)path\n
This class method make the synchronus connection at the url and return the downloaded data in the NSData object.

+(id) parseJSON: (NSData*)data
This class method return parsed JSON contained in the NSData object. The return object is ID, you must type it in the origin method

+(id) parseJsonWithLocalPath: (NSString*)path
This class method parse the local JSON file 


+(id)sendGETRequestServerSYNC:(NSString*)path;
