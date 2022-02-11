import ChainSequenceCore
import XCTest

@testable import ChainSequence

final class ChainSequenceTests: XCTestCase {
  func testSequence() throws {
    let sequence = ChainSequence {
      [0, 1, 2]
      3...5
      [5, 6, 7, 8].suffix(from: 1)
      [9]
    }
    XCTAssertEqual(Array(sequence), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
  }

  func testIndexAfter() throws {
    let sequence = ChainSequence {
      [0, 1, 2]
      3...5
      [5, 6, 7, 8].suffix(from: 1)
      [9]
    }
    XCTAssertEqual(sequence.index(after: .third(3)), .fourth(0))
  }

  func testDistance() throws {
    let sequence = ChainSequence {
      [0, 1, 2]
      3...5
      [5, 6, 7, 8].suffix(from: 1)
      [9]
    }
    XCTAssertEqual(sequence.distance(from: .first(1), to: .fourth(0)), 8)
    XCTAssertEqual(sequence.distance(from: .fourth(0), to: .first(2)), -7)
  }

}
