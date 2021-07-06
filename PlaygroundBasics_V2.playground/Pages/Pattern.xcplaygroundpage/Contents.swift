import Foundation
/*:
# Паттерны проектирования

В этом разделе ты узнаешь:
- что такое паттерны, какие проблемы они решают
- какие бывают их виды и как их реализовать на языке Swift

Паттерн проектирования — это часто встречающееся решение определённой проблемы при проектировании архитектуры программ.
В отличие от готовых функций или библиотек, паттерн нельзя просто взять и скопировать в программу. Паттерн представляет собой не какой-то конкретный код, а общую концепцию решения той или иной проблемы, которую нужно будет ещё подстроить под нужды каждой программы.

Паттерны отличаются по уровню сложности, детализации и охвата проектируемой системы.

Самые низкоуровневые и простые паттерны — идиомы. Они не универсальны, поскольку применимы только в рамках одного языка программирования. Самые универсальные — архитектурные паттерны, которые можно реализовать практически на любом языке. Они нужны для проектирования всей программы, а не отдельных её элементов.
Кроме того, паттерны отличаются и предназначением.  Можно выделить три основные группы:
- порождающие (фабричный метод, абстрактная фабрика, строитель, прототип, одиночка) - беспокоятся о гибком создании объектов без внесения в программу лишних зависимостей
- стуктурные (адаптер, мост, компоновщик, декоратор, фасад, легковес, заместитель) - показывают различные способы построения связей между объектами
- поведенческие (цепочка обязанностей, команда, итератор, посредник, снимок, наблюдатель, состояние, стратегия, шаблонный метод, посетитель) - заботятся об эффективной коммуникации между объектами.

 Внимательно изучи некоторые виды паттернов:
- [Фабричный метод](https://refactoring.guru/ru/design-patterns/factory-method)
- [Абстрактная фабрика](https://refactoring.guru/ru/design-patterns/abstract-factory)
- [Строитель](https://refactoring.guru/ru/design-patterns/builder)
- [Прототип](https://refactoring.guru/ru/design-patterns/prototype)
- [Декоратор](https://refactoring.guru/ru/design-patterns/decorator)
- [Адаптер](https://refactoring.guru/ru/design-patterns/adapter)
- [Мост](https://refactoring.guru/ru/design-patterns/bridge)
- [Цепочка обязанностей](https://refactoring.guru/ru/design-patterns/chain-of-responsibility)
- [Команда](https://refactoring.guru/ru/design-patterns/command)

Закрепи пройденный материал:
#### Задание 1
- Предположим, твой модуль отвечает за производство пиццы. Напиши код, который будет реализовывать обьект создания пиццы во время выполнения программы. Например, если пользователь хочет пиццу с сыром, то твой модуль создаст обьект CheesePizza,  а если пользователь хочет пиццу с пепперони - обьект PepperoniPizza
 - Note: 👆 _Используй фабричный метод_
*/

// Добавь код сюда:

protocol PizzZzaProducts : AnyObject {
    var pizzaName: String { get }
    
    func didStartCooking()
    
}

class CheesePizza {
    
}

extension CheesePizza : PizzZzaProducts {
    var pizzaName: String {
        return "Пицца с сыром"
    }
    
    func didStartCooking() {
        print("Начали готовить пиццу с сыром")
    }
}

class PepperoniPizza {
    
}

extension PepperoniPizza : PizzZzaProducts {
    var pizzaName: String {
        return "Пицца Пепперони"
    }
    
    func didStartCooking() {
        print("Начали готовить пиццу Пепперони")
    }
}

enum Menu {
    case pepperoni, cheesePizza
}

class PizzZzaFactory {
    static let singleFactory = PizzZzaFactory()
    
    private init() { }
    
    
    func createSomePizza(withName name: Menu) -> PizzZzaProducts {
        switch name {
            case .pepperoni:
                return PepperoniPizza()
            case .cheesePizza:
                return CheesePizza()
        }
    }
}
func customersOrder(pizza: Menu) -> PizzZzaProducts {
    return PizzZzaFactory.singleFactory.createSomePizza(withName: pizza)
}
 
let pepperoni = customersOrder(pizza: .pepperoni)
let cheesePizza = customersOrder(pizza: .cheesePizza)





/*:
---
#### Задание 2
- Предположим, твой модуль связан с продажей средств передвижения.  От типа (велосипед, автомобиль,  электоро - самокат, скутер, мотоцикл) конкретного средства зависит его отображение. Помимо этого,  все средства передвижения различаются состоянием (новое и б/y), типом потребляемого топлива (не потребляет, бензин, электричество) и максимальным количеством людей, которые могут перевести. Напиши код, который будет создавать объекты средств передвижения  с учетом его характеристик.
 - Note: 👆 _Используй абстрактую фабрику_
*/

// Добавь код сюда:

enum FuelType {
    case notConsume, gasoline, electric
}

protocol Bicycle {
    var name: String { get }
    var fuel: FuelType { get }
    var peopleCapacity: Int { get }
    
    func didInUse() -> Bool
    
}

protocol Car {
    var name: String { get }
    var fuel: FuelType { get }
    var peopleCapacity: Int { get }
    
    func didInUse() -> Bool
}

protocol ElectricScooter {
    var name: String { get }
    var fuel: FuelType { get }
    var peopleCapacity: Int { get }
    
    func didInUse() -> Bool
}

protocol Scooter {
    var name: String { get }
    var fuel: FuelType { get }
    var peopleCapacity: Int { get }
    
    func didInUse() -> Bool
}

protocol Motocycle {
    var name: String { get }
    var fuel: FuelType { get }
    var peopleCapacity: Int { get }
    
    func didInUse() -> Bool
}

protocol AbstcractFactory {
    func didCreateBicycle() -> Bicycle
    func didCreateCar() -> Car
    func didCreateElectricScooter() -> ElectricScooter
    func didCreateScooter() -> Scooter
    func didCreateMotocycle() -> Motocycle
}

class SomeBicycle {
    let used: Bool
    
    init(isUsed: Bool) {
        self.used = isUsed
    }
}

extension SomeBicycle : Bicycle {
     
    var name: String {
        return "Велосипед"
    }
    
    var fuel: FuelType {
        return .notConsume
    }
    
    var peopleCapacity: Int {
        return 1
    }
    
    func didInUse() -> Bool {
        return used
    }
}

class SomeCar {
    let used: Bool
    
    init(isUsed: Bool) {
        self.used = isUsed
    }
}

extension SomeCar : Car {

    var name: String {
        return "АВТОМОБИЛЬ"
    }

    var fuel: FuelType {
        return .gasoline
    }

    var peopleCapacity: Int {
        return 4
    }
    
    func didInUse() -> Bool {
        return used
    }
}

class SomeElectricScooter {
    let used: Bool
    
    init(isUsed: Bool) {
        self.used = isUsed
    }
}

extension SomeElectricScooter : ElectricScooter {
    var name: String {
        return "Электросамокат"
    }

    var fuel: FuelType {
        return .electric
    }

    var peopleCapacity: Int {
        return 1
    }
    
    func didInUse() -> Bool {
        return used
    }
}

class SomeScooter {
    let used: Bool
    
    init(isUsed: Bool) {
        self.used = isUsed
    }
}

extension SomeScooter : Scooter {
    
    var name: String {
        return "Скутер"
    }

    var fuel: FuelType {
        return .gasoline
    }

    var peopleCapacity: Int {
        return 2
    }
    
    func didInUse() -> Bool {
        return used
    }
}

class SomeMotocycle {
    let used: Bool
    
    init(isUsed: Bool) {
        self.used = isUsed
    }
}

extension SomeMotocycle : Motocycle {
    var name: String {
        return "Мотоссыкл"
    }

    var fuel: FuelType {
        return .gasoline
    }

    var peopleCapacity: Int {
         return 2
    }
    
    func didInUse() -> Bool {
        return used
    }
}

class UsedVehiclesFactory : AbstcractFactory {
    
    static let singleFactory = UsedVehiclesFactory()
    
    private init() { }
    
    func didCreateBicycle() -> Bicycle {
        return SomeBicycle(isUsed: true)
    }

    func didCreateCar() -> Car {
        return SomeCar(isUsed: true)
    }

    func didCreateElectricScooter() -> ElectricScooter {
        return SomeElectricScooter(isUsed: true)
    }

    func didCreateScooter() -> Scooter {
        return SomeScooter(isUsed: true)
    }

    func didCreateMotocycle() -> Motocycle {
        return SomeMotocycle(isUsed: true)
    }
    
    
}

class NewVehiclesFactory {
    static let singleFactory = NewVehiclesFactory()
    
    private init() { }
    
    func didCreateBicycle() -> Bicycle {
        return SomeBicycle(isUsed: false)
    }

    func didCreateCar() -> Car {
        return SomeCar(isUsed: false)
    }

    func didCreateElectricScooter() -> ElectricScooter {
        return SomeElectricScooter(isUsed: false)
    }

    func didCreateScooter() -> Scooter {
        return SomeScooter(isUsed: false)
    }

    func didCreateMotocycle() -> Motocycle {
        return SomeMotocycle(isUsed: false)
    }
}

let someNewVehicle = NewVehiclesFactory.singleFactory.didCreateBicycle()
if someNewVehicle.didInUse() { print("Новый") } else { print("Потасканный") }
print(someNewVehicle.name)
print(someNewVehicle.fuel)
print(someNewVehicle.peopleCapacity, "чел.")

let someUsedVehicle = UsedVehiclesFactory.singleFactory.didCreateCar()

if someUsedVehicle.didInUse() { print("Новый") } else { print("Потасканный") }
print(someUsedVehicle.name)
print(someUsedVehicle.fuel)
print(someUsedVehicle.peopleCapacity, "чел.")


/*:
---
#### Задание 3
- Предположим, твой модуль связан с созданием автомобиля. Автомобиль - это очень сложный обьект, так как машины  могут отличаться типом двигателя, количеством сидений, могут иметь или не иметь GPS и системы навигаций, кроме того автомобили могут быть городскими, спортивными и внедорожниками. Реализуй систему, которая будет  поэтапно конструировать  автомобиль (устанавливать  сидения,  двигатель, красить кузов  и так далее).
 - Note: 👆 _Используй паттерн строитель_
*/

// Добавь код сюда:


/*:
---
#### Задание 4
- Предположим, твой модуль связан с  работой кофейни. При добавлении нового инредиента к кофе, например, взбитые сливки, необходимо рассчитать новую стоимость продукта и получить новое описание состава напитка. Представь это в виде кода.
 - Note: 👆 _Используй паттерн декоратор_
*/

// Добавь код сюда:

/*:
---
#### Задание 5
- Предположим, у тебя есть некий сервис, который выводит в консоль текущую дату, но, например, на арабском  языке, который не понимает твой клиент. Сделай так, чтобы твой клиент мог использовать сервис вывода даты в консоль на понятном ему языке.
 - Note: 👆 _Используй паттерн адаптер_
*/

// Добавь код сюда:

/*:
---
#### Задание 6
- Предположим, твой модуль представляет собой некий конвеер, который обрабатывает  различные предметы, которые на него попадают. На данный момент есть возможность переработать следующие типы предметов: пищевые отходы, электронику, бумагу и стекло. Для каждого типа предмета в системе должен быть предусмотрен свой обработчик, который принимает на вход предмет, сканирует его и определяет возможность переработки. Если этот предмет того типа, который он "умеет" обрабатывать, то он выполняет обработку, если нет, то передает следующему обработчику. Если же никто из обработчиков не смог переработать предмет, то предмет должен в конечном итоге попасть "в руки"  обьекту "Склад", который дальше уже не передает предмет, а ставит на нем специальный маркер.
 - Note: 👆 _Используй паттерн цепочка обязанностей_
*/

// Добавь код сюда:

class Responder {
    private var trash: String
    private var nextResponder: Responder?
    
    init(trash: String) {
        self.trash = trash
    }
    
    func setNext(responder next: Responder) {
        self.nextResponder = next
    }
    
    func checking(trash type: String) {
        if trash == type {
            print("\(type) trash were recycled")
        } else if let next = nextResponder {
            print("Can't handle \(type). Transfering to the next responder ")
             next.checking(trash: type)
        } else {
            print("Adding to warehouse")
            Warehouse.warehouseInstance.addToWarehouse(trash: type)
        }
    }
}

class TrashRecycle {
    private var foodWaste: Responder
    private var electronic: Responder
    private var papper: Responder
    private var glass: Responder
    
    init(foodWaste: Responder, electronic: Responder,
         papper: Responder, glass: Responder) {
        
        self.foodWaste = foodWaste
        self.electronic = electronic
        self.papper = papper
        self.glass = glass
    }
    
    func recycle(trash: String) {
        
        foodWaste.checking(trash: trash)
    }
    
}

class Warehouse {
    private var garbageCollection = [String]()
    
    static let warehouseInstance = Warehouse()
    
    private init(){}
    
    func addToWarehouse(trash type: String) -> String {
        
        garbageCollection.append(type)
        return "Added to warehouse"
    }
    
    func getGarbage() {
        print(garbageCollection)
    }
}
let foodWasteResponder = Responder(trash: "Food")
let electronicResponder = Responder(trash: "Electronics")
let papperResponder = Responder(trash: "Papper")
let glassResponder = Responder(trash: "Glass")

foodWasteResponder.setNext(responder: electronicResponder)
electronicResponder.setNext(responder: papperResponder)
papperResponder.setNext(responder: glassResponder)

let trashRecycle = TrashRecycle(foodWaste: foodWasteResponder, electronic: electronicResponder, papper: papperResponder, glass: glassResponder)

trashRecycle.recycle(trash: "Glass")
trashRecycle.recycle(trash: "Papper")
trashRecycle.recycle(trash: "Plastic")

Warehouse.warehouseInstance.getGarbage()


/*:
---
#### Задание 7
 - Предположим, твой модуль представляет системное меню. Разработай систему, которая обрабатывает нажатия на пункты меню с учетом версии ПО.
 - Note: 👆 _Используй паттерн команда_
*/

// Добавь код сюда:

//: [Назад:  Универсальные шаблоны](@previous)  |  Страница 14] 



