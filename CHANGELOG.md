# react-native-detect-maestro

## 2.0.0

### Major Changes

- [#10](https://github.com/retyui/react-native-detect-maestro/pull/10) [`f4a26ff`](https://github.com/retyui/react-native-detect-maestro/commit/f4a26ffcf652e3d941a5f00a956478490364c6c5) Thanks [@retyui](https://github.com/retyui)! - Drop support for React Native's Old Architecture. The library now requires the New Architecture (TurboModules) and React Native `0.71+`. Apps still on the Old Architecture should stay on `1.x`.

### Minor Changes

- [`dc69048`](https://github.com/retyui/react-native-detect-maestro/commit/dc69048050edac23a8b754705ad4e8f53c09aee1) Thanks [@retyui](https://github.com/retyui)! - Detect Maestro 2.x via the `isMaestro` launch argument. Maestro 2.x picks a random driver port, so the port check no longer works. Pass the argument in your flows:
  
  ```yaml
  - launchApp:
      arguments:
        isMaestro: true
  ```
  
  On Android it is read from the launch intent extras, on iOS from the process arguments. Maestro 1.x is still detected without the argument (driver port `7001` on Android, `22087` on iOS).
