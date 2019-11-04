# Notifications
An android app for pushing notifications using _Firebase_ (for _Flutter_)\
Using [_firebase_messaging_](https://pub.dev/packages/firebase_messaging) package in flutter\
## It works in three cases
  - while app is foreground(user on screen)
  - while app is in background
  - while app is in terminated(notifcation appears after relaunch)\

## Guide for Setup:
  - Visit firebease [console](https://console.firebase.google.com/)
  - Add your project (register your app with firebase)
  - Add your app details
  - Download the generated <code>google-services.json</code> file and place it inside <code>android/app</code>.
  - Add the classpath to the <code>[project]/android/build.gradle</code> file
  - Set name property of application in <code>AndroidManifest.xml</code>
  - Set dart methods to show output [help](https://pub.dev/packages/firebase_messaging)
  
  


