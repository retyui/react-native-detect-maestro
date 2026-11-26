# react-native-detect-maestro

[![react-native-detect-maestro on npm](https://badgen.net/npm/v/react-native-detect-maestro)](https://www.npmjs.com/package/react-native-detect-maestro)
[![react-native-detect-maestro downloads](https://badgen.net/npm/dm/react-native-detect-maestro)](https://www.npmtrends.com/react-native-detect-maestro)
[![react-native-detect-maestro install size](https://packagephobia.com/badge?p=react-native-detect-maestro)](https://packagephobia.com/result?p=react-native-detect-maestro)
[![CI](https://github.com/retyui/react-native-detect-maestro/actions/workflows/ci.yaml/badge.svg)](https://github.com/retyui/react-native-detect-maestro/actions/workflows/ci.yaml)
[![E2E](https://github.com/retyui/react-native-detect-maestro/actions/workflows/e2e.yaml/badge.svg)](https://github.com/retyui/react-native-detect-maestro/actions/workflows/e2e.yaml)

Use this library to detect React Native App is running within the context of Maestro. (based
on: https://maestro.mobile.dev/advanced/detect-maestro-in-your-app)

* support React Native's New & Old Architecture

## Getting started

```shell
yarn add react-native-detect-maestro
# or
npm install react-native-detect-maestro

# and then
npx pod-install
```

> [!NOTE]
> **Swift Package Manager** — React Native 0.87+ can build the iOS side with SPM. Once your app uses React Native's SPM integration, this library's `Package.swift` is picked up by the autolinker automatically. Apps using CocoaPods keep working through `DetectMaestro.podspec`, which compiles the same `ios/` sources.

> ⚠️ Note: if you are using React Native `0.72.x` you need to add `use_modular_headers!` in your `ios/Podfile` .

## Usage

```tsx
import {DetectMaestro} from 'react-native-detect-maestro';

DetectMaestro.isMaestro() // true or false
```

## Compatible table

- Android
  - New Architecture (react-native `0.70+`)
  - Old Architecture (react-native `0.65+`)
- iOS
  - New Architecture (react-native `0.70+`)
  - Old Architecture (react-native `0.65+`)

## License

MIT
