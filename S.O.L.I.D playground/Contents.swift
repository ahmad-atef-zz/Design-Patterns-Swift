// Single-responsibility Principle
// 
// S.R.P for short – this principle states that:
// 
// A class should have one and only one reason to change, meaning that a class should have only one job.


protocol SolidShapeInterface{
    func calculateVoulme() -> Float
}

protocol FlatShapeInterface {
    func calculateArea() -> Float
}

protocol ManageShapeInterface {
    func calculate() -> Float
}

class Square : FlatShapeInterface , ManageShapeInterface{
    var radious : Float
    
    init(radious: Float) {
        self.radious = radious
    }
    
    func calculateArea() -> Float{
        return Float(radious * radious)
    }
    
    func calculate() -> Float{
        return calculateArea()
    }
}


class Sphere : SolidShapeInterface,FlatShapeInterface , ManageShapeInterface{
    var radious : Float
    init (radious : Float){
        self.radious = radious
    }
    func calculateVoulme() -> Float {
        return Float (4/3 * 22/7 * radious * radious * radious)
    }
    func calculateArea() -> Float{
        return Float(4 * 22 / 7 * radious * radious)
    }
    
    func calculate() -> Float {
        return calculateArea() + calculateVoulme()
    }
}
class Circle : FlatShapeInterface,ManageShapeInterface{
    var radious : Float
    
    init(radious: Float) {
        self.radious = radious
    }
    
    func calculateArea() -> Float{
        return Float(22/7 * radious * radious)
    }
    
    func calculate() -> Float{
        return calculateArea()
    }
}


class AreaCalculator {
    
    var shapes : [FlatShapeInterface]
    var totalAreas : Float = 0.0
    
    init (shapes : [FlatShapeInterface]){
        self.shapes = shapes
    }
    
    func calculateAllAreas() -> Float {
        for shape in shapes {
            totalAreas += shape.calculateArea()
        }
        return totalAreas
    }
}


var circle = Circle(radious: 5)
var square = Square(radious: 4)

var collector = AreaCalculator(shapes: [circle, square])
collector.calculateAllAreas()


class AreasPrinter {
    func printJSON(input : Float){
        print("JSON : \(input)")
    }
    
    func printHAML(input : Float){
        print("HAML : \(input)")
    }
    
    func printJADE(input : Float){
        print("JADE : \(input)")
    }
    
    func printHTML(input : Float){
        print("HTML : \(input)")
    }
}


var printer = AreasPrinter()
printer.printHAML(collector.totalAreas)
printer.printJSON(collector.totalAreas)

var football = Sphere(radious: 5)
print(football.calculateVoulme())
print(football.calculateArea())


var manageableShapes : [ManageShapeInterface] = [circle, square , football]
for shape in manageableShapes{
    print("*****\n", shape.calculate())
}




// Dependency Inversion principle

// example to calculate Performance in [ Space , Time ] to websites uses diffrent engines SQL, Realm , Mongo..