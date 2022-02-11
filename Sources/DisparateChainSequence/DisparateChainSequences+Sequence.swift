// BEGIN AUTO-GENERATED CONTENT

@_exported import ChainSequenceCore
@_exported import ChainSequenceCommon

extension Chain.DisparateSequence2 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Chain.Either2<Base1.Element, Base2.Element>

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
      if let next = baseIterator1.next() { return .first(next) } 
      if let next = baseIterator2.next() { return .second(next) } 
      return nil
    }
  }
}

extension Chain.DisparateSequence2: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2)
  }
}

extension ChainSequenceBuilder {
  @_disfavoredOverload
  public static func buildBlock<S1, S2>(
    _ s1: S1,
    _ s2: S2
  )
  -> Chain.DisparateSequence2<S1, S2>
  {
    Chain.DisparateSequence2(s1, s2)
  }
}

extension Chain.DisparateSequence3 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Chain.Either3<Base1.Element, Base2.Element, Base3.Element>

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
      if let next = baseIterator1.next() { return .first(next) } 
      if let next = baseIterator2.next() { return .second(next) } 
      if let next = baseIterator3.next() { return .third(next) } 
      return nil
    }
  }
}

extension Chain.DisparateSequence3: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3)
  }
}

extension ChainSequenceBuilder {
  @_disfavoredOverload
  public static func buildBlock<S1, S2, S3>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3
  )
  -> Chain.DisparateSequence3<S1, S2, S3>
  {
    Chain.DisparateSequence3(s1, s2, s3)
  }
}

extension Chain.DisparateSequence4 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Chain.Either4<Base1.Element, Base2.Element, Base3.Element, Base4.Element>

    @usableFromInline
    internal var baseIterator1: Base1.Iterator
    @usableFromInline
    internal var baseIterator2: Base2.Iterator
    @usableFromInline
    internal var baseIterator3: Base3.Iterator
    @usableFromInline
    internal var baseIterator4: Base4.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4
    ) {
      self.baseIterator1 = base1.makeIterator()
      self.baseIterator2 = base2.makeIterator()
      self.baseIterator3 = base3.makeIterator()
      self.baseIterator4 = base4.makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      if let next = baseIterator1.next() { return .first(next) } 
      if let next = baseIterator2.next() { return .second(next) } 
      if let next = baseIterator3.next() { return .third(next) } 
      if let next = baseIterator4.next() { return .fourth(next) } 
      return nil
    }
  }
}

extension Chain.DisparateSequence4: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4)
  }
}

extension ChainSequenceBuilder {
  @_disfavoredOverload
  public static func buildBlock<S1, S2, S3, S4>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4
  )
  -> Chain.DisparateSequence4<S1, S2, S3, S4>
  {
    Chain.DisparateSequence4(s1, s2, s3, s4)
  }
}

extension Chain.DisparateSequence5 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Chain.Either5<Base1.Element, Base2.Element, Base3.Element, Base4.Element, Base5.Element>

    @usableFromInline
    internal var baseIterator1: Base1.Iterator
    @usableFromInline
    internal var baseIterator2: Base2.Iterator
    @usableFromInline
    internal var baseIterator3: Base3.Iterator
    @usableFromInline
    internal var baseIterator4: Base4.Iterator
    @usableFromInline
    internal var baseIterator5: Base5.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5
    ) {
      self.baseIterator1 = base1.makeIterator()
      self.baseIterator2 = base2.makeIterator()
      self.baseIterator3 = base3.makeIterator()
      self.baseIterator4 = base4.makeIterator()
      self.baseIterator5 = base5.makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      if let next = baseIterator1.next() { return .first(next) } 
      if let next = baseIterator2.next() { return .second(next) } 
      if let next = baseIterator3.next() { return .third(next) } 
      if let next = baseIterator4.next() { return .fourth(next) } 
      if let next = baseIterator5.next() { return .fifth(next) } 
      return nil
    }
  }
}

extension Chain.DisparateSequence5: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4, base5)
  }
}

extension ChainSequenceBuilder {
  @_disfavoredOverload
  public static func buildBlock<S1, S2, S3, S4, S5>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5
  )
  -> Chain.DisparateSequence5<S1, S2, S3, S4, S5>
  {
    Chain.DisparateSequence5(s1, s2, s3, s4, s5)
  }
}

extension Chain.DisparateSequence6 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Chain.Either6<Base1.Element, Base2.Element, Base3.Element, Base4.Element, Base5.Element, Base6.Element>

    @usableFromInline
    internal var baseIterator1: Base1.Iterator
    @usableFromInline
    internal var baseIterator2: Base2.Iterator
    @usableFromInline
    internal var baseIterator3: Base3.Iterator
    @usableFromInline
    internal var baseIterator4: Base4.Iterator
    @usableFromInline
    internal var baseIterator5: Base5.Iterator
    @usableFromInline
    internal var baseIterator6: Base6.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5, _ base6: Base6
    ) {
      self.baseIterator1 = base1.makeIterator()
      self.baseIterator2 = base2.makeIterator()
      self.baseIterator3 = base3.makeIterator()
      self.baseIterator4 = base4.makeIterator()
      self.baseIterator5 = base5.makeIterator()
      self.baseIterator6 = base6.makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      if let next = baseIterator1.next() { return .first(next) } 
      if let next = baseIterator2.next() { return .second(next) } 
      if let next = baseIterator3.next() { return .third(next) } 
      if let next = baseIterator4.next() { return .fourth(next) } 
      if let next = baseIterator5.next() { return .fifth(next) } 
      if let next = baseIterator6.next() { return .sixth(next) } 
      return nil
    }
  }
}

extension Chain.DisparateSequence6: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4, base5, base6)
  }
}

extension ChainSequenceBuilder {
  @_disfavoredOverload
  public static func buildBlock<S1, S2, S3, S4, S5, S6>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5,
    _ s6: S6
  )
  -> Chain.DisparateSequence6<S1, S2, S3, S4, S5, S6>
  {
    Chain.DisparateSequence6(s1, s2, s3, s4, s5, s6)
  }
}

extension Chain.DisparateSequence7 {
  public struct Iterator: IteratorProtocol {
    public typealias Element = Chain.Either7<Base1.Element, Base2.Element, Base3.Element, Base4.Element, Base5.Element, Base6.Element, Base7.Element>

    @usableFromInline
    internal var baseIterator1: Base1.Iterator
    @usableFromInline
    internal var baseIterator2: Base2.Iterator
    @usableFromInline
    internal var baseIterator3: Base3.Iterator
    @usableFromInline
    internal var baseIterator4: Base4.Iterator
    @usableFromInline
    internal var baseIterator5: Base5.Iterator
    @usableFromInline
    internal var baseIterator6: Base6.Iterator
    @usableFromInline
    internal var baseIterator7: Base7.Iterator

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5, _ base6: Base6, _ base7: Base7
    ) {
      self.baseIterator1 = base1.makeIterator()
      self.baseIterator2 = base2.makeIterator()
      self.baseIterator3 = base3.makeIterator()
      self.baseIterator4 = base4.makeIterator()
      self.baseIterator5 = base5.makeIterator()
      self.baseIterator6 = base6.makeIterator()
      self.baseIterator7 = base7.makeIterator()
    }

    @inlinable
    public mutating func next() -> Element? {
      if let next = baseIterator1.next() { return .first(next) } 
      if let next = baseIterator2.next() { return .second(next) } 
      if let next = baseIterator3.next() { return .third(next) } 
      if let next = baseIterator4.next() { return .fourth(next) } 
      if let next = baseIterator5.next() { return .fifth(next) } 
      if let next = baseIterator6.next() { return .sixth(next) } 
      if let next = baseIterator7.next() { return .seventh(next) } 
      return nil
    }
  }
}

extension Chain.DisparateSequence7: Sequence {
  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(base1, base2, base3, base4, base5, base6, base7)
  }
}

extension ChainSequenceBuilder {
  @_disfavoredOverload
  public static func buildBlock<S1, S2, S3, S4, S5, S6, S7>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5,
    _ s6: S6,
    _ s7: S7
  )
  -> Chain.DisparateSequence7<S1, S2, S3, S4, S5, S6, S7>
  {
    Chain.DisparateSequence7(s1, s2, s3, s4, s5, s6, s7)
  }
}

// END AUTO-GENERATED CONTENT