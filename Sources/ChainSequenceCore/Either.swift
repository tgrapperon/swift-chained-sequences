// BEGIN AUTO-GENERATED CONTENT

extension Chain {
  public enum Either2<First, Second> {
    case first(First)
    case second(Second)
  }
}

extension Chain.Either2: Equatable
  where
    First: Equatable,
    Second: Equatable
  {}

extension Chain.Either2: Hashable
  where
    First: Hashable,
    Second: Hashable
  {}

extension Chain.Either2: Comparable
  where
    First: Comparable,
    Second: Comparable
  {
    @inlinable
    internal var rank: Int {
      switch self {
      case .first: return 1
      case .second: return 2
      }
    }

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case let (.first(l), .first(r)):
        return l < r
      case let (.second(l), .second(r)):
        return l < r
      default: 
        return lhs.rank < rhs.rank
      }
    }
  }

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.Either2: Identifiable
  where
    First: Identifiable,
    Second: Identifiable,
    First.ID == Second.ID
  {
    public typealias ID = First.ID
    @inlinable
    public var id: ID {
      switch self {
      case let .first(value):
        return value.id
      case let .second(value):
        return value.id
      }
    }
  }

extension Chain {
  public enum Either3<First, Second, Third> {
    case first(First)
    case second(Second)
    case third(Third)
  }
}

extension Chain.Either3: Equatable
  where
    First: Equatable,
    Second: Equatable,
    Third: Equatable
  {}

extension Chain.Either3: Hashable
  where
    First: Hashable,
    Second: Hashable,
    Third: Hashable
  {}

extension Chain.Either3: Comparable
  where
    First: Comparable,
    Second: Comparable,
    Third: Comparable
  {
    @inlinable
    internal var rank: Int {
      switch self {
      case .first: return 1
      case .second: return 2
      case .third: return 3
      }
    }

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case let (.first(l), .first(r)):
        return l < r
      case let (.second(l), .second(r)):
        return l < r
      case let (.third(l), .third(r)):
        return l < r
      default: 
        return lhs.rank < rhs.rank
      }
    }
  }

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.Either3: Identifiable
  where
    First: Identifiable,
    Second: Identifiable,
    Third: Identifiable,
    First.ID == Second.ID,
    First.ID == Third.ID
  {
    public typealias ID = First.ID
    @inlinable
    public var id: ID {
      switch self {
      case let .first(value):
        return value.id
      case let .second(value):
        return value.id
      case let .third(value):
        return value.id
      }
    }
  }

extension Chain {
  public enum Either4<First, Second, Third, Fourth> {
    case first(First)
    case second(Second)
    case third(Third)
    case fourth(Fourth)
  }
}

extension Chain.Either4: Equatable
  where
    First: Equatable,
    Second: Equatable,
    Third: Equatable,
    Fourth: Equatable
  {}

extension Chain.Either4: Hashable
  where
    First: Hashable,
    Second: Hashable,
    Third: Hashable,
    Fourth: Hashable
  {}

extension Chain.Either4: Comparable
  where
    First: Comparable,
    Second: Comparable,
    Third: Comparable,
    Fourth: Comparable
  {
    @inlinable
    internal var rank: Int {
      switch self {
      case .first: return 1
      case .second: return 2
      case .third: return 3
      case .fourth: return 4
      }
    }

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case let (.first(l), .first(r)):
        return l < r
      case let (.second(l), .second(r)):
        return l < r
      case let (.third(l), .third(r)):
        return l < r
      case let (.fourth(l), .fourth(r)):
        return l < r
      default: 
        return lhs.rank < rhs.rank
      }
    }
  }

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.Either4: Identifiable
  where
    First: Identifiable,
    Second: Identifiable,
    Third: Identifiable,
    Fourth: Identifiable,
    First.ID == Second.ID,
    First.ID == Third.ID,
    First.ID == Fourth.ID
  {
    public typealias ID = First.ID
    @inlinable
    public var id: ID {
      switch self {
      case let .first(value):
        return value.id
      case let .second(value):
        return value.id
      case let .third(value):
        return value.id
      case let .fourth(value):
        return value.id
      }
    }
  }

extension Chain {
  public enum Either5<First, Second, Third, Fourth, Fifth> {
    case first(First)
    case second(Second)
    case third(Third)
    case fourth(Fourth)
    case fifth(Fifth)
  }
}

extension Chain.Either5: Equatable
  where
    First: Equatable,
    Second: Equatable,
    Third: Equatable,
    Fourth: Equatable,
    Fifth: Equatable
  {}

extension Chain.Either5: Hashable
  where
    First: Hashable,
    Second: Hashable,
    Third: Hashable,
    Fourth: Hashable,
    Fifth: Hashable
  {}

extension Chain.Either5: Comparable
  where
    First: Comparable,
    Second: Comparable,
    Third: Comparable,
    Fourth: Comparable,
    Fifth: Comparable
  {
    @inlinable
    internal var rank: Int {
      switch self {
      case .first: return 1
      case .second: return 2
      case .third: return 3
      case .fourth: return 4
      case .fifth: return 5
      }
    }

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case let (.first(l), .first(r)):
        return l < r
      case let (.second(l), .second(r)):
        return l < r
      case let (.third(l), .third(r)):
        return l < r
      case let (.fourth(l), .fourth(r)):
        return l < r
      case let (.fifth(l), .fifth(r)):
        return l < r
      default: 
        return lhs.rank < rhs.rank
      }
    }
  }

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.Either5: Identifiable
  where
    First: Identifiable,
    Second: Identifiable,
    Third: Identifiable,
    Fourth: Identifiable,
    Fifth: Identifiable,
    First.ID == Second.ID,
    First.ID == Third.ID,
    First.ID == Fourth.ID,
    First.ID == Fifth.ID
  {
    public typealias ID = First.ID
    @inlinable
    public var id: ID {
      switch self {
      case let .first(value):
        return value.id
      case let .second(value):
        return value.id
      case let .third(value):
        return value.id
      case let .fourth(value):
        return value.id
      case let .fifth(value):
        return value.id
      }
    }
  }

extension Chain {
  public enum Either6<First, Second, Third, Fourth, Fifth, Sixth> {
    case first(First)
    case second(Second)
    case third(Third)
    case fourth(Fourth)
    case fifth(Fifth)
    case sixth(Sixth)
  }
}

extension Chain.Either6: Equatable
  where
    First: Equatable,
    Second: Equatable,
    Third: Equatable,
    Fourth: Equatable,
    Fifth: Equatable,
    Sixth: Equatable
  {}

extension Chain.Either6: Hashable
  where
    First: Hashable,
    Second: Hashable,
    Third: Hashable,
    Fourth: Hashable,
    Fifth: Hashable,
    Sixth: Hashable
  {}

extension Chain.Either6: Comparable
  where
    First: Comparable,
    Second: Comparable,
    Third: Comparable,
    Fourth: Comparable,
    Fifth: Comparable,
    Sixth: Comparable
  {
    @inlinable
    internal var rank: Int {
      switch self {
      case .first: return 1
      case .second: return 2
      case .third: return 3
      case .fourth: return 4
      case .fifth: return 5
      case .sixth: return 6
      }
    }

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case let (.first(l), .first(r)):
        return l < r
      case let (.second(l), .second(r)):
        return l < r
      case let (.third(l), .third(r)):
        return l < r
      case let (.fourth(l), .fourth(r)):
        return l < r
      case let (.fifth(l), .fifth(r)):
        return l < r
      case let (.sixth(l), .sixth(r)):
        return l < r
      default: 
        return lhs.rank < rhs.rank
      }
    }
  }

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.Either6: Identifiable
  where
    First: Identifiable,
    Second: Identifiable,
    Third: Identifiable,
    Fourth: Identifiable,
    Fifth: Identifiable,
    Sixth: Identifiable,
    First.ID == Second.ID,
    First.ID == Third.ID,
    First.ID == Fourth.ID,
    First.ID == Fifth.ID,
    First.ID == Sixth.ID
  {
    public typealias ID = First.ID
    @inlinable
    public var id: ID {
      switch self {
      case let .first(value):
        return value.id
      case let .second(value):
        return value.id
      case let .third(value):
        return value.id
      case let .fourth(value):
        return value.id
      case let .fifth(value):
        return value.id
      case let .sixth(value):
        return value.id
      }
    }
  }

extension Chain {
  public enum Either7<First, Second, Third, Fourth, Fifth, Sixth, Seventh> {
    case first(First)
    case second(Second)
    case third(Third)
    case fourth(Fourth)
    case fifth(Fifth)
    case sixth(Sixth)
    case seventh(Seventh)
  }
}

extension Chain.Either7: Equatable
  where
    First: Equatable,
    Second: Equatable,
    Third: Equatable,
    Fourth: Equatable,
    Fifth: Equatable,
    Sixth: Equatable,
    Seventh: Equatable
  {}

extension Chain.Either7: Hashable
  where
    First: Hashable,
    Second: Hashable,
    Third: Hashable,
    Fourth: Hashable,
    Fifth: Hashable,
    Sixth: Hashable,
    Seventh: Hashable
  {}

extension Chain.Either7: Comparable
  where
    First: Comparable,
    Second: Comparable,
    Third: Comparable,
    Fourth: Comparable,
    Fifth: Comparable,
    Sixth: Comparable,
    Seventh: Comparable
  {
    @inlinable
    internal var rank: Int {
      switch self {
      case .first: return 1
      case .second: return 2
      case .third: return 3
      case .fourth: return 4
      case .fifth: return 5
      case .sixth: return 6
      case .seventh: return 7
      }
    }

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
      switch (lhs, rhs) {
      case let (.first(l), .first(r)):
        return l < r
      case let (.second(l), .second(r)):
        return l < r
      case let (.third(l), .third(r)):
        return l < r
      case let (.fourth(l), .fourth(r)):
        return l < r
      case let (.fifth(l), .fifth(r)):
        return l < r
      case let (.sixth(l), .sixth(r)):
        return l < r
      case let (.seventh(l), .seventh(r)):
        return l < r
      default: 
        return lhs.rank < rhs.rank
      }
    }
  }

@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15.0, *)
extension Chain.Either7: Identifiable
  where
    First: Identifiable,
    Second: Identifiable,
    Third: Identifiable,
    Fourth: Identifiable,
    Fifth: Identifiable,
    Sixth: Identifiable,
    Seventh: Identifiable,
    First.ID == Second.ID,
    First.ID == Third.ID,
    First.ID == Fourth.ID,
    First.ID == Fifth.ID,
    First.ID == Sixth.ID,
    First.ID == Seventh.ID
  {
    public typealias ID = First.ID
    @inlinable
    public var id: ID {
      switch self {
      case let .first(value):
        return value.id
      case let .second(value):
        return value.id
      case let .third(value):
        return value.id
      case let .fourth(value):
        return value.id
      case let .fifth(value):
        return value.id
      case let .sixth(value):
        return value.id
      case let .seventh(value):
        return value.id
      }
    }
  }

// END AUTO-GENERATED CONTENT