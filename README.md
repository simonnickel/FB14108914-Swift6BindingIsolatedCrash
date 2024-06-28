#  FB14108914 - Swift 6: Binding with isolated closures failes to compile / crashes


## Scenario

A SwiftUI app has a class that provides a custom Binding where the closures capture self to store the value.


## Issue

To be compliant with Swift 6 strict concurrency checking, the class and the closures are isolated to @MainActor.

When compiling with Swift 5.10 and strict concurrency checking = complete, there are no warnings and the binding is working fine.
When compiling with Swift 6, the code fails to compile without proper error message (see file: Build Swift6BindingIsolatedCrash_2024-06-28T10-51-08.txt).

In the actual project I encountered this issue, it was able to build, but the app crashed on initialisation of the binding. In this case, the binding is defined in a package with swiftLanguageVersions: [.version("6")] set and the consuming project set to compile with Swift 6.

	
## Example code

The example shows a Toggle, which uses a binding setup as described above. When compiled with Swift 5, it works fine. When compiled with Swift 6 it fails.


## Tested on

	- Xcode Version 16.0 beta (16A5171c)

