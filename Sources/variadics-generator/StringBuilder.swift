@resultBuilder
enum StringBuilder {
  typealias Expression = String
  typealias Component = [String]

  static func buildExpression(_ expression: Expression) -> Component {
    [expression]
  }
  static func buildBlock(_ components: Component...) -> Component {
    components.flatMap { $0 }
  }
  static func buildArray(_ components: [Component]) -> Component {
    components.flatMap { $0 }
  }
  static func buildOptional(_ component: Component?) -> Component {
    component ?? []
  }
  static func buildEither(first component: Component) -> Component {
    component
  }
  static func buildEither(second component: Component) -> Component {
    component
  }
  static func buildLimitedAvailability(_ component: Component) -> Component {
    component
  }
  static func buildFinalResult(_ component: Component) -> String {
    component.joined(separator: "\n")
  }
}

extension String {
  // Using String.init can't resolve unambiguously.
  static func build(
    @StringBuilder lines: () -> String
  ) -> String {
    lines()
  }
}

func list<C>(
  _ sequence: C,
  separator: String = ", ",
  terminator: String = "",
  @StringBuilder _ component: @escaping (C.Element) -> String
) -> String where C: Sequence {
  sequence.map(component).joined(separator: separator) + terminator
}

extension String {
  func indent(_ amount: Int) -> String {
    components(separatedBy: .newlines)
      .map { String(repeating: "  ", count: amount) + $0 }
      .joined(separator: "\n")
  }
}
