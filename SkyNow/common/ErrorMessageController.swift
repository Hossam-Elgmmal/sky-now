//
//  ErrorMessageController.swift
//  SkyNow
//
//  Created by Hossam on 09/06/2026.
//

import Foundation
import Combine

@MainActor
final class ErrorMessageController : ObservableObject {
    
    static let shared = ErrorMessageController()
    
    @Published private(set) var currentMessage: ErrorMessage?
    
    private var dismissTask: Task<Void, Never>?
    
    private init() {}
    
    func showAlert(
        message: String,
        duration: TimeInterval = 3
    ) {
        
        dismissTask?.cancel()
        
        currentMessage = ErrorMessage(
            message: message
        )
        
        dismissTask = Task {
            
            try? await Task.sleep(
                nanoseconds: UInt64(duration * 1_000_000_000)
            )
            
            guard !Task.isCancelled else {
                return
            }
            
            currentMessage = nil
        }
    }
    
    func dismiss() {
        dismissTask?.cancel()
        currentMessage = nil
    }
}
