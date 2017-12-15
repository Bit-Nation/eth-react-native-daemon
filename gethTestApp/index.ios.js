'use strict';

import React from 'react';
import {
  AppRegistry,
  Button,
  Alert,
  View,
  NativeModules
} from 'react-native';
import Header from './src/components/Header';

const AppDelegate = NativeModules.AppDelegate;

function startFunction() {
    AppDelegate.startDaemon();
}

function stopFunction() {
    AppDelegate.stopDaemon();
}

console.ignoredYellowBox = [
  'RCTBatchedBridge is deprecated and will be removed in a future React Native release.'];

class gethTestApp extends React.Component {
  render() {
    const { viewStyle } = styles;
    return (
      <View>
        <Header headerText={'Bination\'s Geth Node'} />
        <View style={viewStyle}>
            <Button
              onPress={() => {
                Alert.alert('The Node started successfully!'); startFunction();
              }}
              title='Start Node'
            />
            <Button
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
    justifyContent: 'center',
    alignItems: 'center',
    height: 500,
    position: 'relative'
  }
};

AppRegistry.registerComponent('gethTestApp', () => gethTestApp);
