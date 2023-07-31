# react-native-detect-maestro

[![react-native-detect-maestro on npm](https://badgen.net/npm/v/react-native-detect-maestro)](https://www.npmjs.com/package/react-native-detect-maestro)
[![react-native-detect-maestro downloads](https://badgen.net/npm/dm/react-native-detect-maestro)](https://www.npmtrends.com/react-native-detect-maestro)
[![react-native-detect-maestro install size](https://packagephobia.com/badge?p=react-native-detect-maestro)](https://packagephobia.com/result?p=react-native-detect-maestro)
[![CI status](https://github.com/retyui/react-native-detect-maestro/actions/workflows/android_ios.yaml/badge.svg)](https://github.com/retyui/react-native-detect-maestro/actions/workflows/android_ios.yaml)

Use this library to detect React Native App is running within the context of Maestro. (based
on: https://maestro.mobile.dev/advanced/detect-maestro-in-your-app)

* support React Native's New & Old Architecture

## Getting started

```shell
yarn add react-native-detect-maestro
# or
npm install react-native-detect-maestro

# and then
nxp pod-install
```

> ⚠️ Note: if you are using React Native `0.72.x` you need to add `use_modular_headers!` in your `ios/Podfile` .

## Usage

```tsx
import {DetectMaestro} from 'react-native-detect-maestro';

DetectMaestro.isMaestro() // true or false
```

## Compatible table

|                   | 0.72.x | 0.71.x | 0.70.x | 0.69.x | >=0.68.x |
|-------------------|--------|--------|--------|--------|----------|
| Android New Arch. | ✅      | ✅      | ✅      | ❌      | ❌        |
| Android Old Arch. | ✅      | ✅      | ✅      | ✅      | ❌        |
| iOS New Arch.     | ✅      | ✅      | ✅      | ✅      | ❌        |
| iOS Old Arch.     | ✅      | ✅      | ✅      | ✅      | ❌        |

## License

MIT
