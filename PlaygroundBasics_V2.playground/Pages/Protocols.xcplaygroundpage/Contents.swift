import Foundation
/*:
# Протоколы

В этом разделе ты узнаешь:
- что такое протокол
- какой у него синтакисис
- что значит фраза " класс (структура) удовлетворяет протокол".

Внимательно изучи:
- [Протокол](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)

Закрепи пройденный материал:
#### Задание 1
 - Объяви протокол _Employee_. Он должен содержать одно свойство _hours_ типа `Int` и один метод _work()_ без параметров и возвращаемого значения.
 */
// Добавь код сюда:

protocol Employee {
    var hours: Int { get set }
    
    func work()
}

/*:
 - Обьяви два класса _Painter_ и _Doctor_.
 - Укажи, что оба этих класса удовлетворяют протоколу.
 - Реализуй протокол в каждом из классов.
 */
// Добавь код сюда:

class Painter: Employee {
    var hours: Int = 17520
    
    func work() {
        print("Painter was drowing his square for about \(hours) hours")
    }
    
}

class Doctor: Employee {
    var hours: Int = 12
    
    func work() {
        print("Doc has worked \(hours) hours")
    }
    
}
/*:
 - Создай экземпляры каждого из классов.
 - Вызови метод _work_ для каждого из них.
 */
let painter = Painter()
let doc = Doctor()

painter.work()
doc.work()
/*:
---
#### Задание 2
 - Реализуй иерархию классов, представленную на рисунке:
 ![Telephone](Playground.Telephone.Protocols.png)
 - Note: 👆 _Обрати внимание, что классы iOS, androidOS  и windowsOS удовлетворяют протоколу Internetable_
 */
// Добавь код сюда:

protocol Telephone {
    func makeCall()
    func hangUp()
}

protocol Landline: Telephone {
    
}

protocol Cellular: Telephone {
    func sendSMS()
}

protocol Rotaryable {
    func rotaryInput()
}

protocol PushButtonable {
    func buttonInput()
}

protocol Touchable {
    func touchInput()
}

protocol Internetable {
    func accessInternet()
}

class Push_button: Landline, PushButtonable {
    func buttonInput() {}
    func makeCall() {}
    func hangUp() {}
}

class Rotary: Landline, Rotaryable {
    func makeCall() {}
    func hangUp() {}
    func rotaryInput() {}
}

class Non_smart: Cellular, PushButtonable {
    func sendSMS() {}
    func buttonInput() {}
    func makeCall() {}
    func hangUp() {}
}

class iPhone: Cellular, Touchable, Internetable {
    func sendSMS() {}
    func touchInput() {}
    func accessInternet() {}
    func makeCall() {}
    func hangUp() {}
}
class Androidphone: Cellular, Touchable, Internetable {
    func sendSMS() {}
    func touchInput() {}
    func accessInternet() {}
    func makeCall() {}
    func hangUp() {}
}

class Windosphone: Cellular, Touchable, Internetable {
    func sendSMS() {}
    func touchInput() {}
    func accessInternet() {}
    func makeCall() {}
    func hangUp() {}
}


//: [Назад: Структуры и классы](@previous)  |  Страница 11  |  [Вперед: Делегаты](@next)
