///
/// @Generated by Mockolo
///

#if DEBUG

import Defaults
import Foundation
@testable import ios_auth_flow_sample


final class AuthRepositoryMock: AuthRepository {
    init() { }


    private(set) var validTokenCallCount = 0
    var validTokenHandler: (() async throws -> ())?
    func validToken() async throws  {
        validTokenCallCount += 1
        if let validTokenHandler = validTokenHandler {
            try await validTokenHandler()
        }
        
    }

    private(set) var authenticateCallCount = 0
    var authenticateHandler: (() async throws -> ())?
    func authenticate() async throws  {
        authenticateCallCount += 1
        if let authenticateHandler = authenticateHandler {
            try await authenticateHandler()
        }
        
    }
}

#endif