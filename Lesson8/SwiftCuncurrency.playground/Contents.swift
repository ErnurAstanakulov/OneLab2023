import UIKit
actor Counter {
    private var value = 0
    
    func increment() {
        value += 1
    }
    
    func getValue() -> Int {
        return value
    }
}

func incrementCounter(_ counter: Counter) async {
    await counter.increment()
}

func printCounterValue(_ counter: Counter) async {
    await print("Counter value: \(counter.getValue())")
}

func runExample() {
    Task {
        let counter = Counter()
        
        await withTaskGroup(of: Void.self) { group in
            for _ in 1...10 {
                group.addTask {
                    await incrementCounter(counter)
                }
            }
        }
        
        await printCounterValue(counter)
    }
}
    

// запустим пример
runExample()

// 1) -> 2) -> 3) -> 4)

// {
//  }
//
func perform() {
    //await 1)
    // awiat 2)
    // await 3)
}
