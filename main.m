#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    if (argc < 2) {
      return 1;
    }

    NSString *pathString = [NSString stringWithUTF8String:argv[1]];
    NSURL* url = [NSURL fileURLWithPath:pathString];

    NSFileManager* defaultManager = [NSFileManager defaultManager];
    if (![defaultManager fileExistsAtPath:[url path]]) {
      return 1;
    }

    NSError* error = nil;
    NSData* bookmarkData =
        [url bookmarkDataWithOptions:NSURLBookmarkCreationWithSecurityScope
            includingResourceValuesForKeys:nil
                            relativeToURL:nil
                                    error:&error];
    if (error != nil) {
      NSLog(@"Error creating bookmark data: %@", error);
      return 2;
    } else {
      // Encode NSData in base64 then convert to NSString.
      NSString* base64data = [[NSString alloc]
          initWithData:[bookmarkData base64EncodedDataWithOptions:0]
              encoding:NSUTF8StringEncoding];
      // Convert NSString to std::string directly
      // return std::string([base64data UTF8String]);
      printf("%s\n", [base64data UTF8String]);
    }
  }
  return 0;
}