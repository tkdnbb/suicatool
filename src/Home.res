open ReactNative
open ReactNavigation

include ReactNativeHelloWorldUtils

module HomeScreen = {
  @react.component(: Core.screenProps)
  let make = (~navigation as _, ~route as _) =>
    <Text> {"Hello Reasonable Person!"->React.string} </Text>
}

module ModalScreen = {
  @react.component(: Core.screenProps)
  let make = (~navigation as _, ~route as _) => <Text> {"Hello From Modal"->React.string} </Text>
}

module P = {
  type params
}
module MainStackScreen = {
  include Stack.Make(P)

  @react.component(: Core.screenProps)
  let make = (~navigation as _, ~route as _) =>
    <Navigator>
      <Screen
        name="Home"
        component=HomeScreen.make
        // options={props => {
        //   headerRight: _ =>
        //     <Button
        //       onPress={_ => props.navigation->Core.Navigation.navigate("MyModal")}
        //       title="Info"
        //       color="#f00"
        //     />,
        // title: switch props.route.params {
        // | Some(params) => (params->Core.Params.unsafeGetValue)["name"]
        // | None => "Reason"
        // },
        //}}
      />
    </Navigator>
}

module RootStackScreen = {
  include Stack.Make(P)

  @react.component
  let make = () =>
    <Native.NavigationContainer>
      // <Navigator screenOptions={_ => {presentation: #modal}}>
      <Navigator>
        <Screen name="Main" component=MainStackScreen.make />
        // <Screen name="MyModal">
        //   {({navigation, route}) => <ModalScreen navigation route />}
        // </Screen>
      </Navigator>
    </Native.NavigationContainer>
}

@react.component
let app = () => {
  <RootStackScreen />
}
