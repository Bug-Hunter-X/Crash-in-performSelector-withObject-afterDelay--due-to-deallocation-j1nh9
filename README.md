# Objective-C Crash in performSelector:withObject:afterDelay:

This repository demonstrates a common, yet subtle bug in Objective-C related to the `performSelector:withObject:afterDelay:` method.  The bug occurs when the object passed as the `withObject` parameter is deallocated before the selector is invoked.  This leads to a crash due to accessing deallocated memory. The solution provides a safer approach to handle delayed method calls.

## Bug Reproduction

1. Clone the repository.
2. Build and run the project.
3. Observe the crash after a short delay.

## Solution

The solution involves using a mechanism that ensures the object remains valid until the selector is performed. One approach is to use `weak` references and check for nil before accessing the object.  This prevents attempts to use deallocated memory.

This example uses blocks to achieve this, ensuring that the object is retained appropriately.