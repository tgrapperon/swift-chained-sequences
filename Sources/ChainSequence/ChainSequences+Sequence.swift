// BEGIN AUTO-GENERATED CONTENT

@_exported import ChainSequenceCore
@_exported import ChainSequenceCommon

extension Chain.Sequence2 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.Iterator
    @usableFromInline
    internal var baseIterator2: Base2.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2
    ) {
      self.baseIterator1 = base1.makeIterator()
      self.baseIterator2 = base2.makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      baseIterator1.next()
      ?? baseIterator2.next()
    }
  }
}

extension Chain.Sequence2: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2)
  }
}

extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2>(
    _ s1: S1,
    _ s2: S2
  )
  -> Chain.Sequence2<S1, S2>
  {
    Chain.Sequence2(s1, s2)
  }
}

extension Chain.Sequence3 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.Iterator
    @usableFromInline
    internal var baseIterator2: Base2.Iterator
    @usableFromInline
    internal var baseIterator3: Base3.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3
    ) {
      self.baseIterator1 = base1.makeIterator()
      self.baseIterator2 = base2.makeIterator()
      self.baseIterator3 = base3.makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      baseIterator1.next()
      ?? baseIterator2.next()
      ?? baseIterator3.next()
    }
  }
}

extension Chain.Sequence3: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3)
  }
}

extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3
  )
  -> Chain.Sequence3<S1, S2, S3>
  {
    Chain.Sequence3(s1, s2, s3)
  }
}

extension Chain.Sequence4 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Base1.Element

    // We use nested `Chain.Sequence2` which is benchmarking faster than any flattened
    // implementation.
    @usableFromInline
    internal var baseIterator:
      Chain.Sequence2<
        Chain.Sequence2<
          Chain.Sequence2<
            Base1, Base2
          >, Base3
        >, Base4
     >.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4
    ) {
      self.baseIterator = 
        Chain.Sequence2(
          Chain.Sequence2(
            Chain.Sequence2(base1, base2),
          base3),
        base4)
      .makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      baseIterator.next()
    }
  }
}

extension Chain.Sequence4: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4)
  }
}

extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4
  )
  -> Chain.Sequence4<S1, S2, S3, S4>
  {
    Chain.Sequence4(s1, s2, s3, s4)
  }
}

extension Chain.Sequence5 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Base1.Element

    // We use nested `Chain.Sequence2` which is benchmarking faster than any flattened
    // implementation.
    @usableFromInline
    internal var baseIterator:
      Chain.Sequence2<
        Chain.Sequence2<
          Chain.Sequence2<
            Chain.Sequence2<
              Base1, Base2
            >, Base3
          >, Base4
        >, Base5
     >.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5
    ) {
      self.baseIterator = 
        Chain.Sequence2(
          Chain.Sequence2(
            Chain.Sequence2(
              Chain.Sequence2(base1, base2),
            base3),
          base4),
        base5)
      .makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      baseIterator.next()
    }
  }
}

extension Chain.Sequence5: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4, base5)
  }
}

extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4, S5>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5
  )
  -> Chain.Sequence5<S1, S2, S3, S4, S5>
  {
    Chain.Sequence5(s1, s2, s3, s4, s5)
  }
}

extension Chain.Sequence6 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Base1.Element

    // We use nested `Chain.Sequence2` which is benchmarking faster than any flattened
    // implementation.
    @usableFromInline
    internal var baseIterator:
      Chain.Sequence2<
        Chain.Sequence2<
          Chain.Sequence2<
            Chain.Sequence2<
              Chain.Sequence2<
                Base1, Base2
              >, Base3
            >, Base4
          >, Base5
        >, Base6
     >.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5, _ base6: Base6
    ) {
      self.baseIterator = 
        Chain.Sequence2(
          Chain.Sequence2(
            Chain.Sequence2(
              Chain.Sequence2(
                Chain.Sequence2(base1, base2),
              base3),
            base4),
          base5),
        base6)
      .makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      baseIterator.next()
    }
  }
}

extension Chain.Sequence6: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4, base5, base6)
  }
}

extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4, S5, S6>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5,
    _ s6: S6
  )
  -> Chain.Sequence6<S1, S2, S3, S4, S5, S6>
  {
    Chain.Sequence6(s1, s2, s3, s4, s5, s6)
  }
}

extension Chain.Sequence7 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Base1.Element

    // We use nested `Chain.Sequence2` which is benchmarking faster than any flattened
    // implementation.
    @usableFromInline
    internal var baseIterator:
      Chain.Sequence2<
        Chain.Sequence2<
          Chain.Sequence2<
            Chain.Sequence2<
              Chain.Sequence2<
                Chain.Sequence2<
                  Base1, Base2
                >, Base3
              >, Base4
            >, Base5
          >, Base6
        >, Base7
     >.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5, _ base6: Base6, _ base7: Base7
    ) {
      self.baseIterator = 
        Chain.Sequence2(
          Chain.Sequence2(
            Chain.Sequence2(
              Chain.Sequence2(
                Chain.Sequence2(
                  Chain.Sequence2(base1, base2),
                base3),
              base4),
            base5),
          base6),
        base7)
      .makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      baseIterator.next()
    }
  }
}

extension Chain.Sequence7: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4, base5, base6, base7)
  }
}

extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4, S5, S6, S7>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5,
    _ s6: S6,
    _ s7: S7
  )
  -> Chain.Sequence7<S1, S2, S3, S4, S5, S6, S7>
  {
    Chain.Sequence7(s1, s2, s3, s4, s5, s6, s7)
  }
}

// END AUTO-GENERATED CONTENT