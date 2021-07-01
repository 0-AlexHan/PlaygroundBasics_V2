import Foundation

/*:
# Управление потоком

В этом разределе ты узнаешь:
- что такое управление потоком
- для чего нужны циклы

  `while` _condition_ {\
    _statements_\
   }

  `repeat` {\
    _statements_\
    } _while_ condition


  `for` _value_ `in` _range_ {\
    _statements_\
    }

- что такое условные инструкции
- какие бывают операторы передачи управления
- как проверить доступность API

 Внимательно изучи:
- [Управление потоком](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
- [Цикл For in](https://www.avanderlee.com/swift/loops-swift/)
- [Циклы for, while, repeat](https://www.avanderlee.com/swift/loops-swift/)
- [For each](https://developer.apple.com/documentation/swift/array/1689783-foreach)
- [Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html)
- [Conditional Statements](https://learnappmaking.com/swift-conditionals-if-statement-how-to/)
- [Доступность API](https://www.hackingwithswift.com/example-code/language/how-to-use-available-to-check-for-api-availability)

Закрепи пройденный материал:

#### Задание 1
 - Обьяви переменную `n` и проинициализируй ее  любым целочисленными значением.
*/
// Добавь код сюда:
var n: Int = 13
/*:
 - Напиши код, который выведет в консоль фразу _I like Swift!_ `n` раз.
 
 - Note: 👆 _Для решения используй циклы_ `for` _или_ `while`
*/
/*:
 
 - Example: 😉
_Input:_\
var n = 3\
_Output:_\
 I like Swift!\
 I like Swift!\
 I like Swift!
 */

// Добавь код сюда:

for _ in 0..<n {
    
    print("I like Swift!")
    
}

/*:
---
#### Задание 2
 
 - Выведи в консоль первые `n` квадратов чисел (_квадрат - произведение числа на себя, например 4 = 2 * 2_).
 
 - Example: 😉
_Input:_\
n = 5\
 _Output_:\
 1\
 4\
 9\
 16\
 25
*/
// Добавь код сюда:

for everyNum in 1...n {
    print(everyNum * everyNum)
}
/*:
 - Выведи в консоль степени числа `2`, которые меньше или равны `n`.
 
 - Example: 😉
 _Input:_\
n = 100\
 _Output:_\
 2\
 4\
 8\
 16\
 32\
 64
 */
 // Добавь код сюда:
let two = 2
var square = 1

repeat {
    
    print(Int(pow(Double(two), Double(square))))
    square += 1
    
} while Int(pow(Double(two), Double(square))) < n
/*:
 - Нарисуй в консоли квадрат из `n` на `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐\
 ⭐⭐⭐⭐
 
 */
// Добавь код сюда:

for _ in 0..<n {
    var star = ""
    for _ in 0..<n {
        star += "⭐"
    }
    print(star)
}

/*:
 - Нарисуй в консоли треугольник из `n` звездочек (⭐)
 - Example: 😉
 _Input:_\
n = 4\
 _Output:_\
 ⭐\
 ⭐⭐\
 ⭐⭐⭐\
 ⭐⭐⭐⭐
 */
// Добавь код сюда:


var star = ""
var count = 0
while count < n {
    star += "⭐"
    print(star)
    count += 1
}

/*:
---
#### Задание 3:
 - Создай массив из 20-30 значений любого типа.
 - Сделай линейную сортировку (linear sort).
 - Сделайте сортировку пузырьком (bubble sort).
 - Сделайте быструю сортировку  (quick sort).
*/
// Добавь код сюда:

func fillArrayWith(Size size: Int) -> [Int] {
    guard size > 0 else {
        return [Int]()
    }
    
    return Array(0..<size).shuffled()
}


let randomSizeForArray = Int.random(in: 20...30)

let arrayWithRandoms: [Int] = fillArrayWith(Size: randomSizeForArray)
print("Количество элементов в массиве: \(arrayWithRandoms.count)")


//MARK: Linear Sort

func linearSort(array: [Int]) -> [Int] {
    var sorted = array
    for min in 0..<sorted.count - 1 {
        for index in min..<sorted.count {
            if sorted[index] < sorted[min] {
                let temp = sorted[min]
                sorted[min] = sorted[index]
                sorted[index] = temp
      }
    }
  }
    return sorted
}

let linearSorted = linearSort(array: arrayWithRandoms)
print(linearSorted)


//MARK: Bubble Sort


func bubbleSort(array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    var sortedArray = array
    
    for i in 0..<sortedArray.count {
        for j in 0..<sortedArray.count-i-1 {
            if sortedArray[j]>sortedArray[j + 1] {
                sortedArray.swapAt(j + 1, j)
            }
        }
    }

    return sortedArray
}

let bubbleSorted = bubbleSort(array: arrayWithRandoms)
print(bubbleSorted)


//MARK: Quick Sort


func quicksort(array: [Int]) -> [Int] {
  guard array.count > 1 else {
    return array
  }

  let pivot = array[array.count / 2]
  let less = array.filter { $0 < pivot }
  let equal = array.filter { $0 == pivot }
  let greater = array.filter { $0 > pivot }

    return quicksort(array: less) + equal + quicksort(array: greater)
}


let quickSorted = quicksort(array: arrayWithRandoms)
print(quickSorted)





/*:
---
### Продвинутый уровень:

#### Задание 4:
 - Создай 10 строковых переменных с названиями стран. Объяви массив, элементами которого будут строки.
 - Проверь строки: если в строке более 5 символов — добавь её в массив. Но если строка содержит букву А - замени эту букву на другую и добавь изменённую строку в массив.
 - Выведи в консоль полученный массив.
*/
// Добавь код сюда:


/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым словом.
 - Выведи в консоль True, если строка является изограммой и false, если нет
*/
/*:
- Note: 👆 _Изограмма - это слово или фраза, в которой нет повторяющихся букв_\
*/
/*:
- Example: 😉\
_Input:_\
let word ="Password"\
_Output:_\
false
*/
/*:
- Example: 😉\
_Input:_\
let word ="Algorism"\
_Output:_\
 True
*/
// Добавь код сюда:

/*:
---
#### Задание 5:
 - Создай строковую константу word и проинициализируй ее любым значением.
 - Повтори в новой строке каждую букву исходной по 3 раза.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let word ="Hello"\
_Output:_\
 "hhheeellllllooo"
*/
// Добавь код сюда:


/*:
---
#### Задание 6:
 - Обьяви массив, состояющий из строк и целых чисел.
 - Удали из массива все строки.
 - Полученный результат выведи в консоль.
 */
/*:
- Example: 😉\
_Input:_\
let array =[1, 2, "a", "b"] \
_Output:_\
 [1, 2]
*/
// Добавь код сюда:

//: [Назад: Коллекции. Массивы и множества](@previous)  |  Страница 5  |  [Вперед:  Функции](@next)
