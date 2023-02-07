//
//  main.swift
//  Mediator
//
//  Created by Choiwansik on 2023/02/07.
//

import Foundation

// 쓰레기 코드임 무한 루프 돌아감
// 그냥 이런게 있다 정도만 알아두고 이렇게 구현하면 절대 안됨.
internal func main() {
    let smartHome = SmartHome()

    print("10번 반복합니다.")

    (1..<10).forEach { _ in

        print("[1] 문 열기")
        print("[2] 문 닫기")
        print("[3] 창문 열기")
        print("[4] 창문 닫기")
        print("[5] 에어컨 켜기")
        print("[6] 에어컨 끄기")
        print("[7] 보일러 켜기")
        print("[8] 보일러 끄기")
        print("입력해주세요.")

        let line = readLine()

        guard let line = line,
              let number = Int(line),
              (1...8).contains(number) else {
            return
        }

        switch number {
        case 1:
            smartHome.door?.open()
        case 2:
            smartHome.door?.close()
        case 3:
            smartHome.window?.open()
        case 4:
            smartHome.window?.close()
        case 5:
            smartHome.boiler?.turnOn()
        case 6:
            smartHome.boiler?.turnOff()
        case 7:
            smartHome.airConditioner?.turnOn()
        case 8:
            smartHome.airConditioner?.turnOff()
        default:
            return
        }

    }



}

main()
