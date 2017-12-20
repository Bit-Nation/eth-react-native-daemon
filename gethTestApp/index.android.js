'use strict';

import React from 'react';
import {
  AppRegistry,
  Button,
  Alert,
  View
} from 'react-native';
import Header from './src/components/Header';
import Node from './src/components/Node';


function startFunction() {
    Node.startDaemon();
}

function stopFunction() {
    Node.stopDaemon();
}

console.ignoredYellowBox = [
  'RCTBatchedBridge is deprecated and will be removed in a future React Native release.'];

class gethTestApp extends React.Component {
  render() {
    const { viewStyle, buttonStyle } = styles;
    return (
      <View>
        <Header headerText={'Bination\'s Geth Node'} />
        <View style={viewStyle}>
            <Button
              style={buttonStyle}
              onPress={() => {
                Alert.alert('The Node started successfully!'); startFunction();
              }}
              title='Start Node'
            />
        </View>
        <View style={viewStyle}>
            <Button
              style={buttonStyle}
              onPress={() => {
                Alert.alert('The Node it\'s stopped now'); stopFunction();
              }}
              title='Stop Node'
            />
        </View>
      </View>
    );
  }
}

const styles = {
  viewStyle: {
    alignItems: 'center',
    height: 70,
    marginTop: 30,
    position: 'relative'
  },
  buttonStyle: {
    flex: 1,
    alingSelf: 'stretch'
  }
};

AppRegistry.registerComponent('gethTestApp', () => gethTestApp);
