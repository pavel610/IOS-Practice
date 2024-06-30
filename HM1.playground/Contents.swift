import UIKit

class Car{
    var brand: String
    var model: String
    var year: Int
    var horsepower: Int
    
    init(brand: String, model: String, year: Int, horsepower: Int) {
        self.brand = brand
        self.model = model
        self.year = year
        self.horsepower = horsepower
    }
    
    func toString() -> String{
        return "Марка: \(brand), Модель: \(model), Год: \(year), Мощность: \(horsepower)"
    }
}

class BMW: Car {
    var color: String
    init(brand: String, model: String, year: Int, horsepower: Int, color: String) {
        self.color = color
        super.init(brand: brand, model: model, year: year, horsepower: horsepower)
    }
}

class Audi: Car {
    var topSpeed: Int
    
    init(brand: String, model: String, year: Int, horsepower: Int, topSpeed: Int) {
        self.topSpeed = topSpeed
        super.init(brand: brand, model: model, year: year, horsepower: horsepower)
    }
}

class Mercedes: Car {
    var color: String
    
    init(brand: String, model: String, year: Int, horsepower: Int, color: String) {
        self.color = color
        super.init(brand: brand, model: model, year: year, horsepower: horsepower)
    }
}

class Toyota: Car {
    var mileage: Double
    
    init(brand: String, model: String, year: Int, horsepower: Int, mileage: Double) {
        self.mileage = mileage
        super.init(brand: brand, model: model, year: year, horsepower: horsepower)
    }
}

func createCars() -> [Car]{
    let car1 = BMW(brand: "BMW", model: "X5", year: 2018, horsepower: 300, color: "Red")
    let car2 = Audi(brand: "Audi", model: "A4", year: 2017, horsepower: 200, topSpeed: 250)
    let car3 = Mercedes(brand: "Mercedes", model: "E-Class", year: 2019, horsepower: 230, color: "Black")
    let car4 = Toyota(brand: "Toyota", model: "Corolla", year: 2016, horsepower: 200, mileage: 50000.0)
    return [car1, car2, car3, car4]
}

func compareCars(car1: Car, car2: Car) -> Car{
    if car1.horsepower == car2.horsepower {
        return  car1.year < car2.year ? car2 : car1
    }
    return car1.horsepower < car2.horsepower ? car2 : car1
}

func race(for cars: [Car]){
    var cars = cars
    for i in stride(from: 0, to: cars.count, by: 2){
        print("Круг \(i / 2 + 1)")
        var current: [Car] = []
        while !cars.isEmpty{
            let i1 = Int.random(in: 0..<cars.count)
            let car1 = cars[i1]
            cars.remove(at: i1)
            let i2 = Int.random(in: 0..<cars.count)
            let car2 = cars[i2]
            cars.remove(at: i2)
            print("Гонка между \(car1.toString()) и \(car2.toString())")
            print("Победитель - \(compareCars(car1: car1, car2: car2).toString())")
            current.append(compareCars(car1: car1, car2: car2))
        }
        cars = current
        current = []
    }
    print("Итоговый победитель \(cars[0].toString())")
    
}

race(for: createCars())
