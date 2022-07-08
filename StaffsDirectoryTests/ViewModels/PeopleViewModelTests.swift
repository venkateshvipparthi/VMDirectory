//
//  PeopleViewModelTests.swift
//  VMDirectoryAPPTests
//
//  Created by Admin on 08/07/2022.
//

import XCTest
@testable import VMDirectoryAPP
class PeopleViewModelTests: XCTestCase {
    
    var peopleViewModel: PeoplesViewModel!
   
    override func setUpWithError() throws {
  
        let mockNetworkMaanger = MockNetworkManager()
        
        peopleViewModel = PeoplesViewModel(networkManager: mockNetworkMaanger)
        
    }

    override func tearDownWithError() throws {
       
    }

    func testFetchStaff_success() {
            
        peopleViewModel.fetchPeoples(baseUrl: "", path: "people_success_response")
         
        XCTAssertEqual(peopleViewModel.peoplesCount , 69)
    }
    
    func testFetchStaff_failure() {
        peopleViewModel.fetchPeoples(baseUrl: "", path: "failure_response")

        XCTAssertEqual(peopleViewModel.peoplesCount , 0)
    }

    func testGetStaff() {
        
        var staff = peopleViewModel.getPeopleDetailFor(index: 2)
        
        XCTAssertNil(nil)
        
         staff = peopleViewModel.getPeopleDetailFor(index: -1)
        
        XCTAssertNil(nil)
        
        peopleViewModel.fetchPeoples(baseUrl: "", path: "people_success_response")

        staff = peopleViewModel.getPeopleDetailFor(index: 0)
       
        XCTAssertNotNil(staff)
        
        XCTAssertEqual(staff!.lastName, "Brekke")
    }

}
