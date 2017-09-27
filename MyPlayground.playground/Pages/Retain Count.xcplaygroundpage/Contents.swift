//: Playground - noun: a place where people can play

import UIKit

class Cook{
    let name: String = "Abhay"
//    let cat: String = "Veg"
}
print(CFGetRetainCount)
print(CFGetRetainCount(Cook()))
let c1 = Cook()
print(CFGetRetainCount(c1))
let c2 = c1
print(CFGetRetainCount(c2))
let c3 = c2
print(CFGetRetainCount(c3))
//print(c1.cat, c1.name)
////c2.name = "Abhisek"
//print(c2.cat, c2.name)
//print(c3.cat, c3.name)


