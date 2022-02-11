// BEGIN AUTO-GENERATED CONTENT

@_exported import ChainSequenceCore
@_exported import AsyncChainSequenceCommon

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence2 {
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.AsyncIterator
    @usableFromInline
    internal var baseIterator2: Base2.AsyncIterator
    @usableFromInline
    internal var isIterationFinished1: Bool = false
    @usableFromInline
    internal var isIterationFinished2: Bool = false

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2
    ) {
      self.baseIterator1 = base1.makeAsyncIterator()
      self.baseIterator2 = base2.makeAsyncIterator()
    }

    @inlinable
    public mutating func next() async throws -> Element? {
      if !isIterationFinished1 {
        if let next = try await baseIterator1.next() {
          return next
        } else {
          self.isIterationFinished1 = true
        }
      }
      if !isIterationFinished2 {
        if let next = try await baseIterator2.next() {
          return next
        } else {
          self.isIterationFinished2 = true
        }
      }
      return nil
    }
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence2: AsyncSequence {
  @inlinable
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base1, base2)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2>(
    _ s1: S1,
    _ s2: S2
  )
  -> Chain.AsyncSequence2<S1, S2>
  {
    Chain.AsyncSequence2(s1, s2)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence3 {
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.AsyncIterator
    @usableFromInline
    internal var baseIterator2: Base2.AsyncIterator
    @usableFromInline
    internal var baseIterator3: Base3.AsyncIterator
    @usableFromInline
    internal var isIterationFinished1: Bool = false
    @usableFromInline
    internal var isIterationFinished2: Bool = false
    @usableFromInline
    internal var isIterationFinished3: Bool = false

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3
    ) {
      self.baseIterator1 = base1.makeAsyncIterator()
      self.baseIterator2 = base2.makeAsyncIterator()
      self.baseIterator3 = base3.makeAsyncIterator()
    }

    @inlinable
    public mutating func next() async throws -> Element? {
      if !isIterationFinished1 {
        if let next = try await baseIterator1.next() {
          return next
        } else {
          self.isIterationFinished1 = true
        }
      }
      if !isIterationFinished2 {
        if let next = try await baseIterator2.next() {
          return next
        } else {
          self.isIterationFinished2 = true
        }
      }
      if !isIterationFinished3 {
        if let next = try await baseIterator3.next() {
          return next
        } else {
          self.isIterationFinished3 = true
        }
      }
      return nil
    }
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence3: AsyncSequence {
  @inlinable
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base1, base2, base3)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3
  )
  -> Chain.AsyncSequence3<S1, S2, S3>
  {
    Chain.AsyncSequence3(s1, s2, s3)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence4 {
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.AsyncIterator
    @usableFromInline
    internal var baseIterator2: Base2.AsyncIterator
    @usableFromInline
    internal var baseIterator3: Base3.AsyncIterator
    @usableFromInline
    internal var baseIterator4: Base4.AsyncIterator
    @usableFromInline
    internal var isIterationFinished1: Bool = false
    @usableFromInline
    internal var isIterationFinished2: Bool = false
    @usableFromInline
    internal var isIterationFinished3: Bool = false
    @usableFromInline
    internal var isIterationFinished4: Bool = false

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4
    ) {
      self.baseIterator1 = base1.makeAsyncIterator()
      self.baseIterator2 = base2.makeAsyncIterator()
      self.baseIterator3 = base3.makeAsyncIterator()
      self.baseIterator4 = base4.makeAsyncIterator()
    }

    @inlinable
    public mutating func next() async throws -> Element? {
      if !isIterationFinished1 {
        if let next = try await baseIterator1.next() {
          return next
        } else {
          self.isIterationFinished1 = true
        }
      }
      if !isIterationFinished2 {
        if let next = try await baseIterator2.next() {
          return next
        } else {
          self.isIterationFinished2 = true
        }
      }
      if !isIterationFinished3 {
        if let next = try await baseIterator3.next() {
          return next
        } else {
          self.isIterationFinished3 = true
        }
      }
      if !isIterationFinished4 {
        if let next = try await baseIterator4.next() {
          return next
        } else {
          self.isIterationFinished4 = true
        }
      }
      return nil
    }
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence4: AsyncSequence {
  @inlinable
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base1, base2, base3, base4)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4
  )
  -> Chain.AsyncSequence4<S1, S2, S3, S4>
  {
    Chain.AsyncSequence4(s1, s2, s3, s4)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence5 {
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.AsyncIterator
    @usableFromInline
    internal var baseIterator2: Base2.AsyncIterator
    @usableFromInline
    internal var baseIterator3: Base3.AsyncIterator
    @usableFromInline
    internal var baseIterator4: Base4.AsyncIterator
    @usableFromInline
    internal var baseIterator5: Base5.AsyncIterator
    @usableFromInline
    internal var isIterationFinished1: Bool = false
    @usableFromInline
    internal var isIterationFinished2: Bool = false
    @usableFromInline
    internal var isIterationFinished3: Bool = false
    @usableFromInline
    internal var isIterationFinished4: Bool = false
    @usableFromInline
    internal var isIterationFinished5: Bool = false

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5
    ) {
      self.baseIterator1 = base1.makeAsyncIterator()
      self.baseIterator2 = base2.makeAsyncIterator()
      self.baseIterator3 = base3.makeAsyncIterator()
      self.baseIterator4 = base4.makeAsyncIterator()
      self.baseIterator5 = base5.makeAsyncIterator()
    }

    @inlinable
    public mutating func next() async throws -> Element? {
      if !isIterationFinished1 {
        if let next = try await baseIterator1.next() {
          return next
        } else {
          self.isIterationFinished1 = true
        }
      }
      if !isIterationFinished2 {
        if let next = try await baseIterator2.next() {
          return next
        } else {
          self.isIterationFinished2 = true
        }
      }
      if !isIterationFinished3 {
        if let next = try await baseIterator3.next() {
          return next
        } else {
          self.isIterationFinished3 = true
        }
      }
      if !isIterationFinished4 {
        if let next = try await baseIterator4.next() {
          return next
        } else {
          self.isIterationFinished4 = true
        }
      }
      if !isIterationFinished5 {
        if let next = try await baseIterator5.next() {
          return next
        } else {
          self.isIterationFinished5 = true
        }
      }
      return nil
    }
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence5: AsyncSequence {
  @inlinable
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base1, base2, base3, base4, base5)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4, S5>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5
  )
  -> Chain.AsyncSequence5<S1, S2, S3, S4, S5>
  {
    Chain.AsyncSequence5(s1, s2, s3, s4, s5)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence6 {
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.AsyncIterator
    @usableFromInline
    internal var baseIterator2: Base2.AsyncIterator
    @usableFromInline
    internal var baseIterator3: Base3.AsyncIterator
    @usableFromInline
    internal var baseIterator4: Base4.AsyncIterator
    @usableFromInline
    internal var baseIterator5: Base5.AsyncIterator
    @usableFromInline
    internal var baseIterator6: Base6.AsyncIterator
    @usableFromInline
    internal var isIterationFinished1: Bool = false
    @usableFromInline
    internal var isIterationFinished2: Bool = false
    @usableFromInline
    internal var isIterationFinished3: Bool = false
    @usableFromInline
    internal var isIterationFinished4: Bool = false
    @usableFromInline
    internal var isIterationFinished5: Bool = false
    @usableFromInline
    internal var isIterationFinished6: Bool = false

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5, _ base6: Base6
    ) {
      self.baseIterator1 = base1.makeAsyncIterator()
      self.baseIterator2 = base2.makeAsyncIterator()
      self.baseIterator3 = base3.makeAsyncIterator()
      self.baseIterator4 = base4.makeAsyncIterator()
      self.baseIterator5 = base5.makeAsyncIterator()
      self.baseIterator6 = base6.makeAsyncIterator()
    }

    @inlinable
    public mutating func next() async throws -> Element? {
      if !isIterationFinished1 {
        if let next = try await baseIterator1.next() {
          return next
        } else {
          self.isIterationFinished1 = true
        }
      }
      if !isIterationFinished2 {
        if let next = try await baseIterator2.next() {
          return next
        } else {
          self.isIterationFinished2 = true
        }
      }
      if !isIterationFinished3 {
        if let next = try await baseIterator3.next() {
          return next
        } else {
          self.isIterationFinished3 = true
        }
      }
      if !isIterationFinished4 {
        if let next = try await baseIterator4.next() {
          return next
        } else {
          self.isIterationFinished4 = true
        }
      }
      if !isIterationFinished5 {
        if let next = try await baseIterator5.next() {
          return next
        } else {
          self.isIterationFinished5 = true
        }
      }
      if !isIterationFinished6 {
        if let next = try await baseIterator6.next() {
          return next
        } else {
          self.isIterationFinished6 = true
        }
      }
      return nil
    }
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence6: AsyncSequence {
  @inlinable
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base1, base2, base3, base4, base5, base6)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension ChainSequenceBuilder {
  public static func buildBlock<S1, S2, S3, S4, S5, S6>(
    _ s1: S1,
    _ s2: S2,
    _ s3: S3,
    _ s4: S4,
    _ s5: S5,
    _ s6: S6
  )
  -> Chain.AsyncSequence6<S1, S2, S3, S4, S5, S6>
  {
    Chain.AsyncSequence6(s1, s2, s3, s4, s5, s6)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence7 {
  public struct AsyncIterator: AsyncIteratorProtocol {
    public typealias Element = Base1.Element

    @usableFromInline
    internal var baseIterator1: Base1.AsyncIterator
    @usableFromInline
    internal var baseIterator2: Base2.AsyncIterator
    @usableFromInline
    internal var baseIterator3: Base3.AsyncIterator
    @usableFromInline
    internal var baseIterator4: Base4.AsyncIterator
    @usableFromInline
    internal var baseIterator5: Base5.AsyncIterator
    @usableFromInline
    internal var baseIterator6: Base6.AsyncIterator
    @usableFromInline
    internal var baseIterator7: Base7.AsyncIterator
    @usableFromInline
    internal var isIterationFinished1: Bool = false
    @usableFromInline
    internal var isIterationFinished2: Bool = false
    @usableFromInline
    internal var isIterationFinished3: Bool = false
    @usableFromInline
    internal var isIterationFinished4: Bool = false
    @usableFromInline
    internal var isIterationFinished5: Bool = false
    @usableFromInline
    internal var isIterationFinished6: Bool = false
    @usableFromInline
    internal var isIterationFinished7: Bool = false

    @inlinable
    public init(
      _ base1: Base1, _ base2: Base2, _ base3: Base3, _ base4: Base4, _ base5: Base5, _ base6: Base6, _ base7: Base7
    ) {
      self.baseIterator1 = base1.makeAsyncIterator()
      self.baseIterator2 = base2.makeAsyncIterator()
      self.baseIterator3 = base3.makeAsyncIterator()
      self.baseIterator4 = base4.makeAsyncIterator()
      self.baseIterator5 = base5.makeAsyncIterator()
      self.baseIterator6 = base6.makeAsyncIterator()
      self.baseIterator7 = base7.makeAsyncIterator()
    }

    @inlinable
    public mutating func next() async throws -> Element? {
      if !isIterationFinished1 {
        if let next = try await baseIterator1.next() {
          return next
        } else {
          self.isIterationFinished1 = true
        }
      }
      if !isIterationFinished2 {
        if let next = try await baseIterator2.next() {
          return next
        } else {
          self.isIterationFinished2 = true
        }
      }
      if !isIterationFinished3 {
        if let next = try await baseIterator3.next() {
          return next
        } else {
          self.isIterationFinished3 = true
        }
      }
      if !isIterationFinished4 {
        if let next = try await baseIterator4.next() {
          return next
        } else {
          self.isIterationFinished4 = true
        }
      }
      if !isIterationFinished5 {
        if let next = try await baseIterator5.next() {
          return next
        } else {
          self.isIterationFinished5 = true
        }
      }
      if !isIterationFinished6 {
        if let next = try await baseIterator6.next() {
          return next
        } else {
          self.isIterationFinished6 = true
        }
      }
      if !isIterationFinished7 {
        if let next = try await baseIterator7.next() {
          return next
        } else {
          self.isIterationFinished7 = true
        }
      }
      return nil
    }
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.AsyncSequence7: AsyncSequence {
  @inlinable
  public func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base1, base2, base3, base4, base5, base6, base7)
  }
}

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
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
  -> Chain.AsyncSequence7<S1, S2, S3, S4, S5, S6, S7>
  {
    Chain.AsyncSequence7(s1, s2, s3, s4, s5, s6, s7)
  }
}

// END AUTO-GENERATED CONTENT