# java-shims/ShimsJava/src/main/java/ShimsJava:
1. RaceApp.java
   - Implements common/include/IRaceApp.h
1. Based on IRaceApp.h #include's:
   - JClrMsg.java
   - MessageStatus.java
   - PluginStatus.java
   - SdkResponse.java
   - RaceEnums.java?!? Doesn't exist!
     + common/include/RaceEnums.java defines a bunch of enums, e.g. NodeType
     + Search for NodeType in ShimsJava, see there is now a separate NodeType.java
     + All the enums have been broken out into their own .java files, likely due to Java idiosyncracies
     + NodeType.java, BootstrapActionType.java, StorageEncryptionType.java, UserDisplayType.java
1. RaceSdkApp.java
   - Implements common/include/IRaceSdkApp.h
1. Based on IRaceSdkApp.h #include's:
   - AppConfig.java
   - DeviceInfo.java
1. Helpers.java sounds suspiciousy necessary, but doesn't look like anything we need inside

# java-shims/ShimsCpp/include
1. JavaShimUtils.h
1. RaceAppWrapper.h

# java-shims/ShimsCpp/source
1. ShimsJava_AppConfig.cpp (since we have AppConfig.java)
1. JavaShimUtils.cpp
1. RaceAppWrapper.cpp
1. JavaIds.h (because it's #include from RaceAppWrapper.cpp)
1. ShimsJava_RaceApp.cpp
1. ShimsJava_RaceSdkApp.cpp
 

# Example of Use in RACE Android App:
raceclient-android/app/src/main/java/com/twosix/race/service/RaceSdkAppFactory.java

```
    AppConfig appConfig = createAppConfig(context, persona); // calls AppConfig.create()
      return new RaceSdkApp(appConfig, passphrase);
  ```
 
 RaceSdkAppFactory.java might also be a good thing to look at since I see it is doing things with loading native libraries which might be necessary for Raceboat as well.
