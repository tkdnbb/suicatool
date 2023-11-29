open ReactNative

include ReactNativeHelloWorldUtils

let styles = {
  open Style
  StyleSheet.create({
    "sectionContainer": viewStyle(~marginTop=32.->dp, ~paddingHorizontal=24.->dp, ()),
    "sectionTitle": textStyle(~fontSize=24., ~fontWeight=#600, ()),
    "sectionDescription": textStyle(~marginTop=8.->dp, ~fontSize=18., ~fontWeight=#400, ()),
    "highlight": textStyle(~fontWeight=#700, ()),
  })
}

let useIsDarkMode = () => {
  Appearance.useColorScheme()
  ->Belt.Option.map(scheme => scheme === #dark)
  ->Belt.Option.getWithDefault(false)
}

module Section = {
  @react.component
  let make = (~title: string, ~children) => {
    let isDarkMode = useIsDarkMode()
    <View style={styles["sectionContainer"]}>
      <Text
        style={
          open Style
          array([
            styles["sectionTitle"],
            textStyle(~color=isDarkMode ? colors.white : colors.black, ()),
          ])
        }>
        {title->React.string}
      </Text>
      <Text
        style={
          open Style
          array([
            styles["sectionDescription"],
            textStyle(~color=isDarkMode ? colors.white : colors.black, ()),
          ])
        }>
        {children}
      </Text>
    </View>
  }
}

@react.component
let app = () => {
  let isDarkMode = useIsDarkMode()
  <SafeAreaView>
    <StatusBar barStyle={isDarkMode ? #"light-content" : #"dark-content"} />
    <ScrollView
      contentInsetAdjustmentBehavior=#automatic
      style={
        open Style
        viewStyle(~backgroundColor=isDarkMode ? colors.darker : colors.lighter, ())
      }>
      <Header />
      <Section title={"Step One"}>
        {"Edit "->React.string}
        <Text style={styles["highlight"]}> {"src/App.re"->React.string} </Text>
        {" to change this screen and then come back to see your edits."->React.string}
      </Section>
      <Section title={"See Your Changes"}>
        <ReloadInstructions />
      </Section>
      <Section title={"Debug"}>
        <DebugInstructions />
      </Section>
      <Section title={"Learn More"}>
        {"Read the docs to discover what to do next:"->React.string}
      </Section>
      <Section title={"ReScript React Native"}>
        {
          let rrnUrl = "https://rescript-react-native.github.io/"
          <TouchableOpacity onPress={_ => openURLInBrowser(rrnUrl)}>
            <Text
              style={
                open Style
                style(~marginTop=8.->dp, ~fontSize=18., ~fontWeight=#400, ~color=colors.primary, ())
              }>
              {rrnUrl->React.string}
            </Text>
          </TouchableOpacity>
        }
      </Section>
      <LearnMoreLinks />
    </ScrollView>
  </SafeAreaView>
}
