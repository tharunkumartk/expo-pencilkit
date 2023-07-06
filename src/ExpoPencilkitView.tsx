import { requireNativeViewManager } from "expo-modules-core";
import * as React from "react";
import { ViewProps } from "react-native";

export type Props = {
  onDrawingUpdate: (event: { nativeEvent: { base64: string } }) => void;
} & ViewProps;

const NativeView: React.ComponentType<Props> =
  requireNativeViewManager("ExpoPencilkit");

export default function ExpoPencilkitView(props: Props) {
  return <NativeView {...props} />;
}