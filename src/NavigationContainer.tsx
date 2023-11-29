import * as React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {StackNavigationProp, createStackNavigator} from '@react-navigation/stack';
import {app as Home} from './App.bs';
import Page1 from './Page1';

const Stack = createStackNavigator();

function App(props: StackNavigationProp<{}>) {
  return (
      <NavigationContainer>
        <Stack.Navigator {...props}>
          <Stack.Screen name="Home" component={Home} />
          <Stack.Screen name="Page1" component={Page1} />
        </Stack.Navigator>
      </NavigationContainer>
  );
}
export { App };
