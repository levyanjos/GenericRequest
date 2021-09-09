//
//  MockURLProtocol.swift
//  GenericRequestTests
//
//  Created by Levy Cristian on 09/09/21.
//  Copyright © 2021 Levy Cristian. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
  
  static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

  override class func canInit(with request: URLRequest) -> Bool {
    true
  }

  override class func canonicalRequest(for request: URLRequest) -> URLRequest {
    request
  }

  override func startLoading() {
    guard let handler = MockURLProtocol.requestHandler else {
      return
    }

    do {
      let (response, data) = try handler(request)
      client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .allowedInMemoryOnly)
      client?.urlProtocol(self, didLoad: data)
      client?.urlProtocolDidFinishLoading(self)
    } catch {
      client?.urlProtocol(self, didFailWithError: error)
    }
  }

  override func stopLoading() {
  }
}

