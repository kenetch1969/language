import UIKit

var str = "Hello, playground"

protocol SomeDelegate {
    func DoSomething()
}

class MyViewcontroller: SomeDelegate {
    
    func DoSomething() {
        print("Something done")
    }
    
}


class OtherClass {
    var delegate: SomeDelegate?
    func DoSomething() {
        delegate?.DoSomething()
    }
}


var myVar = OtherClass()
myVar.delegate = MyViewcontroller()
myVar.DoSomething()


