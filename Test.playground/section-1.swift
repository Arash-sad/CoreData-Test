// Playground - noun: a place where people can play

import Cocoa


enum OnOffSwitch {
    case Off, On
    
    mutating func toggle(){
        switch self {
        case .Off:
            self = On
        case .On:
            self = Off
            
        }
    }
}

var wallSwitch = OnOffSwitch.Off
wallSwitch = OnOffSwitch.On

if wallSwitch == OnOffSwitch.On{
    println("Roosh ane")
    
} else if wallSwitch == OnOffSwitch.Off{
    println("Khamooshe dige lashi !")
}