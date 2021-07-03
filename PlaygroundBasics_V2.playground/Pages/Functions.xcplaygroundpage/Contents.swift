import Foundation
/*:
# Функции

В этом разделе ты узнаешь:
- что такое функции
- как их обьявлять и вызывать
- что такое параметры функции и возвращаемые значения
- что такое ярылки аргументов

Внимательно изучи:
- [Функции](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#)

Закрепи пройденный материал:

#### Задание 1
 
 - Реализуй функцию _calculateMin_, которая принимает в качестве параметров  два значения типа `Int` и возвращает наименьшее из них.
 - Example: 😉\
 _Function Call:_\
 calculateMin(1,2)\
 _Output:_\
 Min: 1
 */
// Добавь код сюда:

func calculateMin(firstNum: Int, secondNum: Int) -> Int {
    return firstNum < secondNum ? firstNum : secondNum
}

calculateMin(firstNum: 31, secondNum: 3)



/*:
---
#### Задание 2
 
 - Реализуй функцию _countDown_, которая принимает параметр `n` типа `Int`.
 - Функция должна вывести в консоль  числа от _n_ до 1 с интервалом в 1 секунду, а затем вывести в консоль слово _GO!_
 - Note: 👆 _Для задержки используй стандартную функцию sleep(1)_
 */
/*:
 - Example: 😉\
 _Function Call:_\
 coutdown(3)\
 _Output:_\
 3\
 2\
 1\
 GO!
 */

// Добавь код сюда:

func countDown(n: Int) {

        let delayInSeconds: Double = 1
        var count = 0

        Timer.scheduledTimer(withTimeInterval: delayInSeconds, repeats: true) { (timer) in
            if count == 3 {
                print("GO")
                timer.invalidate()

                return
            }
            print(n - count)
            count += 1
        }
}

countDown(n: 3)


/*:
---
#### Задание 3
 - Реализуй функцию _repeatPrint_, которая принимает в качестве параметров строку _s_ и целое число _n_. Функция должна напечатать строку, переданную в качестве параметра, _n_ раз.
 - Example: 😉\
 _Function Call:_\
 repeatPrint(s: "Hi, NIX", n:2)\
 _Output:_\
 Hi, NIX\
 Hi, NIX
 */
// Добавь код сюда:

func repeatPrint(s: String, n: Int) {
    for each in 0..<n {
        print(s + " \(each + 1)й раз")
    }
}
let stringToPrint = "Какая то строка напечатанная"
repeatPrint(s: stringToPrint, n: 4)
/*:
---
#### Задание 4
 - Реализуй функцию _reverse_, которая в качестве параметра принимает массив с целыми числами. Результатом работы функции должен быть массив с числами в обратном порядке.
 - Полученный массив выведи в консоль.
 - Example: 😉\
 _Function Call:_\
 reverse([1, 2, 3])\
 _Output:_\
 [3, 2, 1]
 */
// Добавь код сюда:

func reverse(Array array: [Int]) -> [Int] {
    var reversedArray = [Int]()
    let last = array.count - 1
    
    for index in 0..<array.count {
        reversedArray.append(array[last - index])
    }
        
    return reversedArray
}

let reversedArray = reverse(Array: [1,2,3,4,5])
print(reversedArray)
/*:
---
#### Задание 5
 - Реализуй функцию _factorial_, которая принимает  качестве параметра целое число _n_ и возвращает его факториал.
 - Полученный результат выведи в консоль.
 - Note: 👆 _Факториал натурального числа n - это произведение всех натуральных чисел от 1 до n включительно\
 1! = 1\
 2! = 1 * 2 = 2\
 3! = 1 * 2 * 3 = 6\
 ...\
 7! = 1 * 2 ... * 7 = 5040_
 */
/*:
 
 - Note: 👆 _Для реализации факториала используй рекурсию_
*/
/*:
 - Example: 😉\
 _Function Call:_\
 factorial(5)\
 _Output:_\
 5! = 120
 */
// Добавь код сюда:

func factorial(n: Int) -> Int {
    guard n < 20 else {
        print("Слишком большое число")
        return 0
    }

    if n == 0 {
        return 1
    } else {
        return n * factorial(n: n - 1)
    }
}

print("Факториал \(factorial(n: 5))")


/*:
---
#### Задание 6
 - Напиши функцию, которая на вход принимает масссив, элементами которого являются целые, положительные числа.
 - Результатом работы функции будет массив, состоящий только  из элементов исходного массива, для которых равна количеству символов, переданных в качестве параметра.
 - Результат выведи в консоль
*/
/*:
 - Example: 😉\
 _Function Call:_\
 filterDigitLength([88, 232, 4, 9721, 555], 3)\
 _Output:_\
[232, 555]
 */
/*:
 - Example: 😉\
 _Function Call:_\
 filterDigitLength([32, 88, 74, 91, 300, 4050], 1)\
 _Output:_\
[]
 */
// Добавь код сюда:
func filterDigitLength(array: [Int], digitLength: Int) -> [Int] {
    var result = [Int]()
   
    for each in array {
        
        if Int(floor(log10(Double(each)))) + 1 == digitLength {
            result.append(each)
        }
    }
    return result
}

let filteredByLengthOfDigits = filterDigitLength(array: [12,333,42,1,6666,3], digitLength: 4)
print(filteredByLengthOfDigits)

/*:
---
#### Задание 7
 - Напиши функцию, которая на вход принимает массив строк, представляющий собой названия файлов, а результатом работы функции будет массив, представляющий собой список типов файлов из исходного массива.
 - Результат выведи в консоль
*/
/*:
 - Example: 😉\
 _Function Call:_\
 getExtension(["code.html", "code.css"])\
 _Output:_\
["html", "css"]
*/
/*:
 - Example: 😉\
 _Function Call:_\
 getExtension(["project1.jpg", "project1.pdf", "project1.mp3", "project2.pdf"])\
 _Output:_\
["jpg", "pdf", "mp3"]
 */
// Добавь код сюда:

func getExtension(fileNames: [String]) -> [String] {
    var fileExtensions = [String]()
    
    for each in fileNames {
        fileExtensions.append((each.components(separatedBy: ".")[1]))
    }
    
    return fileExtensions
}

let fileExtensions = getExtension(fileNames: ["asdasdc.css", "krakosxf.jpeg"])
print(fileExtensions)

/*:
---
### Продвинутый уровень:
#### Задание 8:
 - Напиши функцию, которая в качестве параметра принимает массив целых положительных чисел, а возвращает сумму пропущенных чисел в переданном диапазоне.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Минимальное и максимальное значение массива - это границы числового диапазона, которые нужно использовать при поиске отсутсвующих чисел_
*/
/*:
- Example: 😉\
_Function Call:_\
sumOfMissingNumbers([1, 3, 5, 7, 10])\
_Output:_\
Sum of missing numbers = 29
*/

// Добавь код сюда:


let numbers = [1, 3, 5, 7, 10]

func getSumOfMissingNums(array: [Int]) -> Int {
    guard let min = array.min() else {
        return 0
    }
    guard let max = array.max() else {
        return 0
    }
    
    let numbers = Set(array)
    var setFromRange = Set(min ... max)
    
    setFromRange.subtract(numbers)
    
    return setFromRange.reduce(0, +)
}

print( getSumOfMissingNums(array: numbers) )

/*:
---
#### Задание 9:
 - Напиши функцию, которая в качестве параметра строку, а результатом работы функции будет новкя строка, представляющая собой увеличение каждого симолова на  +1.
 - Каждый набор символов отдели каким-то знаком.
 - Каждый набор символов должен начинаться с большой буквы.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Используй только буквы латинского алфавита (a-z, A-Z)_
*/
/*:
- Example: 😉\
_Function Call:_\
compoutingLetters("abcd")\
_Output:_\
"A-Bb-Cccc=Dddd"
*/
// Добавь код сюда:

func letters(string: String) -> String {
    var resultString = String()
    let separators: [String] = ["-", "+", "=", "%", "!", "&", "?"]
    
    for (amount, char) in string.enumerated() {
        let separator = separators[Int.random(in: 0 ... separators.count - 1)]
        
        for _ in 0 ... amount {
            resultString += String(char)
        }
        
        if amount != string.count - 1 {
            resultString += separator
        }
    }
    
    return resultString.capitalized
}

print(letters(string: "abcdef"))



/*:
---
#### Задание 10:
 - Напиши функцию, которая в качестве параметра принимает строку, а результатом работы функции будет  строка, каждое слово которой начинается с заглавной буквы.
 - Выведи в консоль результат работы функции.
*/
/*:
- Note: 👆 _Используй функции высшего порядка_
*/
/*:
- Example: 😉\
_Function Call:_\
makeTitile("This is a title")\
_Output:_\
This Is A Title
*/

// Добавь код сюда:



func makeTitle(_ title: String) -> String {
    let resultString = title.split(separator: " ").map { (string) -> String in
        return string.capitalized
    }.joined(separator: " ")
    
    return resultString
}

let title = "This is a title"

print(makeTitle(title))



/*:
---
#### Задание 11:
 - Напиши функцию, которая в качестве параметра принимает массив символов и символ для поиска.
 - Функция должна возвращать сколько раз символ встречается в массиве
 - Выведи в консоль результат работы функции.
*/
/*:
- Example: 😉\
_Function Call:_\
letterCount(["D", "E", "Y", "H", "A", "D"])\
_Output:_\
D shows 2 times
*/

// Добавь код сюда:

func countLetter(_ letter: Character, in array: [Character]) -> Int {
    
    return array.filter {$0 == letter}.count
}

let letters: [Character] = ["D","E", "Y", "H", "A", "D", "H", "Z", "X", "B"]
let letter: Character = "H"

let times = countLetter(letter, in: letters)

print("\(letter) shows \(times) times")


/*:
---
## Задание 12:
 - Напиши функция, которая будет возвращать true, если все подмножества в массиве, принадоежат множеству, переданному в качестве параметров, а false  - в противном случае.
 - Выведи в консоль результат работы функции.
*/
/*:
- Example: 😉\
_Function Call:_\
validateSubsets([[1, 2], [2, 3], [1, 3]], [1, 2, 3])\
_Output:_\
True
*/
/*:
- Example: 😉\
_Function Call:_\
validateSubsets([[1, 2, 3, 4]], [1, 2, 3])\
_Output:_\
False
*/

// Добавь код сюда:

func checkIs(superset: Set<Int>, of: [Set<Int>]) -> Bool {
    for each in of {
        if !each.isSubset(of: superset) {
            return false
        }
    }
    return true
}

let givenSetOfNums: [Set<Int>] = [[1, 2], [2, 3], [1, 3], [1, 2, 3]]
let superset: Set<Int> = [1, 2, 3]

print(checkIs(superset: superset, of: givenSetOfNums))


//: [Назад: Управление потоком](@previous)  |  Страница 6  |  [Вперед: Замыкания](@next)



