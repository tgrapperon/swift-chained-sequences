// swift-tools-version: 5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "swift-chained-sequences",
  products: [
    .library(
      name: "AsyncChainSequence",
      targets: ["AsyncChainSequence"]),
    .library(
      name: "AsyncDisparateChainSequence",
      targets: ["AsyncDisparateChainSequence"]),
    .library(
      name: "ChainSequence",
      targets: ["ChainSequence"]),
    .library(
      name: "DisparateChainSequence",
      targets: ["DisparateChainSequence"]),
    .executable(name: "variadics-generator", targets: ["variadics-generator"]),
  ],
  
  targets: [
    .target(
      name: "AsyncChainSequence",
      dependencies: [
        "AsyncChainSequenceCommon",
        "ChainSequenceCore",
      ]),
    .testTarget(
      name: "AsyncChainSequenceTests",
      dependencies: ["AsyncChainSequence"]),

    .target(
      name: "AsyncDisparateChainSequence",
      dependencies: [
        "AsyncChainSequenceCommon",
        "ChainSequenceCore",
      ]),

    .target(
      name: "ChainSequence",
      dependencies: [
        "ChainSequenceCommon",
        "ChainSequenceCore",
      ]),
    .testTarget(
      name: "ChainSequenceTests",
      dependencies: ["ChainSequence"]),

    .target(
      name: "DisparateChainSequence",
      dependencies: [
        "ChainSequenceCommon",
        "ChainSequenceCore",
      ]),

    .target(
      name: "ChainSequenceCore",
      dependencies: []),

    .target(
      name: "ChainSequenceCommon",
      dependencies: [
        "ChainSequenceCore",
      ]),

    .target(
      name: "AsyncChainSequenceCommon",
      dependencies: [
        "ChainSequenceCore",
      ]),

    .executableTarget(name: "variadics-generator"),
  ]
)
