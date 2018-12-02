import UIKit

struct Person {
    let name: String
    let address: String
    let age: Int
    let income: Double
    let cars: [String]
}

let peopleArray = [ Person(name:"Santosh", address: "Pune, India", age:34, income: 100000.0, cars:["i20","Swift VXI"]),
                    Person(name: "John", address:"New York, US", age: 23, income: 150000.0, cars:["Crita", "Swift VXI"]),
                    Person(name:"Amit", address:"Nagpure, India", age:17, income: 200000.0, cars:Array())]


// Approach 1
let names = peopleArray.map({ (person) -> String in
    return person.name
})
print(names)

let names1 = peopleArray.map({ $0.name })
print(names1)

let cars = peopleArray.map({ $0.cars })
print(cars)

// flatMap
let flatCars = peopleArray.flatMap({ $0.cars })
print("Flatmap: \(flatCars)")

let aPersonArray = peopleArray.flatMap { $0.cars }.flatMap { $0 }
print("Other: \(aPersonArray)")

let filteredNames = peopleArray.filter( {$0.age > 18 }).map({ return $0.name })
print(filteredNames)

//Approach 1
let totalIncome = peopleArray.reduce(0) {(result, next) -> Double in
    return result + next.income
}

print("Total Income: \(totalIncome) Average Income: \(totalIncome/Double(peopleArray.count))")

// Example 2:
let numbers = [23.23478, -2.32784, 34.328, 33.28347]
let sum = numbers.reduce(0) { (result, next) -> Double in
    return result + next
}
print("Sum: \(sum)")

// More concise code
let conciseSum = numbers.reduce(0, +)
print("conciseSum: \(conciseSum)")

//Diccionario vacio

let emptyDic:[Int:String] = [:]
print(emptyDic)

let emptyDic2:Dictionary<Int, String> = [:]
print(emptyDic)

let someDic = ["a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8, "i":9]
print(someDic)

let customKeys = ["Facebook", "Google", "Amazon"]
let customValues = ["Mark", "Larry", "Jeff"]
let newDictionary = Dictionary(uniqueKeysWithValues: zip(customKeys,customValues))
print(newDictionary)

//Accesando a valores
print(someDic["a"] ?? 0)
print(someDic["h"] ?? 0)

//For para un dictionary
for (key,value) in someDic {
    print("key:\(key) value:\(value)")
}

//Agregado elemento de un diccionario
var someDictionary = ["Nepal":"Kathmandu", "China":"Beijing", "India":"NewDelhi"]
someDictionary["Japan"] = "Tokyo"
print(someDictionary)

//Cambiando un valor de un diccionario
someDictionary["Nepal"] = "KATHMANDU"
print(someDictionary)

//function
print(someDictionary.isEmpty)
print(someDictionary.first!)
print(someDictionary.count)

//Devuelve las llaves
let dictKeys  = Array(someDictionary.keys)
print(dictKeys)

//Devuelve las llaves
let dictValues  = Array(someDictionary.values)
print(dictValues)

//Remover elemento
let val  = someDictionary.removeValue(forKey: "Nepal")
print(val!)
print(someDictionary)

let val1  = someDictionary["nepal", default:"Not Found"]
print(val1)


