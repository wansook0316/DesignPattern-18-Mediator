//
//  Participant.swift
//  Mediator
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal protocol Participant: AnyObject {

    var mediator: Mediator { get }

}

internal protocol Loggable {

    func describe()

}
