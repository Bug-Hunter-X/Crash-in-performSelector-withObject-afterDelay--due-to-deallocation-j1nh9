The issue is resolved by using blocks or other techniques that retain the object being passed to `performSelector:withObject:afterDelay:` until after the selector has been performed.  Here's an example using blocks:

```objectivec
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SomeObject *myObject = [[SomeObject alloc] init];
    // ... initialize myObject
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        if (myObject) {
            [myObject performSomeAction];
        }
    });
}

@end
```
This revised approach utilizes Grand Central Dispatch (GCD) to schedule the execution of the block after the delay. The block strongly references `myObject` and the if statement checks for nil, safely handling potential deallocation.