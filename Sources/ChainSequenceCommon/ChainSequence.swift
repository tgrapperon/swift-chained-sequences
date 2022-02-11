@_exported import ChainSequenceCore

public struct ChainSequence<Sequences> {
  @usableFromInline
  internal let sequences: Sequences
}

extension ChainSequence: Sequence where Sequences: Sequence {
  public typealias Element = Sequences.Element
  
  public init(
    @ChainSequenceBuilder sequences: () -> Sequences
  ) {
    self.sequences = sequences()
  }

  public func makeIterator() -> Iterator {
    Iterator(sequences)
  }

  public struct Iterator: IteratorProtocol {
    public typealias Element = Sequences.Element
    private var sequences: Sequences.Iterator
    init(
      _ sequences: Sequences
    ) {
      self.sequences = sequences.makeIterator()
    }
    public mutating func next() -> Element? {
      sequences.next()
    }
  }
}

extension ChainSequence: Collection where Sequences: Collection {
  public typealias Index = Sequences.Index
  @inlinable
  public var startIndex: Index { sequences.startIndex }

  @inlinable
  public var endIndex: Index { sequences.endIndex }

  @inlinable
  public subscript(position: Index) -> Sequences.Element {
    sequences[position]
  }

  @inlinable
  public func index(after i: Index) -> Sequences.Index {
    sequences.index(after: i)
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    sequences.index(i, offsetBy: distance)
  }

  @inlinable
  public func index(
    _ i: Index, offsetBy distance: Int, limitedBy limit: Index
  ) -> Index? {
    sequences.index(i, offsetBy: distance, limitedBy: limit)
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    sequences.distance(from: start, to: end)
  }
}

extension ChainSequence: BidirectionalCollection where Sequences: BidirectionalCollection {
  @inlinable
  public func index(before i: Index) -> Index {
    sequences.index(before: i)
  }
}
extension ChainSequence: RandomAccessCollection where Sequences: RandomAccessCollection {}





