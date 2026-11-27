---
"react-native-detect-maestro": minor
---

Detect Maestro 2.x via the `isMaestro` launch argument. Maestro 2.x picks a random driver port, so the port check no longer works. Pass the argument in your flows:

```yaml
- launchApp:
    arguments:
      isMaestro: true
```

On Android it is read from the launch intent extras, on iOS from the process arguments. Maestro 1.x is still detected without the argument (driver port `7001` on Android, `22087` on iOS).
