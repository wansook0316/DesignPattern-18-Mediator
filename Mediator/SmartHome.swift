//
//  SmartHome.swift
//  Mediator
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

internal class SmartHome: Mediator {

    // Coupling이 너무 센 것 같다.
    // Participant의 생성자에 mediator를 안넣고 delegate와 같은 방식으로 가는게 좋을 듯
    // 일단 원래 책의 관점에서 하는 거니 그냥 한다.
    internal init() {
        self.door = Door(mediator: self)
        self.window = Window(mediator: self)
        self.boiler = Boiler(mediator: self)
        self.airConditioner = AirConditioner(mediator: self)
    }

    // 진짜 별로임 굳이 이렇게 안해도됨
    internal func participantChanged(to participant: Participant) {
        guard let door, let window, let boiler, let airConditioner else {
            return
        }
        if participant is Door && door.isClosed == false {
            airConditioner.turnOff()
            boiler.turnOff()
        }

        if participant is Window, window.isClosed == false {
            airConditioner.turnOff()
            boiler.turnOff()
        }

        if participant is AirConditioner, airConditioner.isRunning {
            boiler.turnOff()
            door.close()
            window.close()
        }

        if participant is Boiler, boiler.isRunning {
            airConditioner.turnOff()
            door.close()
            window.close()
        }

    }

    internal var door: Door?
    internal var window: Window?
    internal var boiler: Boiler?
    internal var airConditioner: AirConditioner?

}

extension SmartHome: Loggable {

    internal func describe() {
        print("States")
        self.door?.describe()
        self.window?.describe()
        self.boiler?.describe()
        self.airConditioner?.describe()
    }

}
