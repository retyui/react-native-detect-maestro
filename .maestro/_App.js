import React from 'react';
import {View, Button} from 'react-native';
import {DetectMaestro} from 'react-native-detect-maestro';

export default function App() {
    const [val, setVal] = React.useState(null);

    return (
        <View style={{flex: 1, justifyContent: 'center'}}>
            <Button
                testID="my_btn"
                title={`is_maestro:${JSON.stringify(val)}`}
                onPress={() => setVal(DetectMaestro.isMaestro())}
            />
        </View>
    );
}
