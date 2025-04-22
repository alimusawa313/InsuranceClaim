//
//  InsuranceClaimTests.swift
//  InsuranceClaimTests
//
//  Created by Ali Haidar on 4/22/25.
//

import XCTest
@testable import InsuranceClaim

@MainActor
final class InsuranceClaimTests: XCTestCase {
    
    
    var viewModel: ClaimsViewModel!
    
    override func setUpWithError() throws {
        viewModel = ClaimsViewModel()
        viewModel.claims = [
            Claim(userId: 100, id: 2, title: "Car accident", body: ""),
            Claim(userId: 200, id: 1, title: "Fire damage", body: ""),
            Claim(userId: 150, id: 3, title: "Water leak", body: "")
        ]
    }
    
//    Tests filtering claims using a search term that matches one item
    func testSearchFilterWorks() {
        viewModel.searchText = "fire"
        let filtered = viewModel.filteredClaims
        XCTAssertEqual(filtered.count, 1)
        XCTAssertEqual(filtered.first?.title, "Fire damage")
    }
    
//    Tests sorting claims by ascending claim ID
    func testSortByClaimIDAsc() {
        viewModel.sortOption = .claimIDAsc
        let sorted = viewModel.filteredClaims
        XCTAssertEqual(sorted.map(\.id), [1, 2, 3])
    }
    
//    Tests sorting claims by descending claim ID
    func testSortByClaimIDDesc() {
        viewModel.claims = [
            Claim(userId: 100, id: 1, title: "A", body: ""),
            Claim(userId: 100, id: 3, title: "B", body: ""),
            Claim(userId: 100, id: 2, title: "C", body: "")
        ]
        viewModel.sortOption = .claimIDDesc
        let result = viewModel.filteredClaims
        XCTAssertEqual(result.map(\.id), [3, 2, 1])
    }

//    Tests sorting claimans by ascending user ID
    func testSortByClaimantIDAsc() {
        viewModel.claims = [
            Claim(userId: 30, id: 1, title: "A", body: ""),
            Claim(userId: 10, id: 2, title: "B", body: ""),
            Claim(userId: 20, id: 3, title: "C", body: "")
        ]
        viewModel.sortOption = .claimantIDAsc
        let result = viewModel.filteredClaims
        XCTAssertEqual(result.map(\.userId), [10, 20, 30])
    }
    
//    Tests sorting claimants by descending user ID
    func testSortByClaimantIDDesc() {
        viewModel.sortOption = .claimantIDDesc
        let sorted = viewModel.filteredClaims
        XCTAssertEqual(sorted.map(\.userId), [200, 150, 100])
    }
    
//    Tests filtering with a search term that matches no items
    func testSearchTextWithNoMatchReturnsEmpty() {
        viewModel.claims = [
            Claim(userId: 10, id: 1, title: "Flood damage", body: ""),
            Claim(userId: 20, id: 2, title: "Theft", body: "")
        ]
        viewModel.searchText = "earthquake"
        let results = viewModel.filteredClaims
        XCTAssertTrue(results.isEmpty)
    }
    
//    Tests behavior of filteredClaims when there are no claims
    func testFilteredClaimsWithEmptyClaimsArray() {
        viewModel.claims = []
        viewModel.searchText = ""
        viewModel.sortOption = .claimIDAsc
        XCTAssertTrue(viewModel.filteredClaims.isEmpty)
    }

    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
//    Measures performance of filtering and sorting a large dataset
    func testPerformanceExample() throws {
        // Generate a large number of dummy claims for performance testing
        let largeDataset = (1...10_000).map {
            Claim(userId: Int.random(in: 1...1000), id: $0, title: "Claim \($0)", body: "Details for claim \($0)")
        }

        viewModel.claims = largeDataset
        viewModel.searchText = "Claim"
        viewModel.sortOption = .claimIDDesc

        measure {
            _ = viewModel.filteredClaims
        }
    }

    
}
