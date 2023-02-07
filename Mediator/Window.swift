//
//  Window.swift
//  Mediator
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal class Window: Participant {

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

extension Window: Loggable {

    internal func describe() {
        print("Window: \(self.isClosed ? "닫힘" : "열림")")
    }

}
