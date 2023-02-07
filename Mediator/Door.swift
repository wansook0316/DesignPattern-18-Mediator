//
//  Door.swift
//  Mediator
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal class Door: Participant {

    internal let mediator: Mediator

    private(set) var isClosed: Bool = true

    internal init(mediator: Mediator) {
        self.mediator = mediator
    }

    internal func open() {
        self.isClosed = false

        self.mediator.participantChanged(to: self)
    }

    internal func close() {
        self.isClosed = true

        self.mediator.participantChanged(to: self)
    }

}

extension Door: Loggable {

    internal func describe() {
        print("Door: \(self.isClosed ? "닫힘" : "열림")")
    }
    
}
