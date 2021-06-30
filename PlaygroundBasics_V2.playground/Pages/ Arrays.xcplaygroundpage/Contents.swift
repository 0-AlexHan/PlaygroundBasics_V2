import Foundation
/*:
# Коллекции. Массивы и множества

В этом разделе ты узнаешь:
- какие бывают коллекции
- что такое массвы и множества, чем они отличаются
- что такое изменчивость коллекций
- какие существуют способы создания массивов и множеств
- как получить доступ к элементам
- что такое равенство множеств

Внимательно изучи:
- [Типы коллекций](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)

Закрепи пройденный материал:

#### Задание 1
 
- Обьяви переменную _listOfNumbers_, представляющую собой массив, который соостоит из целых чисел. Проицинициализируй его любыми значениями.
*/
// Добавь код сюда:

var listOfNumbers: [Int] = [1, 7, 2, 4, 8, 9]
/*:
 - Выведи в консоль максимальное значение из этого массива.
 - Example: 😉\
 _Input:_\
 var listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Max: 106
*/
// Добавь код сюда:

func getSafeMaxValueFrom(Array array: [Int]) -> String {
    guard let maxValue = array.max() else {
        return "Something went wrong"
    }
    
    return "Max value is \(maxValue)"
}

print(getSafeMaxValueFrom(Array: listOfNumbers))
/*:
 - Выведи в консоль все нечетные числа из этого массива.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Odd numbers: 3, 7
 */
// Добавь код сюда:
print("Все нечетные числа: \(listOfNumbers.filter {$0 & 1 != 0})")
/*:
 - Выведи в консоль сумму всех элементов массива.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Sum: 224
 */
// Добавь код сюда:

print("Сумма всех чисел в массиве: \(listOfNumbers.reduce(0) {$0 + $1})")
/*:
 - Выведи в консоль все числа из этого массива, которые расположены по нечетным индексам.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Numbers with odd indexes: 6, 3, 7
 */
// Добавь код сюда:

let oddIndices = stride(from: 1, to: listOfNumbers.count, by: 2).map {listOfNumbers[$0]}
print(oddIndices)
/*:
 - Выведи в консоль числа из этого массива в обратном порядке.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Going back: 7, 106, 3, 100, 6, 2
 */
// Добавь код сюда:

let reversedArray = Array(listOfNumbers.reversed())

print(reversedArray)
/*:
 - Получи новый массив, путем сортировки массива по возрастанию.
 - Выведи его в консоль.
 
 - Note: 👆 _Для сортировки используй метод sorted(by:)_
 */
/*:
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 _Output:_\
 Sorted array: [2, 3, 6, 7, 100, 106]
 */
// Добавь код сюда:

let sortedArray = listOfNumbers.sorted(by: <)

print("Массив по убыванию: \(sortedArray)")
/*:
 - Обьяви целочисленную переменную _x_ и присвой ей любое значение.
  */
// Добавь код сюда:

var x: Int = 8
/*:
 - Проверь наличие _x_ в массиве _listOfNumbers_. Если есть, выведи в консоль _true_, если нет - _false_.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 x = 3\
 _Output:_\
 true
 */
// Добавь код сюда:
print("Х равен \(x), содержит ли массив переменную Х: \(listOfNumbers.contains(x))")
/*:
---
#### Задание 2
 - Обьяви переменную _otherNumbers_, представляющую собой массив, который соостоит из целых чисел. Проицинициализируй его любыми значениями.

 */
// Добавь код сюда:

var otherNumbers: [Int] = [13, 11, 3, 7, 5, 1]
/*:
 - Выведи в консоль все элементы из массива _listOfNumbers_, которые есть в массиве _otherNumbers_.
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 otherNumbers = [2 ,6, 12]\
 _Output:_\
 Intersection: [2, 6]
  */
/*:
 - Example: 😉\
 _Input:_\
 listOfNumbers = [2 ,6 , 100, 3, 106, 7]\
 otherNumbers = [44 , 4, 12]\
 _Output:_\
 Intersection: No data
 
 */
// Добавь код сюда:

let sameElements = listOfNumbers.filter() {otherNumbers.contains($0)}
print("Общие элементы: \(sameElements)")
/*:
---
### Продвинутый уровень:

#### Задание 3:
 - Создай 10 строковых переменных с названиями стран. Объяви массив, элементами которого будут строки.
 - Проверь строки: если в строке более 5 символов — добавь её в массив. Но если строка содержит букву А - замени эту букву на другую и добавь изменённую строку в массив.
 - Выведи в консоль полученный массив.
*/
// Добавь код сюда:


/*:
---
#### Задание 4:
 - Создай два массива a и b, элементами которых будут целые положительные числа.
 - Создай два множества aSet и bSet, на основаниии этих элементов.
 - Выведи в консоль true, если  множетсво aSet является подмножеством bSet, false - в противном случае.
*/
/*:
- Example: 😉\
_Input:_\
subset =([1, 3], [1, 3, 3, 5])\
_Output:_\
True
*/
/*:
- Example: 😉\
_Input:_\
subset([1, 3, 10], [10, 8, 8, 8]))\
_Output:_\
False
*/

// Добавь код сюда:

//: [Назад: Простые типы данных](@previous)  |  Страница 4  |  [Вперед: Управление потоком](@next)


