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
    let car5 = Toyota(brand: "Toyota", model: "Corolla", year: 2016, horsepower: 230, mileage: 50000.0)
    let car6 = Toyota(brand: "Toyota", model: "Corolla", year: 2016, horsepower: 240, mileage: 50000.0)
    return [car1, car2, car3, car4, car5, car6]
}

func compareCars(cars: [Car]) -> Car{
    var winner: Car = cars[0]
    for i in 1..<cars.count{
        if winner.horsepower < cars[i].horsepower{
            winner = cars[i]
        }else if winner.horsepower == cars[i].horsepower{
            winner = winner.year < cars[i].year ? cars[i] : winner
        }
    }
    return winner
}

func race(for cars: [Car]){
    var cars = cars
    var current: [Car] = []
    while !cars.isEmpty{
        let i1 = Int.random(in: 0..<cars.count)
        let car1 = cars[i1]
        cars.remove(at: i1)
        let i2 = Int.random(in: 0..<cars.count)
        let car2 = cars[i2]
        cars.remove(at: i2)
        let winner = compareCars(cars: [car1, car2])
        print("Гонка между \(car1.toString()) и \(car2.toString())")
        print("Победитель - \(winner.toString())")
        current.append(winner)
    }
    cars = current
    current = []
    
    print("Итоговый победитель - \(compareCars(cars: cars).toString())")
    
}

race(for: createCars())
