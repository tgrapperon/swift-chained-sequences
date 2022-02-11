public enum Chain {}

@resultBuilder
public enum ChainSequenceBuilder {
  public static func buildBlock(_ components: Never...) -> Never {
    fatalError()
  }
}
