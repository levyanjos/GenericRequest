//
//  BoredAPIClientTest.swift
//  GenericRequestTests
//
//  Created by Levy Cristian on 09/09/21.
//  Copyright © 2021 Levy Cristian. All rights reserved.
//

import Quick
import Nimble
import Foundation
@testable import GenericRequest

class BoredAPIClientTest: QuickSpec {
    
    var api = BoredAPIClient()
    
    private lazy var mockedData: Data? = {
        guard let path = Bundle(for: type(of: self)).path(forResource: "boredAPIResponseMock", ofType: "json") else {
            return nil
        }
        
        guard let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return nil
        }
        return jsonData
    }()
    
    private func mockURLSection() {
        MockURLProtocol.requestHandler = nil
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        api = BoredAPIClient(session: urlSession)
    }
    
    override func spec() {
        
        beforeEach {
            self.mockURLSection()
        }
        
        describe("activity endpoint") {
            
            context("on success") {
                
                it("should return an activity") {
                    
                    guard let mockedData = self.mockedData else {
                        return fail("Unable to retrive mocked data")
                    }
                    
                    MockURLProtocol.requestHandler = { _ in
                        (HTTPURLResponse(), mockedData)
                    }
                    waitUntil { done in
                        self.api.getActivities { result in
                            switch result {
                            case .failure(let error):
                                fail("Unexpected error: \(error)")
                                
                            case .success(let response):
                                guard let response = response else {
                                    return fail("Unexpected error")
                                }
                                expect(response.description.isEmpty).toNot(beTrue())
                            }
                            done()
                        }
                    }
                }
            }
        }
    }
}
