import Foundation
/*:
# Кортежи, перечисления и псевдонимы типов

В этом разделе ты узнаешь:
- что такое перечисления (`enum`)
- как производить итерацию по кейсам перечисления
- что такое ассоциативные значения
- что такое кортежи  (`tuple`)
- что такое пвсевдонимы типа (`typealias`)

Внимательно изучи:
- [Перечисления](https://docs.swift.org/swift-book/LanguageGuide/Enumerations.html)
- [Кортежи](https://medium.com/swift-programming/swift-tuple-328aecff50e7)
- [Псевдонимы типов](https://www.avanderlee.com/swift/typealias-usage-swift/)

Закрепи пройденный материал:

#### Задание 1
 
 - Создай кортеж с тремя параметрами: твой любимый фильм, любимый  город и любимое блюдо. Все элементы кортежа должны быть именованы.
 - Выведи в консоль твой любимый город (данные возьми из кортежа).
 */
// Добавь код сюда:

let favorite = (film: "Man of Steel", city: "Kharkiv", meal: "PizzZZza")

print(favorite.city)


/*:
---
#### Задание 2

- Напиши функцию _minMax_, которая принимает в качестве параметра массив целых чисел и возвращает минимальное и максимальное из них в виде кортежа.
- Результат работы функции выведи в консоль.
 - Example: 😉\
 _Function Call:_\
 minmax([2, 3, 10, 1])\
 _Output:_\
 (1, 10)
*/

// Добавь код сюда:

func minMax(array: [Int]) -> (Int, Int) {
    guard let min = array.min(), let max = array.max() else {
        print("Тут пусто, поэтому вот нолики")
        return (0, 0)
    }
        
    return (min, max)
}

print("Мин значение: \(minMax(array: [1, 5, 7, 2, 0]).0) Макс значение: \(minMax(array: [1, 5, 7, 2, 0]).1)")


/*:
---
#### Задание 3
 
 - Обьяви перечисление (`enum`) _Season_, описывающее времена года и состояющее из следующих строковых значений: _winter_, _spring_, _summer_, _autumn_.

 - Напиши функцию, которая выводит в консоль все элементы из этого перечисления.
 - Example: 😉\
 _Output:_\
 Seasons:\
 winter\
 spring\
 summer\
 autumn
 */

// Добавь код сюда:
enum Seasons: CaseIterable {
    case winter, spring, summer, autumn
}

func allSeasons() {
    for season in  Seasons.allCases {
        print(season)
    }
}

allSeasons()
/*:
---
#### Задание 4
 
 - Обьяви перечисление (`enum`) _CoinType_, описывающее различные стоимости монет.
 - Note: 👆 _В качестве примера возьми следующие значения:\
 penny = 1\
 nickle = 5\
 dime = 10\
 quarter = 25_
 */
/*:
 - Обьяви массив _money_, элементами которого являются кортежи _(amount, type)_. Проинициализируй массив любыми соответствующими его типу значениями.
*/
// Добавь код сюда:

enum CoinType: Int {
    case penny = 1, nickle = 5, dime = 10, quarter = 25
}

var moneyArray: [(amount: Int, ofCoins: CoinType)] = [(1, .penny),(3, .nickle),(5, .dime),(9, .quarter)]



/*:
 - Выведи в консоль общую стоимость монет.
 - Example: 😉\
 _Input:_\
 var moneyArray : [(Int,CoinType)] = [(10, .penny),(15,.nickle),(3,.quarter),(20,.penny),(3,.dime),(7,.quarter)]\
 _Output:_\
 All: 385
*/
// Добавь код сюда:

var sumOfAll = 0
moneyArray.forEach { (amount, coin) in
    sumOfAll += amount * coin.rawValue
}
    print("Суммарная стоимость монет: \(sumOfAll)")
/*:
---
#### Задание 5
 
 - Объяви псевдоним (`typealias`) типа `String` с именем _Text_.
 */
// Добавь код сюда:

typealias Text = String
/*:
 - Объяви три константы типа `Text`. Значения двух констант должны состоять только из цифр, третьей — из цифр и букв.
 */
// Добавь код сюда:

let textNums = "187"
let anotherTextNums = "91"
let textAndNums = "771 and some text"

/*:
 - Из всех трех констант найди те, которые состоят только из цифр, и выведи их в консоль.
*/
// Добавь код сюда:
let numsOnly = [textNums, anotherTextNums, textAndNums, "для теста 1", "375"]

numsOnly.forEach { (item) in
    if let digit = Int(item) {
        print("Строка только из чисел: \(digit)")
    }
}

/*:
 - Создай псевдоним для типа `(numberOne: Text?, numberTwo: Text?)?` с именем _TupleType_.
  - Note: 👆 _Обрати внмиание, что данный тип является опциональным и также содержит в себе опциональные значения_
 */
// Добавь код сюда:

typealias optionalTupleType = (numberOne: Text?, numberTwo: Text?)?
/*:
 - Создай три переменные типа `TupleType`, содержащие следующие значения: _(“190”, “67”)_, _(“100”, nil)_, _(“-65”, “70”)_.
 - Выведите значения элементов тех кортежей, в которых ни один из элементов не инициализирован как `nil`.
 */
// Добавь код сюда:

var tupleTheFirst: optionalTupleType = ("190", "67")
var tupleTheSecond: optionalTupleType = ("100", nil)
var tupleTheThird: optionalTupleType = ("-65", "70")

let tupleArray = [tupleTheFirst, tupleTheSecond, tupleTheThird]

tupleArray.forEach { (item) in
    guard let checkingFirstElement = item?.numberOne,
          let checkingSecondElement = item?.numberTwo
    else {
        return
    }
    
    print(checkingFirstElement,checkingSecondElement)
    
}




//: [Назад: Замыкания](@previous)  |  Страница 8  |  [Вперед: Коллекции. Словари](@next)
