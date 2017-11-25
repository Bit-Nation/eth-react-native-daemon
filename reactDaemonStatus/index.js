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

var AppDelegate = require('NativeModules').AppDelegate;

function startFunction() {
    AppDelegate.startDaemon();
}

function stopFunction() {
    AppDelegate.stopDaemon();
}

class Daemon extends React.Component {
  render() {
    var contents;
    return (
      <View style={styles.container}>
        <Button
  			onPress={() => { Alert.alert('The Node started successfully!'); startFunction() }}
  			title='Start Node'
		/>
		<Button
  			onPress={() => { Alert.alert('The Node it\'s stopped now'); stopFunction() }}
  			title='Stop Node'
		/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  }
});

// Module name
AppRegistry.registerComponent('Daemon', () => Daemon);