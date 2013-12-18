# facebook-ng
![Built Status](https://travis-ci.org/dabido/facebook-ng.png "Build Status")
facebook-ng is directive / factory for wrapping the Facebook javascript SDK

# Install
Download the sources from this repository or simply use bower

 ```bower install facebook-ng```

# How to use

1. Add `facebook-ng` to your app. 
2. Use the ```<facebook></facebook>``` directive to initialise the module
3. Request `Facebook` in DI for interacting with the facebook API

# The directive
The directive supports all parameters from facebooks `FB.init` function: https://developers.facebook.com/docs/reference/javascript/FB.init/

All available options: 

```html
<facebook 
    appId="123" 
    status="false" 
    cookie="true" 
    xfbml="false" 
    oauth="true" 
    frictionlessRequests="false" 
    hideFlashCallback="null"
></facebook>
```

# The factory

Access the factory module through dependency injection by requesting for `Facebook`.
The factory makes sure the facebook SDK is loaded before giving you access to it.

Access the API like so:

```javascript
Facebook.FB(function (FB) { 
    FB.api('/me', function (response) {
       // (...)
    });
});
```
