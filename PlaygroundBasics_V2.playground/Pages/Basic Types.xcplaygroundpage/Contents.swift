import Foundation
/*:
# Типы данных

В этом разделе ты узнаешь:
- что такое константы и переменные
- для чего нужны базовые оператор
- почему Swift считается строготипизированным языком программирования
- разберешься чем типы для целых чисел отчиличаются от типов для чисел с плавающей точкой
- что такое логический тип и как он представлен в Swift
- какие бывают строковые типы
- как делать преобразование типов
- что такое опциональны типы

Внимательно изучи:
- [Константы и переменные](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Простые типы данных](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Базовые операторы](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Строки и символы](https://docs.swift.org/swift-book/LanguageGuide/StringsAndCharacters.html)
 - 

Закрепи пройденный материал:

#### Задание 1:
 - Объяви две целочисленные однотипные переменные, при этом тип данных первой должен быть задан неявно, а второй — явно. Обеим переменным должны быть присвоены значения.
 - Поменяй значения переменных местами.
 - Выведи получившиеся значения в консоль. При этом в каждом варианте выводимых данных текстом напиши, какую переменную ты выводишь.
*/

// Добавь код сюда:

var implicitInt = 3
var explicitInt: Int = 7

var temp = implicitInt
implicitInt = explicitInt
explicitInt = temp

print("implicitInt now: \(implicitInt)","\nexplicitInt now: \(explicitInt)")
/*:
---
### Задание 2:
 - Объяви три параметра. Первый из них должен быть константой типа `Float` с произвольным числовым значением, второй — пустой константой типа `Float`, третий — пустой переменной типа `Double`.
 - Установи новое произвольное значение всем параметрам, для которых эта операция возможна.
*/
// Добавь код сюда:

let floatNum: Float = 3.71
let emptyFloatNum: Float
var emptyDoubleNum: Double

emptyFloatNum = 37.1
emptyDoubleNum = 3.14
/*:
---
#### Задание 3:
 - Объяви три пустые константы: одну типа `Int`, одну типа `Float` и одну типа `Double`.
 - Проинициализируй их следующими значениями: для `Int` значение 18, для `Float` — 16.4,  для `Double` — 5.7.
 - Найди сумму всех трех констант и запишите ее в переменную типа `Float`. Результат выведи в консоль.
*/
// Добавь код сюда:

let emptyIntConst: Int
let emptyFloatConst: Float
let emptyDoubleConst: Double

emptyIntConst = 18
emptyFloatConst = 16.4
emptyDoubleConst = 5.7

var sumOfConsts: Float = Float(emptyIntConst) + emptyFloatConst + Float(emptyDoubleConst)
print("Сумма равна: \(sumOfConsts)")
/*:
- Найди произведение всех трех констант и запиши его в переменную типа `Int`. Результат выведи в консоль.
 - Note: 👆 _Помни, что тебе необходимо получить результат с минимальной погрешностью._
*/
// Добавь код сюда:

var multipliedConsts: Int = Int (Double(emptyIntConst) * Double(emptyFloatConst) * emptyDoubleConst)

print("Результат умножание равен: \(multipliedConsts)")
/*:
- Найди остаток от деления константы типа `Float` на константу типа `Double` и запиши ее в переменную типа `Double`. Результат выведи в консоль.
*/
// Добавь код сюда:
var remainder: Double = Double(Int(emptyFloatConst) % Int(emptyDoubleConst))

print("Остаток от деления: \(remainder)")
/*:
---
#### Задание 4:
 - Объяви переменную типа `String` и запиши в нее произвольный строковый литерал.
 - Объяви две переменные типа `Int` и запиши в них произвольные значения.
 - Одним выражением объедини в строковый литерал переменную типа `String` и сумму переменных типа `Int`, а результат запиши в новую константу.
 - Выведи в консоль результат.
 */
// Добавь код сюда:

var someString: String = "Какая то переменная со строкой"
var someInt: Int = 5, anotherInt: Int = 15

let concatenation = someString + "и значением " + String(someInt + anotherInt)

print(concatenation)
/*:
---
#### Задание 5:
 - Объяви две логические переменные. Значение первой должно быть равно _true_, второй — _false_.
 - Запиши в две константы результат использования их в качестве операндов для операторов логического `И` или `ИЛИ`.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:

var someBool: Bool = true, anotherBool: Bool = false

let logicAnd = someBool && anotherBool
let logicOr = someBool || anotherBool

print("И: \(logicAnd)", "\nИЛИ:\(logicOr)")
/*:
---
#### Задание 6:
 - Напиши при помощи строк свое имя, фамилию и дату рождения.
 - Собери эти строки в одну и выведи в консоль получившееся значение.
 - Выведи на консоль значения обеих получившихся констант.

 */
// Добавь код сюда:

let name = "Александр Ганин", birthDate = "22.10.1989"

print(name + " " + birthDate)

print(name, birthDate)

/*:
---
## Продвинутый уровень:

#### Задание 7:
 - Создай 5 строк с названием стран.
 - Если в названии страны встречается буква А, выведи ее нзавание в консоль.
*/
// Добавь код сюда:

let firstCountry = "USA", secondCountry = "Brazil", thirdCountry = "Albania", foursCountry = "Belgium", fifthCountry = "Brunei"

let arrayOfCountries = [firstCountry, secondCountry, thirdCountry, foursCountry, fifthCountry]

print(arrayOfCountries.filter {$0.contains("A")})


/*:
---
#### Задание 8:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:

let pointlessString = "джлоцукячстьбтимсищгйцуша"

var capitalizedPointLessString = pointlessString.uppercased()
let lowercasedLat = capitalizedPointLessString.applyingTransform(.toLatin, reverse: false)

for (index, char) in lowercasedLat!.enumerated() {
    print("Индекс: \(index), буква: \(char)")
}
/*:
---
#### Задание 9:
 - Создай строку — набор букв кириллицей. Буквы абсолютно любые, но строчные.
 - Замени их, создав отдельную переменную, на заглавные. А потом на строчные латинские.
 - Посчитай индекс,  под которым находится каждая отдельно взятая буква.
 - Выведи его консоль.
*/
// Добавь код сюда:

//: [Назад: Playground](@previous)  |  Страница 3  |  [Вперед: Коллекции. Массивы и множества](@next)
