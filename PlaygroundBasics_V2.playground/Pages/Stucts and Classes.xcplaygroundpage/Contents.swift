import Foundation
/*:
# Структуры и классы

В этом разделе ты узнаешь:
- что такое структуры и классы, чем они отличаются
- что такое свойства и методы
- что такое наследование классов и расширение классов и структур
- что такое инициализация и деинициализация

Внимательно изучи:
- [Структуры и классы](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html#)
- [Свойства](https://docs.swift.org/swift-book/LanguageGuide/Properties.html)
- [Методы](https://docs.swift.org/swift-book/LanguageGuide/Methods.html)
- [Наследование](https://docs.swift.org/swift-book/LanguageGuide/Inheritance.html)
- [Инициализация](https://docs.swift.org/swift-book/LanguageGuide/Initialization.html)
- [Деинициализация](https://docs.swift.org/swift-book/LanguageGuide/Deinitialization.html)
- [Расширения](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)

Закрепи пройденный материал:
#### Задание 1
 - Объяви структуру _Point_, которая будет содержать два  свойства _x_ и _y_ типа `Double`.
 */

// Добавь код сюда:

struct Point {
    var x: Double
    var y: Double
}


/*:
 - Создай экземпляр структуры `Point` c именем _point_ (значения  для _x_ и _y_ задай на свое усмотрение).
 */
// Добавь код сюда:

var point = Point(x: 1.1, y: 3.14)

/*:
 - Выведи в консоль значения для _x_ и _y_.
 */
// Добавь код сюда:

print(point.x, point.y)
/*:
 - Измени значения _x_ и _y_. Выведи новые значение в консоль.
 */
// Добавь код сюда:

point.x = 7.0
point.y = 1.0

print(point.x, point.y)
/*:
---
#### Задание 2
- Объяви структуру _Line_, которая будет иметь два  свойства _p1_ и _p2_ типа `Point`.
 - Добавь метод _length_ в структуру, который будет возвращать длину отрезка типа `Double`.
 - Note: 👆 _Для вычисления длины используй следующую формулу:_\
  ![Length](Playground.Length.png)
 */
// Добавь код сюда:
struct Line {
    var p1: Point, p2: Point
    
    func length() -> Double {
        let lineLength = sqrt( ((p2.x - p1.x) * (p2.x - p1.x)) + ((p2.y - p1.y) * (p2.y - p1.y)) )
        
        return lineLength
    }
}
/*:
 - Создай экземпляр структуры  `Line` c именем _line_ (значения  для _p1_ и _p2_ задай на свое усмотрение).
 - Выведи в консоль длину линии _line_.
 */
// Добавь код сюда:

let pointA = Point(x: 1, y: 3)
let pointB = Point(x: 7, y: 7)

let line = Line(p1: pointA, p2: pointB)
print(line.length())
/*:
---
#### Задание 3
 - Объяви класс _Weather_, который будет иметь два свойства _windSpeed_ и _chanceOfRain_ типа `Int`.
 */
// Добавь код сюда:

class Weather {
    let windSpeed: Int
    let chanceOfRain: Int
    
   


/*:
 - У класса должен быть обязательный инициализатор, который принимает значения скорости ветра (_windSpeed_) и шанс дождя (_chanceOfRain_)
 */
// Добавь код сюда:

    init(windSpeed: Int, chanceOfRain: Int) {
        self.windSpeed = windSpeed
        self.chanceOfRain = chanceOfRain
    }
/*:
 - Добавь в класс функцию _isDayForWalk_. Если скорость ветра (_windSpeed_) меньше 5 метров и шанс дождя (_chanceOfRain_) меньше 30 процентов, то функция должна вернуть _true_,  иначе  - _false_.
 */
// Добавь код сюда:

    func isDayForWalk() -> Bool {
        
        if windSpeed < 5 && chanceOfRain < 30 {
            return true
        }
        
        return false
    }

}
/*:
 - Создай экземпляр класса и выведи в консоль удачный ли сегодня день для прогулок 😉.
 */
// Добавь код сюда:

let weather = Weather(windSpeed: 4, chanceOfRain: 39)

if weather.isDayForWalk() {
    print("Гуляем")
} else {
    print("Карантиним")
}

/*:
---
#### Задание 4
 - Объяви класс _Point2D_, который будет иметь два свойства _x_ и _y_ типа `Double`. Свойства должны быть инициализированными 0 по умолчанию.
 */
// Добавь код сюда:
class Point2D {
    var x: Double = 0
    var y: Double = 0
    
   

/*:
 - Добавь в класс `Point2D`, метод  _reset_, который будет устанавливать координаты _x_ и _y_ в 0.
*/
// Добавь код сюда:

    func reset() {
        x = 0
        y = 0
    }
    
/*:
 - Добавь инициализатор в класс `Point2D`, который в качестве параметров будет принимать значения для координат _x_ и _y_.
 */
// Добавь код сюда:
    
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
/*:
- Объяви класс _Point3D_, который будет дочерним классом по отношению к классу `Point2D`. Добавь в него свойство _z_, которое будет проинициализировано по умолчанию нулем.
 */
// Добавь код сюда:

class Point3D: Point2D {
    var z: Double = 0

/*:
 - Добавь инициализатор, который будет в качестве параметров принимать значения для координат _x_, _y_ и _z_.
 - Note: 👆 _Используй механизм переопределения методов._
 */
// Добавь код сюда:

    init(x: Double, y: Double, z: Double) {
        super.init(x: x, y: y)
    }
    
    override func reset() {
        super.reset()
    }
}
/*:
 - Создай экземпляр класса `Point3D` с именем _point3D_.
 */
// Добавь код сюда:

let point3D = Point3D(x: 1, y: 2, z: 3)

/*:
 - Сделай так, чтобы при вызове метода _reset_, также сбрасывалась в ноль и координата _z_.
 - Note: 👆 _Используй механизм переопределения методов._
 */

// Добавь код сюда:

point3D.reset()

print(point3D.x, point3D.y, point3D.z)

/*:
---
#### Задание 5
 - Реализуй иерархию классов, представленной на рисунке:

 ![Telephone inheritance](Playground.TelephoneInheritance.png)
 */
// Добавь код сюда:
class Telephone {
    func makeCall() {}
    func hangUp() {}
}

class Landline: Telephone {
}

class Rotary: Landline {
    func rotaryInput() {}
}

class Push_button: Landline {
    func buttonInput() {}
}




class Cellular: Telephone {
    func sendSMS() {}
}

class Non_smart: Cellular {
    func buttonInput() {}
}

class Smart: Cellular {
    func touchInput() {}
    func accessInternet() {}
}

class iPhone: Smart {
    func iOS() {}
}

class Android: Smart {
    func androidOS() {}
}

class Windows: Smart {
    func windowsOS() {}
}
/*:
---
#### Задание 6
 - Приведи пример структуры, имеющей одно приватное свойства, которое инициализируется при помощи замыкания.
*/
// Добавь код сюда:


struct CountXAndY {
    private let sum: Int = {
        let x = 10
        let y = -3
        
        return x + y
  }()
    
    func printSum() {
        print(sum)
    }
}

let countSum = CountXAndY()
countSum.printSum()

//: [Назад: Коллекции. Словари](@previous)  |  Страница 10  |  [Вперед: Протоколы](@next)
