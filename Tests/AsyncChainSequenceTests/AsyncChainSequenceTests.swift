import ChainSequenceCore
import XCTest

@testable import AsyncChainSequence

final class AsyncChainSequenceTests: XCTestCase {
  func testSequence() async throws {
    let range = AsyncStream(Int.self) { continuation in
      Task.detached {
        for digit in 3...5 {
          continuation.yield(digit)
        }
        continuation.finish()
      }
    }

    let sequence = ChainSequence {
      [0, 1, 2].async
      range
      [5, 6, 7, 8].suffix(from: 1).async
      [9].async
    }
    var accumulated = [Int]()
    for try await i in sequence {
      accumulated.append(i)
    }
    XCTAssertEqual(accumulated, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  }
}

struct AsyncWrapper<S>: AsyncSequence where S: Sequence {
  typealias Element = S.Element
  let base: S

  struct AsyncIterator: AsyncIteratorProtocol {
    var base: S.Iterator
    init(
      _ base: S
    ) {
      self.base = base.makeIterator()
    }
    mutating func next() async throws -> S.Element? {
      try await Task.sleep(nanoseconds: 100)
      return base.next()
    }
  }
  func makeAsyncIterator() -> AsyncIterator {
    AsyncIterator(base)
  }
}

extension Sequence {
  var async: AsyncWrapper<Self> { AsyncWrapper(base: self) }
}
