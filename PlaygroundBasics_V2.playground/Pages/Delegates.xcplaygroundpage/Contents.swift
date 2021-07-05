import Foundation
/*:
 # Делегаты

 Делегирование - это шаблон, который позволяет классу или структуре передавать (или делегировать) некоторую ответственность экземпляру другого типа. Этот шаблон реализуется определением протокола, который инкапсулирует делегируемые полномочия, таким образом, что соответствующий протоколу тип (делегат) гарантировано получит функциональность, которая была ему делегирована. Делегирование может быть использовано для ответа на конкретное действие или для получения данных из внешнего источника без необходимости знания типа источника.
 */
/*:
 Более подробно ты можешь прочитать [тут.](https://docs.google.com/document/d/1ZRHiPgmIqsOQIihG8Ad0WPgyajWR2zKux-EKt0pYQwQ/edit?usp=sharing)
 */

/*:
 ---
 ## Задание 1
 
 Ты завел будильник и после того как он зазвонит, тебе надо его выключить. Напиши программный код. Схематически это выглядит так:\
  ![Delegate.Task1](Playground.Delegate.Task1.png)
 */

// Добавь код сюда:


protocol AlarmDelegate {
    func clockDidAlarm()
}

class Me : AlarmDelegate {
    private let alarmClock = AlarmClock()
    
    func turnOnAlarm() {
        alarmClock.delegate = self
        print("Ложимся спать. Включаем будильник")
        alarmClock.turnOn()
    }
    
    func clockDidAlarm() {
        print("Будильник звонит. Проснулись.")
        self.turnOffAlarm()
    }
    
private func turnOffAlarm() {
        print("Выключаем будильник")
        alarmClock.turnOff()
    }
}

class AlarmClock {
    
    var delegate: AlarmDelegate?
    
    func turnOn() {
        print("Будильник включен")
        delegate?.clockDidAlarm()
    }
    
    func turnOff() {
        print("Будильник выключен")
    }
}

let me = Me()
me.turnOnAlarm()


/*:
---
## Задание 2

Ты решил сделать ремонт у себя в комнате и  нанял строителя. После того как строитель выполнит подготовительные работы, он должен позвонить тебе с определенным вопросом. Получив от тебя ответ на вопрос, строитель продолжит свою работу. Через некоторое время он позвонит тебе еще раз и сообщит, что закончил ремонт. Опиши эту ситуацию программно. Схематически это выглядит так:\
![Delegate.Task2](Playground.Delegate.Task2.png)
*/
// Добавь код сюда:
import UIKit

protocol WorkerDelegate {
    func chooseColor()
    func didFinishWork()
}

class MeAgain : WorkerDelegate {
    let worker = Worker()
    let color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    func hireWorker() {
        worker.delegate = self
        
        print("Нанимаем строителя")
        
        
        worker.preparingToWork()
    }
    
    func chooseColor() {
        print("Строитель звонил узнать цвет. Выбираем цвет \(color)")
        worker.continueWork()
    }
    
    func didFinishWork() {
        print("Строитель звонил, сказал что закончил работу")
    }
}

class Worker {
    var delegate: WorkerDelegate?
    
    func preparingToWork() {
        print("Строитель делает подготовительные работы")
        
        self.timeToPaintWalls()
    }
    
    func timeToPaintWalls() {
        print("Пришло время красить стены")
        delegate?.chooseColor()
    }
    
    func continueWork() {
        print("Строитель продолжает работу")
        
        self.workIsDone()
    }
    
    func workIsDone() {
        print("Работа закончена")
        delegate?.didFinishWork()
    }
    
}

let meAgain = MeAgain()
meAgain.hireWorker()

//: [Назад: Протоколы](@previous)  |  Страница 12]  [Вперед:  Универсальные шаблоны](@next)
