import Foundation
/*:
# Универсальные шаблоны

В этом разделе ты узнаешь:
- что такое универсальные шаблоны
- что такое универсальные функции
- что такое универсальные типы
- что такое ограничение типа
- что такое связанные типы

Внимательно изучи:
- [Универсальные типы](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)

Закрепи пройденный материал:
#### Задание 1
 - Оптимизируй приведенный ниже код:
*/

func areIntEqual(x: Int, _ y: Int) -> Bool {
  return x == y
}

func areStringsEqual(x: String, _ y: String) -> Bool {
  return x == y
}

// Добавь код сюда:

func areEqual<T: Equatable>(x: T, y: T) -> Bool {
    return x == y
}


/*:
---
#### Задание 2
 - Оптимизируй приведенный ниже код:
*/
func existsManual(item:String, inArray:[String]) -> Bool {
    var index:Int = 0
    var found = false

    while (index < inArray.count && found == false)
    {
        if item == inArray[index]
        {
            found = true
        }
        else
        {
            index = index + 1
        }
    }

    if found
    {
        return true
    }
    else
    {
        return false
    }
}

/*:
func existsManual(item:String, inArray:[String]) -> Bool
...
func existsManual(item:Int, inArray:[Int]) -> Bool
...
func existsManual(item:Float, inArray:[Float]) -> Bool
...
func existsManual(item:Double, inArray:[Double]) -> Bool
...
// "Person" is a custom class we'll create
func existsManual(item:Person, inArray:[Person]) -> Bool
*/

// Добавь код сюда:

func genericExistManual<T: Equatable>(item: T, inArray: [T]) -> Bool {
    var index:Int = 0

    while (index < inArray.count)
    {
        if item == inArray[index]
        {
            return true
        }
            index = index + 1
    }
    
    return false
}



class Person : Equatable {
    let name: String
    
    init(name: String = "someName") {
        self.name = name
    }
    
    static func ==(leftSide: Person, rightSide: Person) -> Bool {
        return leftSide.name == rightSide.name
    }
}


let find = "String"
let array = ["iuowh", "byuyp", "String"]
genericExistManual(item: find, inArray: array)

let findPerson = Person(name: "Alex")
let findOtherPerson = Person(name: "Sasha")
var customTypesArray = Array(repeating: Person(), count: 3)

customTypesArray.append(findPerson)

genericExistManual(item: findPerson, inArray: customTypesArray)
genericExistManual(item: findOtherPerson, inArray: customTypesArray)


//: [Назад:  Делегаты](@previous)  |  Страница 13]  [Вперед:  Паттерны проектирования](@next)
