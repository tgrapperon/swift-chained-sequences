@_exported import ChainSequenceCore

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
public struct AsyncChainSequence<Sequences> {
  @usableFromInline
  internal let sequences: Sequences
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension AsyncChainSequence: AsyncSequence where Sequences: AsyncSequence {
  public typealias Element = Sequences.Element

  public init(
    @ChainSequenceBuilder sequences: () -> Sequences
  ) {
    self.sequences = sequences()
  }
  
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(sequences)
  }
  
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Sequences.Element
    private var sequences: Sequences.AsyncIterator
    init(
      _ sequences: Sequences
    ) {
      self.sequences = sequences.makeAsyncIterator()
    }
    public mutating func next() async throws -> Element? {
      try await sequences.next()
    }
  }
}
