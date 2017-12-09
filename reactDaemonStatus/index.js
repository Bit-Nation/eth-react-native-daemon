'use strict';

import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  Button,
  Alert,
  View
} from 'react-native';
import Header from './src/components/Header';

var AppDelegate = require('NativeModules').AppDelegate;

function startFunction() {
    AppDelegate.startDaemon();
}

function stopFunction() {
    AppDelegate.stopDaemon();
}

console.ignoredYellowBox = ["RCTBatchedBridge is deprecated and will be removed in a future React Native release."];

class Daemon extends React.Component {
  render() {
    var contents;
    const { viewStyle } = styles;
    return (
      <View>
        <Header headerText={'Bination'} />
        <View style={viewStyle}>
            <Button
      			   onPress={() => { Alert.alert('The Node started successfully!'); startFunction()
               //fetch('http://localhost:8545')
                //       .then(console.info)
                  //     .catch(console.error);
             }}
      			   title='Start Node'
    		    />
        		<Button
          			onPress={() => { Alert.alert('The Node it\'s stopped now'); stopFunction() }}
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

AppRegistry.registerComponent('Daemon', () => Daemon);
