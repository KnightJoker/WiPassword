# WiPassword

![WiPassword](https://img.shields.io/travis/rust-lang/rust.svg)
![Language](https://img.shields.io/badge/language-swift%204.0-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-AGPL-blue.svg)](https://raw.githubusercontent.com/KnightJoker/WiPassword/master/LICENSE)

WiPassword is a free, open source and no advertising password manager. It doesn't require any server or additional resources.You can use it anytime, anywhere on your iPhone. 

## Requirements

- XCode 8.0 +
- Target of iOS 8 +
- CocoaPods 1.1.0 +


## How to Build

- Go to the project path
`cd /path`

- Fetch the source of WiPassword
`git clone git@github.com:KnightJoker/WiPassword.git`

- To integrate Library into your Xcode project using CocoaPods
```
$   cd WiPassword/
$   pod install         
// if the pod update is slow，you can use `pod install --verbose --no-repo-update`
```

- Use the `.xcworkspace` file to build your app
