//
//  Boiler.swift
//  Mediator
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal class Boiler: Participant {

    internal let mediator: Mediator

    private(set) var isRunning: Bool = true

    internal init(mediator: Mediator) {
        self.mediator = mediator
    }

    internal func turnOn() {
        self.isRunning = false

        self.mediator.participantChanged(to: self)
    }

    internal func turnOff() {
        self.isRunning = true

        self.mediator.participantChanged(to: self)
    }

}

extension Boiler: Loggable {

    internal func describe() {
        print("Boiler: \(self.isRunning ? "켜짐" : "꺼짐")")
    }

}
