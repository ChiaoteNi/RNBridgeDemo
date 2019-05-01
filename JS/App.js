/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';
import {
  NativeModules,
  NativeAppEventEmitter
} from 'react-native'

const RNDemoView = require('./Components/RNView.ios.js');
const RNVideoView = require('./Components/RNVideoView.ios.js');
var RNManager = NativeModules.RNManager;

type Props = {};

export default class App extends Component<Props> {
  componentDidMount = () => {
    RNManager.sendMsg("調用sendMsg方法", 1)
    RNManager.sendDic({
      value: 1,
      txt: "測試測試"
    }, "訊息傳到")
    RNManager.sendParam("調用sendParam方法", () => {
      console.log("call back囉");
    })
  }

  render() {
    return (
      <View style={styles.container}>
        <RNVideoView style={styles.view} />
        <RNDemoView style={styles.view} txt={'哈哈'} />
        <RNDemoView style={styles.view} txt={'拉拉'} onSomeAction={() => (
          console.log("ＹＹＹＹＹＹＹＹＹＹ")
        )} />
        <RNDemoView style={styles.view} />
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  view: {
    margin: 10,
    width: "50%",
    height: 100,
    backgroundColor: 'red',
    borderRadius: 10
  }
});

AppRegistry.registerComponent('RNDemoView', () => RNDemoView);
