import React from 'react';
import {View, Button} from 'react-native';
import {DetectMaestro} from 'react-native-detect-maestro';

const rootStyle = {flex: 1, justifyContent: 'center'}

function App() {
  const [title, setTitle] = React.useState('is_maestro:null');
  const onPress = React.useCallback(() => setTitle(`is_maestro:${JSON.stringify(DetectMaestro.isMaestro())}`),[]);
  return (
    <View style={rootStyle}>
      <Button
        title={title}
        onPress={onPress}
        testID="my_btn"
      />
    </View>
  );
}

export default App;
