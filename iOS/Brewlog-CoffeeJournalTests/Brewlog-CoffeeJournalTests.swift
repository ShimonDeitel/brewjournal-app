import XCTest
@testable import Brewlog-CoffeeJournal

@MainActor
final class Brewlog-CoffeeJournalTests: XCTestCase {
    var store: Store!

    override func setUp() {
        super.setUp()
        store = Store()
    }

    func testSeedDataLoadedOnFreshInstall() {
        XCTAssertFalse(store.items.isEmpty)
    }

    func testSeedCountIsBelowFreeLimit() {
        XCTAssertLessThan(store.items.count, Store.freeLimit)
    }

    func testAddIncreasesCount() {
        let before = store.items.count
        store.add(Brew())
        XCTAssertEqual(store.items.count, before + 1)
    }

    func testCanAddWhenBelowLimit() {
        XCTAssertTrue(store.canAdd(isPro: false))
    }

    func testCannotAddPastFreeLimitWhenNotPro() {
        for _ in 0..<(Store.freeLimit + 5) {
            store.add(Brew())
        }
        XCTAssertFalse(store.canAdd(isPro: false))
    }

    func testCanAlwaysAddWhenPro() {
        for _ in 0..<(Store.freeLimit + 5) {
            store.add(Brew())
        }
        XCTAssertTrue(store.canAdd(isPro: true))
    }

    func testDeleteRemovesItem() {
        let item = Brew()
        store.add(item)
        store.delete(item)
        XCTAssertFalse(store.items.contains(where: { $0.id == item.id }))
    }

    func testIsAtFreeLimitReflectsCount() {
        while store.items.count < Store.freeLimit {
            store.add(Brew())
        }
        XCTAssertTrue(store.isAtFreeLimit)
    }
}
