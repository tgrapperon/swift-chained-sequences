// BEGIN AUTO-GENERATED CONTENT
@_exported import ChainSequenceCore

extension Chain.DisparateSequence2: Collection
  where
  Base1: Collection,
  Base2: Collection
{
  public typealias Index = Chain.Either2<Base1.Index, Base2.Index>

  @inlinable
  internal func normalize(_ index: Index) -> Index {
    switch index {
    case let .first(i):
      if i != base1.endIndex { return index }
      return normalize(.second(base2.startIndex))
    default:
      return index
    }
  }

  @inlinable
  public var startIndex: Index {
    if !base1.isEmpty { return Index.first(base1.startIndex) }
    if !base2.isEmpty { return Index.second(base2.startIndex) }
    return Index.second(base2.endIndex)
  }

  @inlinable
  public var endIndex: Index {
    Index.second(base2.endIndex)
  }

  @inlinable
  public subscript(i: Index) -> Element {
    switch i {
     case let .first(index):
       return .first(base1[index])
     case let .second(index):
       return .second(base2[index])
    }
  }

  @inlinable
  public func index(after i: Index) -> Index {
    switch i {
    case let .first(i):
      assert(i != base1.endIndex)
      return normalize(Index.first(base1.index(after: i)))
    case let .second(i):
      return Index.second(base2.index(after: i))
    }
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    guard distance != 0 else { return i }
    guard let result = _index(i, offsetBy: distance, limitedBy: nil)
    else { fatalError("Index at distance \(distance) from \(i) is out of bounds") }
    return result
  }
  
  @inlinable
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
      _index(i, offsetBy: distance, limitedBy: normalize(limit))
  }
  
  @inlinable
  func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {
    guard distance != 0 else { return normalize(i) }
    if distance > 0 {
      switch i {
      case let .first(i):
        let distanceToEnd = base1.distance(from: i, to: base1.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .second(i):
        let distanceToEnd = base2.distance(from: i, to: base2.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      }
    } else {
      switch i {
      case let .first(i):
        let distanceFromStart = base1.distance(from: i, to: base1.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      case let .second(i):
        let distanceFromStart = base2.distance(from: i, to: base2.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.first(base1.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      }
    }
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    switch (start, end) {
    case let (.first(i), .first(j)):
      return base1.distance(from: i, to: j)
    case let (.first(i), .second(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: j)
    case let (.second(i), .first(j)):
      return base2.distance(from: i, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.second(i), .second(j)):
      return base2.distance(from: i, to: j)
    }
  }
}
extension Chain.DisparateSequence2: BidirectionalCollection
  where
  Base1: BidirectionalCollection,
  Base2: BidirectionalCollection
{
  @inlinable
  public func index(before i: Index) -> Index {
    switch i {
    case let .first(j):
      assert(j != base1.startIndex)
      return Index.first(base1.index(before: j))
    case let .second(j):
      if j == base2.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.second(base2.index(before: j))
    }
  }

  @inlinable
  internal func retroNormalize(_ index: Index) -> Index {
  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k
    switch index {
    case let .second(i):
      if i != base2.startIndex { return index }
      return retroNormalize(Index.first(base1.endIndex))
    default:
      return index
    }
  }
}
extension Chain.DisparateSequence2: RandomAccessCollection
  where
  Base1: RandomAccessCollection,
  Base2: RandomAccessCollection
{}

extension Chain.DisparateSequence3: Collection
  where
  Base1: Collection,
  Base2: Collection,
  Base3: Collection
{
  public typealias Index = Chain.Either3<Base1.Index, Base2.Index, Base3.Index>

  @inlinable
  internal func normalize(_ index: Index) -> Index {
    switch index {
    case let .first(i):
      if i != base1.endIndex { return index }
      return normalize(.second(base2.startIndex))
    case let .second(i):
      if i != base2.endIndex { return index }
      return normalize(.third(base3.startIndex))
    default:
      return index
    }
  }

  @inlinable
  public var startIndex: Index {
    if !base1.isEmpty { return Index.first(base1.startIndex) }
    if !base2.isEmpty { return Index.second(base2.startIndex) }
    if !base3.isEmpty { return Index.third(base3.startIndex) }
    return Index.third(base3.endIndex)
  }

  @inlinable
  public var endIndex: Index {
    Index.third(base3.endIndex)
  }

  @inlinable
  public subscript(i: Index) -> Element {
    switch i {
     case let .first(index):
       return .first(base1[index])
     case let .second(index):
       return .second(base2[index])
     case let .third(index):
       return .third(base3[index])
    }
  }

  @inlinable
  public func index(after i: Index) -> Index {
    switch i {
    case let .first(i):
      assert(i != base1.endIndex)
      return normalize(Index.first(base1.index(after: i)))
    case let .second(i):
      assert(i != base2.endIndex)
      return normalize(Index.second(base2.index(after: i)))
    case let .third(i):
      return Index.third(base3.index(after: i))
    }
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    guard distance != 0 else { return i }
    guard let result = _index(i, offsetBy: distance, limitedBy: nil)
    else { fatalError("Index at distance \(distance) from \(i) is out of bounds") }
    return result
  }
  
  @inlinable
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
      _index(i, offsetBy: distance, limitedBy: normalize(limit))
  }
  
  @inlinable
  func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {
    guard distance != 0 else { return normalize(i) }
    if distance > 0 {
      switch i {
      case let .first(i):
        let distanceToEnd = base1.distance(from: i, to: base1.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .second(i):
        let distanceToEnd = base2.distance(from: i, to: base2.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .third(i):
        let distanceToEnd = base3.distance(from: i, to: base3.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      }
    } else {
      switch i {
      case let .first(i):
        let distanceFromStart = base1.distance(from: i, to: base1.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      case let .second(i):
        let distanceFromStart = base2.distance(from: i, to: base2.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.first(base1.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .third(i):
        let distanceFromStart = base3.distance(from: i, to: base3.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      }
    }
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    switch (start, end) {
    case let (.first(i), .first(j)):
      return base1.distance(from: i, to: j)
    case let (.first(i), .second(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: j)
    case let (.first(i), .third(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.second(i), .first(j)):
      return base2.distance(from: i, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.second(i), .second(j)):
      return base2.distance(from: i, to: j)
    case let (.second(i), .third(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.third(i), .first(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.third(i), .second(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.third(i), .third(j)):
      return base3.distance(from: i, to: j)
    }
  }
}
extension Chain.DisparateSequence3: BidirectionalCollection
  where
  Base1: BidirectionalCollection,
  Base2: BidirectionalCollection,
  Base3: BidirectionalCollection
{
  @inlinable
  public func index(before i: Index) -> Index {
    switch i {
    case let .first(j):
      assert(j != base1.startIndex)
      return Index.first(base1.index(before: j))
    case let .second(j):
      if j == base2.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.second(base2.index(before: j))
    case let .third(j):
      if j == base3.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.third(base3.index(before: j))
    }
  }

  @inlinable
  internal func retroNormalize(_ index: Index) -> Index {
  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k
    switch index {
    case let .second(i):
      if i != base2.startIndex { return index }
      return retroNormalize(Index.first(base1.endIndex))
    case let .third(i):
      if i != base3.startIndex { return index }
      return retroNormalize(Index.second(base2.endIndex))
    default:
      return index
    }
  }
}
extension Chain.DisparateSequence3: RandomAccessCollection
  where
  Base1: RandomAccessCollection,
  Base2: RandomAccessCollection,
  Base3: RandomAccessCollection
{}

extension Chain.DisparateSequence4: Collection
  where
  Base1: Collection,
  Base2: Collection,
  Base3: Collection,
  Base4: Collection
{
  public typealias Index = Chain.Either4<Base1.Index, Base2.Index, Base3.Index, Base4.Index>

  @inlinable
  internal func normalize(_ index: Index) -> Index {
    switch index {
    case let .first(i):
      if i != base1.endIndex { return index }
      return normalize(.second(base2.startIndex))
    case let .second(i):
      if i != base2.endIndex { return index }
      return normalize(.third(base3.startIndex))
    case let .third(i):
      if i != base3.endIndex { return index }
      return normalize(.fourth(base4.startIndex))
    default:
      return index
    }
  }

  @inlinable
  public var startIndex: Index {
    if !base1.isEmpty { return Index.first(base1.startIndex) }
    if !base2.isEmpty { return Index.second(base2.startIndex) }
    if !base3.isEmpty { return Index.third(base3.startIndex) }
    if !base4.isEmpty { return Index.fourth(base4.startIndex) }
    return Index.fourth(base4.endIndex)
  }

  @inlinable
  public var endIndex: Index {
    Index.fourth(base4.endIndex)
  }

  @inlinable
  public subscript(i: Index) -> Element {
    switch i {
     case let .first(index):
       return .first(base1[index])
     case let .second(index):
       return .second(base2[index])
     case let .third(index):
       return .third(base3[index])
     case let .fourth(index):
       return .fourth(base4[index])
    }
  }

  @inlinable
  public func index(after i: Index) -> Index {
    switch i {
    case let .first(i):
      assert(i != base1.endIndex)
      return normalize(Index.first(base1.index(after: i)))
    case let .second(i):
      assert(i != base2.endIndex)
      return normalize(Index.second(base2.index(after: i)))
    case let .third(i):
      assert(i != base3.endIndex)
      return normalize(Index.third(base3.index(after: i)))
    case let .fourth(i):
      return Index.fourth(base4.index(after: i))
    }
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    guard distance != 0 else { return i }
    guard let result = _index(i, offsetBy: distance, limitedBy: nil)
    else { fatalError("Index at distance \(distance) from \(i) is out of bounds") }
    return result
  }
  
  @inlinable
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
      _index(i, offsetBy: distance, limitedBy: normalize(limit))
  }
  
  @inlinable
  func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {
    guard distance != 0 else { return normalize(i) }
    if distance > 0 {
      switch i {
      case let .first(i):
        let distanceToEnd = base1.distance(from: i, to: base1.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .second(i):
        let distanceToEnd = base2.distance(from: i, to: base2.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .third(i):
        let distanceToEnd = base3.distance(from: i, to: base3.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceToEnd = base4.distance(from: i, to: base4.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      }
    } else {
      switch i {
      case let .first(i):
        let distanceFromStart = base1.distance(from: i, to: base1.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      case let .second(i):
        let distanceFromStart = base2.distance(from: i, to: base2.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.first(base1.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .third(i):
        let distanceFromStart = base3.distance(from: i, to: base3.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceFromStart = base4.distance(from: i, to: base4.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      }
    }
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    switch (start, end) {
    case let (.first(i), .first(j)):
      return base1.distance(from: i, to: j)
    case let (.first(i), .second(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: j)
    case let (.first(i), .third(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.first(i), .fourth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.second(i), .first(j)):
      return base2.distance(from: i, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.second(i), .second(j)):
      return base2.distance(from: i, to: j)
    case let (.second(i), .third(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.second(i), .fourth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.third(i), .first(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.third(i), .second(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.third(i), .third(j)):
      return base3.distance(from: i, to: j)
    case let (.third(i), .fourth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.fourth(i), .first(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fourth(i), .second(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fourth(i), .third(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fourth(i), .fourth(j)):
      return base4.distance(from: i, to: j)
    }
  }
}
extension Chain.DisparateSequence4: BidirectionalCollection
  where
  Base1: BidirectionalCollection,
  Base2: BidirectionalCollection,
  Base3: BidirectionalCollection,
  Base4: BidirectionalCollection
{
  @inlinable
  public func index(before i: Index) -> Index {
    switch i {
    case let .first(j):
      assert(j != base1.startIndex)
      return Index.first(base1.index(before: j))
    case let .second(j):
      if j == base2.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.second(base2.index(before: j))
    case let .third(j):
      if j == base3.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.third(base3.index(before: j))
    case let .fourth(j):
      if j == base4.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fourth(base4.index(before: j))
    }
  }

  @inlinable
  internal func retroNormalize(_ index: Index) -> Index {
  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k
    switch index {
    case let .second(i):
      if i != base2.startIndex { return index }
      return retroNormalize(Index.first(base1.endIndex))
    case let .third(i):
      if i != base3.startIndex { return index }
      return retroNormalize(Index.second(base2.endIndex))
    case let .fourth(i):
      if i != base4.startIndex { return index }
      return retroNormalize(Index.third(base3.endIndex))
    default:
      return index
    }
  }
}
extension Chain.DisparateSequence4: RandomAccessCollection
  where
  Base1: RandomAccessCollection,
  Base2: RandomAccessCollection,
  Base3: RandomAccessCollection,
  Base4: RandomAccessCollection
{}

extension Chain.DisparateSequence5: Collection
  where
  Base1: Collection,
  Base2: Collection,
  Base3: Collection,
  Base4: Collection,
  Base5: Collection
{
  public typealias Index = Chain.Either5<Base1.Index, Base2.Index, Base3.Index, Base4.Index, Base5.Index>

  @inlinable
  internal func normalize(_ index: Index) -> Index {
    switch index {
    case let .first(i):
      if i != base1.endIndex { return index }
      return normalize(.second(base2.startIndex))
    case let .second(i):
      if i != base2.endIndex { return index }
      return normalize(.third(base3.startIndex))
    case let .third(i):
      if i != base3.endIndex { return index }
      return normalize(.fourth(base4.startIndex))
    case let .fourth(i):
      if i != base4.endIndex { return index }
      return normalize(.fifth(base5.startIndex))
    default:
      return index
    }
  }

  @inlinable
  public var startIndex: Index {
    if !base1.isEmpty { return Index.first(base1.startIndex) }
    if !base2.isEmpty { return Index.second(base2.startIndex) }
    if !base3.isEmpty { return Index.third(base3.startIndex) }
    if !base4.isEmpty { return Index.fourth(base4.startIndex) }
    if !base5.isEmpty { return Index.fifth(base5.startIndex) }
    return Index.fifth(base5.endIndex)
  }

  @inlinable
  public var endIndex: Index {
    Index.fifth(base5.endIndex)
  }

  @inlinable
  public subscript(i: Index) -> Element {
    switch i {
     case let .first(index):
       return .first(base1[index])
     case let .second(index):
       return .second(base2[index])
     case let .third(index):
       return .third(base3[index])
     case let .fourth(index):
       return .fourth(base4[index])
     case let .fifth(index):
       return .fifth(base5[index])
    }
  }

  @inlinable
  public func index(after i: Index) -> Index {
    switch i {
    case let .first(i):
      assert(i != base1.endIndex)
      return normalize(Index.first(base1.index(after: i)))
    case let .second(i):
      assert(i != base2.endIndex)
      return normalize(Index.second(base2.index(after: i)))
    case let .third(i):
      assert(i != base3.endIndex)
      return normalize(Index.third(base3.index(after: i)))
    case let .fourth(i):
      assert(i != base4.endIndex)
      return normalize(Index.fourth(base4.index(after: i)))
    case let .fifth(i):
      return Index.fifth(base5.index(after: i))
    }
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    guard distance != 0 else { return i }
    guard let result = _index(i, offsetBy: distance, limitedBy: nil)
    else { fatalError("Index at distance \(distance) from \(i) is out of bounds") }
    return result
  }
  
  @inlinable
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
      _index(i, offsetBy: distance, limitedBy: normalize(limit))
  }
  
  @inlinable
  func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {
    guard distance != 0 else { return normalize(i) }
    if distance > 0 {
      switch i {
      case let .first(i):
        let distanceToEnd = base1.distance(from: i, to: base1.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .second(i):
        let distanceToEnd = base2.distance(from: i, to: base2.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .third(i):
        let distanceToEnd = base3.distance(from: i, to: base3.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceToEnd = base4.distance(from: i, to: base4.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fifth(base5.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fifth(i):
        let distanceToEnd = base5.distance(from: i, to: base5.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fifth(base5.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      }
    } else {
      switch i {
      case let .first(i):
        let distanceFromStart = base1.distance(from: i, to: base1.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      case let .second(i):
        let distanceFromStart = base2.distance(from: i, to: base2.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.first(base1.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .third(i):
        let distanceFromStart = base3.distance(from: i, to: base3.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceFromStart = base4.distance(from: i, to: base4.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fifth(i):
        let distanceFromStart = base5.distance(from: i, to: base5.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fifth(base5.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      }
    }
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    switch (start, end) {
    case let (.first(i), .first(j)):
      return base1.distance(from: i, to: j)
    case let (.first(i), .second(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: j)
    case let (.first(i), .third(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.first(i), .fourth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.first(i), .fifth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.second(i), .first(j)):
      return base2.distance(from: i, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.second(i), .second(j)):
      return base2.distance(from: i, to: j)
    case let (.second(i), .third(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.second(i), .fourth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.second(i), .fifth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.third(i), .first(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.third(i), .second(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.third(i), .third(j)):
      return base3.distance(from: i, to: j)
    case let (.third(i), .fourth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.third(i), .fifth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.fourth(i), .first(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fourth(i), .second(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fourth(i), .third(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fourth(i), .fourth(j)):
      return base4.distance(from: i, to: j)
    case let (.fourth(i), .fifth(j)):
      return base4.distance(from: i, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.fifth(i), .first(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fifth(i), .second(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fifth(i), .third(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fifth(i), .fourth(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: j)
    case let (.fifth(i), .fifth(j)):
      return base5.distance(from: i, to: j)
    }
  }
}
extension Chain.DisparateSequence5: BidirectionalCollection
  where
  Base1: BidirectionalCollection,
  Base2: BidirectionalCollection,
  Base3: BidirectionalCollection,
  Base4: BidirectionalCollection,
  Base5: BidirectionalCollection
{
  @inlinable
  public func index(before i: Index) -> Index {
    switch i {
    case let .first(j):
      assert(j != base1.startIndex)
      return Index.first(base1.index(before: j))
    case let .second(j):
      if j == base2.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.second(base2.index(before: j))
    case let .third(j):
      if j == base3.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.third(base3.index(before: j))
    case let .fourth(j):
      if j == base4.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fourth(base4.index(before: j))
    case let .fifth(j):
      if j == base5.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fifth(base5.index(before: j))
    }
  }

  @inlinable
  internal func retroNormalize(_ index: Index) -> Index {
  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k
    switch index {
    case let .second(i):
      if i != base2.startIndex { return index }
      return retroNormalize(Index.first(base1.endIndex))
    case let .third(i):
      if i != base3.startIndex { return index }
      return retroNormalize(Index.second(base2.endIndex))
    case let .fourth(i):
      if i != base4.startIndex { return index }
      return retroNormalize(Index.third(base3.endIndex))
    case let .fifth(i):
      if i != base5.startIndex { return index }
      return retroNormalize(Index.fourth(base4.endIndex))
    default:
      return index
    }
  }
}
extension Chain.DisparateSequence5: RandomAccessCollection
  where
  Base1: RandomAccessCollection,
  Base2: RandomAccessCollection,
  Base3: RandomAccessCollection,
  Base4: RandomAccessCollection,
  Base5: RandomAccessCollection
{}

extension Chain.DisparateSequence6: Collection
  where
  Base1: Collection,
  Base2: Collection,
  Base3: Collection,
  Base4: Collection,
  Base5: Collection,
  Base6: Collection
{
  public typealias Index = Chain.Either6<Base1.Index, Base2.Index, Base3.Index, Base4.Index, Base5.Index, Base6.Index>

  @inlinable
  internal func normalize(_ index: Index) -> Index {
    switch index {
    case let .first(i):
      if i != base1.endIndex { return index }
      return normalize(.second(base2.startIndex))
    case let .second(i):
      if i != base2.endIndex { return index }
      return normalize(.third(base3.startIndex))
    case let .third(i):
      if i != base3.endIndex { return index }
      return normalize(.fourth(base4.startIndex))
    case let .fourth(i):
      if i != base4.endIndex { return index }
      return normalize(.fifth(base5.startIndex))
    case let .fifth(i):
      if i != base5.endIndex { return index }
      return normalize(.sixth(base6.startIndex))
    default:
      return index
    }
  }

  @inlinable
  public var startIndex: Index {
    if !base1.isEmpty { return Index.first(base1.startIndex) }
    if !base2.isEmpty { return Index.second(base2.startIndex) }
    if !base3.isEmpty { return Index.third(base3.startIndex) }
    if !base4.isEmpty { return Index.fourth(base4.startIndex) }
    if !base5.isEmpty { return Index.fifth(base5.startIndex) }
    if !base6.isEmpty { return Index.sixth(base6.startIndex) }
    return Index.sixth(base6.endIndex)
  }

  @inlinable
  public var endIndex: Index {
    Index.sixth(base6.endIndex)
  }

  @inlinable
  public subscript(i: Index) -> Element {
    switch i {
     case let .first(index):
       return .first(base1[index])
     case let .second(index):
       return .second(base2[index])
     case let .third(index):
       return .third(base3[index])
     case let .fourth(index):
       return .fourth(base4[index])
     case let .fifth(index):
       return .fifth(base5[index])
     case let .sixth(index):
       return .sixth(base6[index])
    }
  }

  @inlinable
  public func index(after i: Index) -> Index {
    switch i {
    case let .first(i):
      assert(i != base1.endIndex)
      return normalize(Index.first(base1.index(after: i)))
    case let .second(i):
      assert(i != base2.endIndex)
      return normalize(Index.second(base2.index(after: i)))
    case let .third(i):
      assert(i != base3.endIndex)
      return normalize(Index.third(base3.index(after: i)))
    case let .fourth(i):
      assert(i != base4.endIndex)
      return normalize(Index.fourth(base4.index(after: i)))
    case let .fifth(i):
      assert(i != base5.endIndex)
      return normalize(Index.fifth(base5.index(after: i)))
    case let .sixth(i):
      return Index.sixth(base6.index(after: i))
    }
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    guard distance != 0 else { return i }
    guard let result = _index(i, offsetBy: distance, limitedBy: nil)
    else { fatalError("Index at distance \(distance) from \(i) is out of bounds") }
    return result
  }
  
  @inlinable
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
      _index(i, offsetBy: distance, limitedBy: normalize(limit))
  }
  
  @inlinable
  func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {
    guard distance != 0 else { return normalize(i) }
    if distance > 0 {
      switch i {
      case let .first(i):
        let distanceToEnd = base1.distance(from: i, to: base1.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .second(i):
        let distanceToEnd = base2.distance(from: i, to: base2.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .third(i):
        let distanceToEnd = base3.distance(from: i, to: base3.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceToEnd = base4.distance(from: i, to: base4.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fifth(base5.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fifth(i):
        let distanceToEnd = base5.distance(from: i, to: base5.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fifth(base5.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.sixth(base6.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .sixth(i):
        let distanceToEnd = base6.distance(from: i, to: base6.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.sixth(base6.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      }
    } else {
      switch i {
      case let .first(i):
        let distanceFromStart = base1.distance(from: i, to: base1.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      case let .second(i):
        let distanceFromStart = base2.distance(from: i, to: base2.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.first(base1.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .third(i):
        let distanceFromStart = base3.distance(from: i, to: base3.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceFromStart = base4.distance(from: i, to: base4.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fifth(i):
        let distanceFromStart = base5.distance(from: i, to: base5.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fifth(base5.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .sixth(i):
        let distanceFromStart = base6.distance(from: i, to: base6.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.sixth(base6.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fifth(base5.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      }
    }
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    switch (start, end) {
    case let (.first(i), .first(j)):
      return base1.distance(from: i, to: j)
    case let (.first(i), .second(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: j)
    case let (.first(i), .third(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.first(i), .fourth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.first(i), .fifth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.first(i), .sixth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.second(i), .first(j)):
      return base2.distance(from: i, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.second(i), .second(j)):
      return base2.distance(from: i, to: j)
    case let (.second(i), .third(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.second(i), .fourth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.second(i), .fifth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.second(i), .sixth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.third(i), .first(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.third(i), .second(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.third(i), .third(j)):
      return base3.distance(from: i, to: j)
    case let (.third(i), .fourth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.third(i), .fifth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.third(i), .sixth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.fourth(i), .first(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fourth(i), .second(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fourth(i), .third(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fourth(i), .fourth(j)):
      return base4.distance(from: i, to: j)
    case let (.fourth(i), .fifth(j)):
      return base4.distance(from: i, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.fourth(i), .sixth(j)):
      return base4.distance(from: i, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.fifth(i), .first(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fifth(i), .second(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fifth(i), .third(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fifth(i), .fourth(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: j)
    case let (.fifth(i), .fifth(j)):
      return base5.distance(from: i, to: j)
    case let (.fifth(i), .sixth(j)):
      return base5.distance(from: i, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.sixth(i), .first(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.sixth(i), .second(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.sixth(i), .third(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.sixth(i), .fourth(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: j)
    case let (.sixth(i), .fifth(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: j)
    case let (.sixth(i), .sixth(j)):
      return base6.distance(from: i, to: j)
    }
  }
}
extension Chain.DisparateSequence6: BidirectionalCollection
  where
  Base1: BidirectionalCollection,
  Base2: BidirectionalCollection,
  Base3: BidirectionalCollection,
  Base4: BidirectionalCollection,
  Base5: BidirectionalCollection,
  Base6: BidirectionalCollection
{
  @inlinable
  public func index(before i: Index) -> Index {
    switch i {
    case let .first(j):
      assert(j != base1.startIndex)
      return Index.first(base1.index(before: j))
    case let .second(j):
      if j == base2.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.second(base2.index(before: j))
    case let .third(j):
      if j == base3.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.third(base3.index(before: j))
    case let .fourth(j):
      if j == base4.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fourth(base4.index(before: j))
    case let .fifth(j):
      if j == base5.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fifth(base5.index(before: j))
    case let .sixth(j):
      if j == base6.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.sixth(base6.index(before: j))
    }
  }

  @inlinable
  internal func retroNormalize(_ index: Index) -> Index {
  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k
    switch index {
    case let .second(i):
      if i != base2.startIndex { return index }
      return retroNormalize(Index.first(base1.endIndex))
    case let .third(i):
      if i != base3.startIndex { return index }
      return retroNormalize(Index.second(base2.endIndex))
    case let .fourth(i):
      if i != base4.startIndex { return index }
      return retroNormalize(Index.third(base3.endIndex))
    case let .fifth(i):
      if i != base5.startIndex { return index }
      return retroNormalize(Index.fourth(base4.endIndex))
    case let .sixth(i):
      if i != base6.startIndex { return index }
      return retroNormalize(Index.fifth(base5.endIndex))
    default:
      return index
    }
  }
}
extension Chain.DisparateSequence6: RandomAccessCollection
  where
  Base1: RandomAccessCollection,
  Base2: RandomAccessCollection,
  Base3: RandomAccessCollection,
  Base4: RandomAccessCollection,
  Base5: RandomAccessCollection,
  Base6: RandomAccessCollection
{}

extension Chain.DisparateSequence7: Collection
  where
  Base1: Collection,
  Base2: Collection,
  Base3: Collection,
  Base4: Collection,
  Base5: Collection,
  Base6: Collection,
  Base7: Collection
{
  public typealias Index = Chain.Either7<Base1.Index, Base2.Index, Base3.Index, Base4.Index, Base5.Index, Base6.Index, Base7.Index>

  @inlinable
  internal func normalize(_ index: Index) -> Index {
    switch index {
    case let .first(i):
      if i != base1.endIndex { return index }
      return normalize(.second(base2.startIndex))
    case let .second(i):
      if i != base2.endIndex { return index }
      return normalize(.third(base3.startIndex))
    case let .third(i):
      if i != base3.endIndex { return index }
      return normalize(.fourth(base4.startIndex))
    case let .fourth(i):
      if i != base4.endIndex { return index }
      return normalize(.fifth(base5.startIndex))
    case let .fifth(i):
      if i != base5.endIndex { return index }
      return normalize(.sixth(base6.startIndex))
    case let .sixth(i):
      if i != base6.endIndex { return index }
      return normalize(.seventh(base7.startIndex))
    default:
      return index
    }
  }

  @inlinable
  public var startIndex: Index {
    if !base1.isEmpty { return Index.first(base1.startIndex) }
    if !base2.isEmpty { return Index.second(base2.startIndex) }
    if !base3.isEmpty { return Index.third(base3.startIndex) }
    if !base4.isEmpty { return Index.fourth(base4.startIndex) }
    if !base5.isEmpty { return Index.fifth(base5.startIndex) }
    if !base6.isEmpty { return Index.sixth(base6.startIndex) }
    if !base7.isEmpty { return Index.seventh(base7.startIndex) }
    return Index.seventh(base7.endIndex)
  }

  @inlinable
  public var endIndex: Index {
    Index.seventh(base7.endIndex)
  }

  @inlinable
  public subscript(i: Index) -> Element {
    switch i {
     case let .first(index):
       return .first(base1[index])
     case let .second(index):
       return .second(base2[index])
     case let .third(index):
       return .third(base3[index])
     case let .fourth(index):
       return .fourth(base4[index])
     case let .fifth(index):
       return .fifth(base5[index])
     case let .sixth(index):
       return .sixth(base6[index])
     case let .seventh(index):
       return .seventh(base7[index])
    }
  }

  @inlinable
  public func index(after i: Index) -> Index {
    switch i {
    case let .first(i):
      assert(i != base1.endIndex)
      return normalize(Index.first(base1.index(after: i)))
    case let .second(i):
      assert(i != base2.endIndex)
      return normalize(Index.second(base2.index(after: i)))
    case let .third(i):
      assert(i != base3.endIndex)
      return normalize(Index.third(base3.index(after: i)))
    case let .fourth(i):
      assert(i != base4.endIndex)
      return normalize(Index.fourth(base4.index(after: i)))
    case let .fifth(i):
      assert(i != base5.endIndex)
      return normalize(Index.fifth(base5.index(after: i)))
    case let .sixth(i):
      assert(i != base6.endIndex)
      return normalize(Index.sixth(base6.index(after: i)))
    case let .seventh(i):
      return Index.seventh(base7.index(after: i))
    }
  }

  @inlinable
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    guard distance != 0 else { return i }
    guard let result = _index(i, offsetBy: distance, limitedBy: nil)
    else { fatalError("Index at distance \(distance) from \(i) is out of bounds") }
    return result
  }
  
  @inlinable
    public func index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index) -> Index? {
      _index(i, offsetBy: distance, limitedBy: normalize(limit))
  }
  
  @inlinable
  func _index(_ i: Index, offsetBy distance: Int, limitedBy limit: Index?) -> Index? {
    guard distance != 0 else { return normalize(i) }
    if distance > 0 {
      switch i {
      case let .first(i):
        let distanceToEnd = base1.distance(from: i, to: base1.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .second(i):
        let distanceToEnd = base2.distance(from: i, to: base2.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .third(i):
        let distanceToEnd = base3.distance(from: i, to: base3.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceToEnd = base4.distance(from: i, to: base4.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fifth(base5.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .fifth(i):
        let distanceToEnd = base5.distance(from: i, to: base5.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.fifth(base5.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.sixth(base6.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .sixth(i):
        let distanceToEnd = base6.distance(from: i, to: base6.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.sixth(base6.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.seventh(base7.startIndex), offsetBy: distance - distanceToEnd, limitedBy: limit)
        }
      case let .seventh(i):
        let distanceToEnd = base7.distance(from: i, to: base7.endIndex)
        if distanceToEnd <= distance {
          let result = normalize(Index.seventh(base7.index(i, offsetBy: distance)))
          if let limit = limit {
            return result <= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      }
    } else {
      switch i {
      case let .first(i):
        let distanceFromStart = base1.distance(from: i, to: base1.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.first(base1.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return nil
        }
      case let .second(i):
        let distanceFromStart = base2.distance(from: i, to: base2.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.second(base2.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.first(base1.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .third(i):
        let distanceFromStart = base3.distance(from: i, to: base3.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.third(base3.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.second(base2.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fourth(i):
        let distanceFromStart = base4.distance(from: i, to: base4.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fourth(base4.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.third(base3.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .fifth(i):
        let distanceFromStart = base5.distance(from: i, to: base5.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.fifth(base5.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fourth(base4.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .sixth(i):
        let distanceFromStart = base6.distance(from: i, to: base6.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.sixth(base6.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.fifth(base5.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      case let .seventh(i):
        let distanceFromStart = base7.distance(from: i, to: base7.startIndex)
        if distanceFromStart <= distance {
          let result = normalize(Index.seventh(base7.index(i, offsetBy: distance)))
          if let limit = limit {
            return result >= limit ? result : nil
          } else {
            return result
          }
        } else {
          return _index(.sixth(base6.endIndex), offsetBy: distance - distanceFromStart, limitedBy: limit)
        }
      }
    }
  }

  @inlinable
  public func distance(from start: Index, to end: Index) -> Int {
    switch (start, end) {
    case let (.first(i), .first(j)):
      return base1.distance(from: i, to: j)
    case let (.first(i), .second(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: j)
    case let (.first(i), .third(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.first(i), .fourth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.first(i), .fifth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.first(i), .sixth(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.first(i), .seventh(j)):
      return base1.distance(from: i, to: base1.endIndex)
        + base2.distance(from: base2.startIndex, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: base6.endIndex)
        + base7.distance(from: base7.startIndex, to: j)
    case let (.second(i), .first(j)):
      return base2.distance(from: i, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.second(i), .second(j)):
      return base2.distance(from: i, to: j)
    case let (.second(i), .third(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: j)
    case let (.second(i), .fourth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.second(i), .fifth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.second(i), .sixth(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.second(i), .seventh(j)):
      return base2.distance(from: i, to: base2.endIndex)
        + base3.distance(from: base3.startIndex, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: base6.endIndex)
        + base7.distance(from: base7.startIndex, to: j)
    case let (.third(i), .first(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.third(i), .second(j)):
      return base3.distance(from: i, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.third(i), .third(j)):
      return base3.distance(from: i, to: j)
    case let (.third(i), .fourth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: j)
    case let (.third(i), .fifth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.third(i), .sixth(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.third(i), .seventh(j)):
      return base3.distance(from: i, to: base3.endIndex)
        + base4.distance(from: base4.startIndex, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: base6.endIndex)
        + base7.distance(from: base7.startIndex, to: j)
    case let (.fourth(i), .first(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fourth(i), .second(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fourth(i), .third(j)):
      return base4.distance(from: i, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fourth(i), .fourth(j)):
      return base4.distance(from: i, to: j)
    case let (.fourth(i), .fifth(j)):
      return base4.distance(from: i, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: j)
    case let (.fourth(i), .sixth(j)):
      return base4.distance(from: i, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.fourth(i), .seventh(j)):
      return base4.distance(from: i, to: base4.endIndex)
        + base5.distance(from: base5.startIndex, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: base6.endIndex)
        + base7.distance(from: base7.startIndex, to: j)
    case let (.fifth(i), .first(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.fifth(i), .second(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.fifth(i), .third(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.fifth(i), .fourth(j)):
      return base5.distance(from: i, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: j)
    case let (.fifth(i), .fifth(j)):
      return base5.distance(from: i, to: j)
    case let (.fifth(i), .sixth(j)):
      return base5.distance(from: i, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: j)
    case let (.fifth(i), .seventh(j)):
      return base5.distance(from: i, to: base5.endIndex)
        + base6.distance(from: base6.startIndex, to: base6.endIndex)
        + base7.distance(from: base7.startIndex, to: j)
    case let (.sixth(i), .first(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.sixth(i), .second(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.sixth(i), .third(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.sixth(i), .fourth(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: j)
    case let (.sixth(i), .fifth(j)):
      return base6.distance(from: i, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: j)
    case let (.sixth(i), .sixth(j)):
      return base6.distance(from: i, to: j)
    case let (.sixth(i), .seventh(j)):
      return base6.distance(from: i, to: base6.endIndex)
        + base7.distance(from: base7.startIndex, to: j)
    case let (.seventh(i), .first(j)):
      return base7.distance(from: i, to: base7.startIndex)
        + base6.distance(from: base6.endIndex, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: base2.startIndex)
        + base1.distance(from: base1.endIndex, to: j)
    case let (.seventh(i), .second(j)):
      return base7.distance(from: i, to: base7.startIndex)
        + base6.distance(from: base6.endIndex, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: base3.startIndex)
        + base2.distance(from: base2.endIndex, to: j)
    case let (.seventh(i), .third(j)):
      return base7.distance(from: i, to: base7.startIndex)
        + base6.distance(from: base6.endIndex, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: base4.startIndex)
        + base3.distance(from: base3.endIndex, to: j)
    case let (.seventh(i), .fourth(j)):
      return base7.distance(from: i, to: base7.startIndex)
        + base6.distance(from: base6.endIndex, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: base5.startIndex)
        + base4.distance(from: base4.endIndex, to: j)
    case let (.seventh(i), .fifth(j)):
      return base7.distance(from: i, to: base7.startIndex)
        + base6.distance(from: base6.endIndex, to: base6.startIndex)
        + base5.distance(from: base5.endIndex, to: j)
    case let (.seventh(i), .sixth(j)):
      return base7.distance(from: i, to: base7.startIndex)
        + base6.distance(from: base6.endIndex, to: j)
    case let (.seventh(i), .seventh(j)):
      return base7.distance(from: i, to: j)
    }
  }
}
extension Chain.DisparateSequence7: BidirectionalCollection
  where
  Base1: BidirectionalCollection,
  Base2: BidirectionalCollection,
  Base3: BidirectionalCollection,
  Base4: BidirectionalCollection,
  Base5: BidirectionalCollection,
  Base6: BidirectionalCollection,
  Base7: BidirectionalCollection
{
  @inlinable
  public func index(before i: Index) -> Index {
    switch i {
    case let .first(j):
      assert(j != base1.startIndex)
      return Index.first(base1.index(before: j))
    case let .second(j):
      if j == base2.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.second(base2.index(before: j))
    case let .third(j):
      if j == base3.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.third(base3.index(before: j))
    case let .fourth(j):
      if j == base4.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fourth(base4.index(before: j))
    case let .fifth(j):
      if j == base5.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.fifth(base5.index(before: j))
    case let .sixth(j):
      if j == base6.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.sixth(base6.index(before: j))
    case let .seventh(j):
      if j == base7.startIndex {
        return index(before: retroNormalize(i))
      }
      return Index.seventh(base7.index(before: j))
    }
  }

  @inlinable
  internal func retroNormalize(_ index: Index) -> Index {
  // Maps `base_k.startIndex` to the first non-empty `base_j.endIndex` with j < k
    switch index {
    case let .second(i):
      if i != base2.startIndex { return index }
      return retroNormalize(Index.first(base1.endIndex))
    case let .third(i):
      if i != base3.startIndex { return index }
      return retroNormalize(Index.second(base2.endIndex))
    case let .fourth(i):
      if i != base4.startIndex { return index }
      return retroNormalize(Index.third(base3.endIndex))
    case let .fifth(i):
      if i != base5.startIndex { return index }
      return retroNormalize(Index.fourth(base4.endIndex))
    case let .sixth(i):
      if i != base6.startIndex { return index }
      return retroNormalize(Index.fifth(base5.endIndex))
    case let .seventh(i):
      if i != base7.startIndex { return index }
      return retroNormalize(Index.sixth(base6.endIndex))
    default:
      return index
    }
  }
}
extension Chain.DisparateSequence7: RandomAccessCollection
  where
  Base1: RandomAccessCollection,
  Base2: RandomAccessCollection,
  Base3: RandomAccessCollection,
  Base4: RandomAccessCollection,
  Base5: RandomAccessCollection,
  Base6: RandomAccessCollection,
  Base7: RandomAccessCollection
{}
// END AUTO-GENERATED CONTENT