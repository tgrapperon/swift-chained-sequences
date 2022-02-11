import Foundation

let namespace = "Chain"
enum ElementType: Equatable {
  case homogeneous
  case disparate
}
enum Concurrency: Equatable {
  case sync
  case async
}

func typename(_ element: ElementType, _ concurrency: Concurrency) -> String {
  switch element {
  case .homogeneous:
    return concurrency == .async ? "AsyncSequence" : "Sequence"
  case .disparate:
    return concurrency == .async ? "AsyncDisparateSequence" : "DisparateSequence"
  }
}

func filename(_ element: ElementType, _ concurrency: Concurrency) -> String {
  switch element {
  case .homogeneous:
    return concurrency == .async
      ? "AsyncChainSequence/AsyncChainSequences" : "ChainSequence/ChainSequences"
  case .disparate:
    return concurrency == .async
      ? "AsyncDisparateChainSequence/AsyncDisparateChainSequences"
      : "DisparateChainSequence/DisparateChainSequences"
  }
}

let ordinals = [
  "Zeroth",
  "First", "Second", "Third", "Fourth",
  "Fifth", "Sixth", "Seventh", "Eighth",
  "Ninth", "Tenth", "Eleventh", "Twelfth",
]

let nilCoalescingMaxArity = 3

extension Int {
  var th: String { ordinals[self].lowercased() }
  var Th: String { ordinals[self] }
}

func source(@StringBuilder string: () -> String) -> String {
  String.build {
    "// BEGIN AUTO-GENERATED CONTENT"
    ""
    string()
    "// END AUTO-GENERATED CONTENT"
  }
}

struct GeneratedSource {
  init(
    path: String, @StringBuilder content: () -> String
  ) {
    self.path = path
    self.content = content()
  }

  var path: String
  var content: String
  func rootURL(file: String = #file) -> URL {
    URL(fileURLWithPath: file)
      .deletingLastPathComponent()  // variadic-generator/
      .deletingLastPathComponent()  // Sources/
  }
  func write() throws {
    let url = rootURL().appendingPathComponent(path)
    try content.data(using: .utf8)?.write(to: url)
  }
}

@main
struct VariadicGenerator {
  static func main() {
    let range = 2...7

    func generateEitherDeclarations() -> GeneratedSource {
      GeneratedSource(path: "ChainSequenceCore/Either.swift") {
        source {
          for i in range {
            eitherDecl(i)
            ""
          }
        }
      }
    }

    func generateChainSequenceNTypeDeclarations(
      elementType: ElementType, concurrency: Concurrency
    ) -> GeneratedSource {
      let filename = filename(elementType, concurrency)
      return GeneratedSource(path: "\(filename).swift") {
        source {
          "@_exported import ChainSequenceCore"
          if concurrency == .sync {
            "@_exported import ChainSequenceCommon"
          } else {
            "@_exported import AsyncChainSequenceCommon"
          }
          ""
          for i in range {
            sequenceTypeDecl(i, elementType, concurrency)
            ""
          }
        }
      }
    }

    func generateChainSequenceNSequenceConformance(
      elementType: ElementType, concurrency: Concurrency
    ) -> GeneratedSource {
      let filename = filename(elementType, concurrency)
      return GeneratedSource(path: "\(filename)+Sequence.swift") {
        source {
          "@_exported import ChainSequenceCore"
          if concurrency == .sync {
            "@_exported import ChainSequenceCommon"
          } else {
            "@_exported import AsyncChainSequenceCommon"
          }
          ""
          for i in range {
            sequenceConformanceDecl(i, elementType, concurrency)
            ""
          }
        }
      }
    }

    func generateChainSequenceNCollectionConformance(
      elementType: ElementType, concurrency: Concurrency
    ) -> GeneratedSource {
      let filename = filename(elementType, concurrency)
      return GeneratedSource(path: "\(filename)+Collection.swift") {
        source {
          "@_exported import ChainSequenceCore"
          "@_exported import ChainSequenceCommon"
          ""
          for i in range {
            collectionConformanceDecl(i, elementType)
            ""
          }
        }
      }
    }

    let sources = [
      generateEitherDeclarations(),

      generateChainSequenceNTypeDeclarations(elementType: .homogeneous, concurrency: .sync),
      generateChainSequenceNSequenceConformance(elementType: .homogeneous, concurrency: .sync),
      generateChainSequenceNCollectionConformance(elementType: .homogeneous, concurrency: .sync),

      generateChainSequenceNTypeDeclarations(elementType: .disparate, concurrency: .sync),
      generateChainSequenceNSequenceConformance(elementType: .disparate, concurrency: .sync),
      generateChainSequenceNCollectionConformance(elementType: .homogeneous, concurrency: .sync),

      generateChainSequenceNTypeDeclarations(elementType: .homogeneous, concurrency: .async),
      generateChainSequenceNSequenceConformance(elementType: .homogeneous, concurrency: .async),

      generateChainSequenceNTypeDeclarations(elementType: .disparate, concurrency: .async),
      generateChainSequenceNSequenceConformance(elementType: .disparate, concurrency: .async),
    ]

    do {
      for source in sources {
        try source.write()
      }
    } catch {
      print(error)
    }
  }
}

func eitherDecl(_ n: Int) -> String {
  String.build {
    "extension \(namespace) {"
    "  public enum Either\(n)<\(list(1...n){ $0.Th })> {"
    for i in 1...n {
      "    case \(i.th)(\(i.Th))"
    }
    "  }"
    "}"
    ""
    // Conditional conformances
    "extension \(namespace).Either\(n): Equatable"
    "  where"
    list(1...n, separator: ",\n") {
      "    \($0.Th): Equatable"
    }
    "  {}"
    ""
    "extension \(namespace).Either\(n): Hashable"
    "  where"
    list(1...n, separator: ",\n") {
      "    \($0.Th): Hashable"
    }
    "  {}"
    ""
    "extension \(namespace).Either\(n): Comparable"
    "  where"
    list(1...n, separator: ",\n") {
      "    \($0.Th): Comparable"
    }
    "  {"
    "    @inlinable"
    "    internal var rank: Int {"
    "      switch self {"
    for i in 1...n {
      "      case .\(i.th): return \(i)"
    }
    "      }"
    "    }"
    ""
    "    @inlinable"
    "    public static func < (lhs: Self, rhs: Self) -> Bool {"
    "      switch (lhs, rhs) {"
    for i in 1...n {
      "      case let (.\(i.th)(l), .\(i.th)(r)):"
      "        return l < r"
    }
    "      default: "
    "        return lhs.rank < rhs.rank"
    "      }"
    "    }"
    "  }"
    ""
    "@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)"
    "extension \(namespace).Either\(n): Identifiable"
    "  where"
    list(1...n, separator: ",\n", terminator: ",") {
      "    \($0.Th): Identifiable"
    }
    list(2...n, separator: ",\n") {
      "    \(1.Th).ID == \($0.Th).ID"
    }
    "  {"
    "    public typealias ID = \(1.Th).ID"
    "    @inlinable"
    "    public var id: ID {"
    "      switch self {"
    for i in 1...n {
      "      case let .\(i.th)(value):"
      "        return value.id"
    }
    "      }"
    "    }"
    "  }"
  }
}

func sequenceTypeDecl(
  _ n: Int, _ element: ElementType, _ concurrency: Concurrency
) -> String {
  let concurrencyPrefix = concurrency == .async ? "Async" : ""
  return String.build {
    if concurrency == .async {
      "@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)"
    }
    "extension \(namespace) {"
    "  public struct \(typename(element, concurrency))\(n)<\(list(1...n) { "Base\($0)" })>"
    "  where"
    list(1...n, separator: ",\n", terminator: element == .homogeneous ? "," : "") {
      "    Base\($0): \(concurrencyPrefix)Sequence"
    }
    if element == .homogeneous {
      list(2...n, separator: ",\n") {
        "    Base1.Element == Base\($0).Element"
      }
    }
    "  {"
    if element == .homogeneous {
      "    public typealias Element = Base1.Element"
    } else {
      "    public typealias Element = \(namespace).Either\(n)<"
      list(1...n, separator: ",\n") { "      Base\($0).Element" }
      "    >"
    }
    ""
    for i in 1...n {
      "    public var base\(i): Base\(i)"
    }
    ""
    "    @inlinable"
    "    public init("
    list(1...n, separator: ",\n") { "      _ base\($0): Base\($0)" }
    "    ) {"
    for i in 1...n {
      "      self.base\(i) = base\(i)"
    }
    "    }"
    "  }"
    "}"
  }
}

func sequenceConformanceDecl(_ n: Int, _ element: ElementType, _ concurrency: Concurrency) -> String
{
  let concurrencyPrefix = concurrency == .async ? "Async" : ""

  let iterator = String.build {
    if concurrency == .async {
      "@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)"
    }
    "extension \(namespace).\(typename(element, concurrency))\(n) {"
    "  public struct \(concurrencyPrefix)Iterator: \(concurrencyPrefix)IteratorProtocol {"
    if element == .homogeneous {
      "    public typealias Element = Base1.Element"
    } else {
      "    public typealias Element = \(namespace).Either\(n)<\(list(1...n){ "Base\($0).Element" })>"
    }
    ""
    if n <= nilCoalescingMaxArity || element == .disparate || concurrency == .async {
      for i in 1...n {
        "    @usableFromInline"
        "    internal var baseIterator\(i): Base\(i).\(concurrencyPrefix)Iterator"
      }
      if concurrency == .async {
        for i in 1...n {
          "    @usableFromInline"
          "    internal var isIterationFinished\(i): Bool = false"
        }
      }

    } else {
      "    // We use nested `\(namespace).\(typename(element, concurrency))2` which is benchmarking faster than any flattened"
      "    // implementation."
      "    @usableFromInline"
      "    internal var baseIterator:"
      for i in 0..<n - 1 {
        "      \(String(repeating: "  ", count: i))\(namespace).\(typename(element, concurrency))2<"
      }
      "      \(String(repeating: "  ", count: n-1))Base1, Base2"
      for i in 3...n {
        "      \(String(repeating: "  ", count: n-i+1))>, Base\(i)"
      }
      "     >.Iterator"
    }
    ""
    "    @inlinable"
    "    public init("
    "      " + list(1...n) { "_ base\($0): Base\($0)" }
    "    ) {"
    if n <= nilCoalescingMaxArity || element == .disparate || concurrency == .async {
      for i in 1...n {
        "      self.baseIterator\(i) = base\(i).make\(concurrencyPrefix)Iterator()"
      }
    } else {
      "      self.baseIterator = "
      for i in 0..<n - 1 {
        "        \(String(repeating: "  ", count: i))\(namespace).\(typename(element, concurrency))2(\(i == n - 2 ? "base1, base2)," : "")"
      }
      for i in 3...n {
        "      \(String(repeating: "  ", count: n-i+1))base\(i))\(i != n ? "," : "")"
      }
      "      .make\(concurrencyPrefix)Iterator()"
    }
    "    }"
    ""
    "    @inlinable"
    "    public mutating func next()\(concurrency == .async ? " async throws" : "") -> Element? {"
    if concurrency == .sync {
      if n <= nilCoalescingMaxArity && element == .homogeneous {
        "      " + list(1...n, separator: "\n      ?? ") { "baseIterator\($0).next()" }
      } else {
        if element == .homogeneous {
          "      baseIterator.next()"
        } else {
          for i in 1...n {
            "      if let next = baseIterator\(i).next() { return .\(i.th)(next) } "
          }
          "      return nil"
        }
      }
    } else {
      for i in 1...n {
        "      if !isIterationFinished\(i) {"
        "        if let next = try await baseIterator\(i).next() {"
        "          return \(element == .homogeneous ? "next" : ".\(i.th)(next)")"
        "        } else {"
        "          self.isIterationFinished\(i) = true"
        "        }"
        "      }"
      }
      "      return nil"
    }
    "    }"
    "  }"
    "}"
  }

  let extensions = String.build {
    ""
    if concurrency == .async {
      "@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)"
    }
    "extension \(namespace).\(typename(element, concurrency))\(n): \(concurrencyPrefix)Sequence {"
    "  @inlinable"
    "  public func make\(concurrencyPrefix)Iterator() -> \(concurrencyPrefix)Iterator {"
    "    \(concurrencyPrefix)Iterator(\(list(1...n) { "base\($0)" }))"
    "  }"
    "}"
    ""
    if concurrency == .async {
      "@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)"
    }
    "extension ChainSequenceBuilder {"
    if element == .disparate {
      "  @_disfavoredOverload"
    }
    "  public static func buildBlock<\(list(1...n, { "S\($0)"}))>("
    list(1...n, separator: ",\n") { "    _ s\($0): S\($0)" }
    "  )"
    "  -> \(namespace).\(typename(element, concurrency))\(n)<\(list(1...n, { "S\($0)"}))>"
    "  {"
    "    \(namespace).\(typename(element, concurrency))\(n)(\(list(1...n, { "s\($0)"})))"
    "  }"
    "}"
  }
  return String.build {
    iterator
    extensions
  }

}

func collectionConformanceDecl(_ n: Int, _ element: ElementType) -> String {
  let collection = String.build {
    "extension \(namespace).\(typename(element, .sync))\(n): Collection"
    "  where"
    list(1...n, separator: ",\n") {
      "  Base\($0): Collection"
    }
    "{"
    "  public typealias Index = \(namespace).Either\(n)<\(list(1...n) { "Base\($0).Index" })>"
    ""
    "  @inlinable"
    "  internal func normalize(_ index: Index) -> Index {"
    "    switch index {"
    for i in 1..<n {
      "    case let .\(i.th)(i):"
      "      if i != base\(i).endIndex { return index }"
      "      return normalize(.\((i+1).th)(base\(i+1).startIndex))"
    }
    "    default:"
    "      return index"
    "    }"
    "  }"
    ""
    "  @inlinable"
    "  public var startIndex: Index {"
    for i in 1...n {
      "    if !base\(i).isEmpty { return Index.\(i.th)(base\(i).startIndex) }"
    }
    "    return Index.\(n.th)(base\(n).endIndex)"
    "  }"
    ""
    "  @inlinable"
    "  public var endIndex: Index {"
    "    Index.\(n.th)(base\(n).endIndex)"
    "  }"
    ""
    "  @inlinable"
    "  public subscript(i: Index) -> Element {"
    "    switch i {"
    for i in 1...n {
      "     case let .\(i.th)(index):"
      if element == .homogeneous {
        "       return base\(i)[index]"
      } else {
        "       return .\(i.th)(base\(i)[index])"
      }
    }
    "    }"
    "  }"
    ""
    "  @inlinable"
    "  public func index(after i: Index) -> Index {"
    "    switch i {"
    for k in 1...n {
      "    case let .\(k.th)(i):"
      if k != n {
        "      assert(i != base\(k).endIndex)"
        "      return normalize(Index.\(k.th)(base\(k).index(after: i)))"
      } else {
        "      return Index.\(k.th)(base\(k).index(after: i))"
      }
    }
    "    }"
    "  }"
    ""
    indexOffsetByLimit(n).indent(1)
    ""
    distanceFromTo(n).indent(1)
    "}"
  }

  let bidirectional = String.build {
    "extension \(namespace).\(typename(element, .sync))\(n): BidirectionalCollection"
    "  where"
    list(1...n, separator: ",\n") {
      "  Base\($0): BidirectionalCollection"
    }
    "{"
    "  @inlinable"
    "  public func index(before i: Index) -> Index {"
    "    switch i {"
    for k in 1...n {
      "    case let .\(k.th)(j):"
      if k == 1 {
        "      assert(j != base\(k).startIndex)"
        "      return Index.\(k.th)(base\(k).index(before: j))"
      } else {
        "      if j == base\(k).startIndex {"
        "        return index(before: retroNormalize(i))"
        "      }"
        "      return Index.\(k.th)(base\(k).index(before: j))"
      }
    }
    "    }"
    "  }"
    ""
    "  @inlinable"
    "  internal func retroNormalize(_ index: Index) -> Index {"
    "  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k"
    "    switch index {"
    for i in 2...n {
      "    case let .\(i.th)(i):"
      "      if i != base\(i).startIndex { return index }"
      "      return retroNormalize(Index.\((i-1).th)(base\(i-1).endIndex))"
    }
    "    default:"
    "      return index"
    "    }"
    "  }"
    "}"
  }

  let randomAccess = String.build {
    "extension \(namespace).\(typename(element, .sync))\(n): RandomAccessCollection"
    "  where"
    list(1...n, separator: ",\n") {
      "  Base\($0): RandomAccessCollection"
    }
    "{}"
  }

  return String.build {
    collection
    ""
    bidirectional
    ""
    randomAccess
  }
}

func indexOffsetByLimit(_ n: Int) -> String {
  String.build {
    "@inlinable"
    "public func index(_ i: Index, offsetBy distance: Int) -> Index {"
    "  guard distance != 0 else { return i }"
    "  guard let result = _index(i, offsetBy: distance, limitedBy: nil)"
    "  else { fatalError(\"Index at distance \\(distance) from \\(i) is out of bounds\") }"
    "  return result"
    "}"
    ""
    "@inlinable"
    "  public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {"
    "    _index(i, offsetBy: distance, limitedBy: normalize(limit))"
    "}"
    ""
    "@inlinable"
    "func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {"
    "  guard distance != 0 else { return normalize(i) }"
    "  if distance > 0 {"
    "    switch i {"
    for k in 1...n {
      "    case let .\(k.th)(i):"
      "      let distanceToEnd = base\(k).distance(from: i, to: base\(k).endIndex)"
      "      if distanceToEnd <= distance {"
      "        let result = normalize(Index.\(k.th)(base\(k).index(i, offsetBy: distance)))"
      "        if let limit = limit {"
      "          return result <= limit ? result : nil"
      "        } else {"
      "          return result"
      "        }"
      if k < n {
        "      } else {"
        "        return _index(.\((k+1).th)(base\(k+1).startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)"
        "      }"
      } else {
        "      } else {"
        "        return nil"
        "      }"
      }
    }
    "    }"
    "  } else {"
    "    switch i {"
    for k in 1...n {
      "    case let .\(k.th)(i):"
      "      let distanceFromStart = base\(k).distance(from: i, to: base\(k).startIndex)"
      "      if distanceFromStart <= distance {"
      "        let result = normalize(Index.\(k.th)(base\(k).index(i, offsetBy: distance)))"
      "        if let limit = limit {"
      "          return result >= limit ? result : nil"
      "        } else {"
      "          return result"
      "        }"
      if k > 1 {
        "      } else {"
        "        return _index(.\((k-1).th)(base\(k-1).endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)"
        "      }"
      } else {
        "      } else {"
        "        return nil"
        "      }"
      }
    }
    "    }"
    "  }"
    "}"
  }
}

func distanceFromTo(_ n: Int) -> String {
  String.build {
    "@inlinable"
    "public func distance(from start: Index, to end: Index) -> Int {"
    "  switch (start, end) {"
    for i in 1...n {
      for j in 1...n {
        if i == j {
          "  case let (.\(i.th)(i), .\(j.th)(j)):"
          "    return base\(i).distance(from: i, to: j)"
        } else if i < j {
          "  case let (.\(i.th)(i), .\(j.th)(j)):"
          "    return base\(i).distance(from: i, to: base\(i).endIndex)"
          if j - i > 1 {
            for k in (i + 1)..<j {
              "      + base\(k).distance(from: base\(k).startIndex, to: base\(k).endIndex)"
            }
          }
          "      + base\(j).distance(from: base\(j).startIndex, to: j)"
        } else if i > j {
          "  case let (.\(i.th)(i), .\(j.th)(j)):"
          "    return base\(i).distance(from: i, to: base\(i).startIndex)"
          if i - j > 1 {
            for k in ((j + 1)..<i).reversed() {
              "      + base\(k).distance(from: base\(k).endIndex, to: base\(k).startIndex)"
            }
          }
          "      + base\(j).distance(from: base\(j).endIndex, to: j)"
        }
      }
    }
    "  }"
    "}"
  }
}
