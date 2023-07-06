import { StyleSheet, Text, View } from "react-native";

import { ExpoPencilkitView } from "expo-pencilkit";

export default function App() {
  return (
    <View style={{ flex: 1 }}>
      <ExpoPencilkitView onDrawingUpdate={(event) => {}} style={{ flex: 1 }} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
