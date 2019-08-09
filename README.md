# Facebook-Login
Implementation of Facebook SDK
## Getting Started
### Installation or Setup
1. Just download the repo or clone the repo
2. Open Terminal and go inside the folder,e.g cd [path to inside the repo folder]
3. Type pod install
4. Go to the folder,Just open the .xcworkspace 
5. Open Info.plist from project navigator 
6. Replace the FacebookAppID and FacebookDisplayName with your own which you can make get while setting up your facebook app(Please follow this link: https://developers.facebook.com/docs/ios/getting-started).For example 
```swift
 <key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>fb{your-app-id}</string>
    </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>{your-app-id}</string>
<key>FacebookDisplayName</key>
<string>{your-app-name}</string>
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fb-messenger-share-api</string>
  <string>fbauth2</string>
  <string>fbshareextension</string>
</array>

```
7. Run the project

### Basic Usage
 All the lines of code are properly commented if any issues free feel to open a issue will solve it
 
## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* https://github.com/facebook/facebook-sdk-swift
* https://developers.facebook.com/docs/ios/
* https://developers.facebook.com/docs/facebook-login


### Happy Coding
