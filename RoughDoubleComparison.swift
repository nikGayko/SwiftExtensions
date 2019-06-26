
import Foundation

infix operator ==~: ComparisonPrecedence
infix operator !=~: ComparisonPrecedence
infix operator <=~: ComparisonPrecedence
infix operator >=~: ComparisonPrecedence
infix operator <~: ComparisonPrecedence
infix operator >~: ComparisonPrecedence

fileprivate func ==~ (left: Double, right: Double) -> Bool {
    return fabs(left.distance(to: right)) <= 1e-15
}

fileprivate func !=~ (left: Double, right: Double) -> Bool {
    return !(left ==~ right)
}

fileprivate func <=~ (left: Double, right: Double) -> Bool {
    return left ==~ right || left <~ right
}

fileprivate func >=~ (left: Double, right: Double) -> Bool {
    return left ==~ right || left >~ right
}

fileprivate func <~ (left: Double, right: Double) -> Bool {
    return left.distance(to: right) > 1e-15
}

fileprivate func >~ (left: Double, right: Double) -> Bool {
    return left.distance(to: right) < -1e-15
}


struct Euro: ExpressibleByFloatLiteral {
    typealias FloatLiteralType = Double
    
    let value: Double
    
    init(floatLiteral value: Double) {
        self.value = value
    }
    
    static func ==~ (left: Euro, right: Euro) -> Bool {
        return fabs(left.value.distance(to: right.value)) <= 1e-2
    }
    
    static func !=~ (left: Euro, right: Euro) -> Bool {
        return !(left.value ==~ right.value)
    }
    
    static func <=~ (left: Euro, right: Euro) -> Bool {
        return left.value ==~ right.value || left.value <~ right.value
    }
    
    static func >=~ (left: Euro, right: Euro) -> Bool {
        return left.value ==~ right.value || left.value >~ right.value
    }
    
    static func <~ (left: Euro, right: Euro) -> Bool {
        return left.value.distance(to: right.value) > 1e-2
    }
    
    static func >~ (left: Euro, right: Euro) -> Bool {
        return left.value.distance(to: right.value) < -1e-2
    }
}

struct Crypto: ExpressibleByFloatLiteral {
    typealias FloatLiteralType = Double
    
    let value: Double
    
    init(floatLiteral value: Double) {
        self.value = value
    }
    
    static func ==~ (left: Crypto, right: Crypto) -> Bool {
        return fabs(left.value.distance(to: right.value)) <= 1e-8
    }
    
    static func !=~ (left: Crypto, right: Crypto) -> Bool {
        return !(left.value ==~ right.value)
    }
    
    static func <=~ (left: Crypto, right: Crypto) -> Bool {
        return left.value ==~ right.value || left.value <~ right.value
    }
    
    static func >=~ (left: Crypto, right: Crypto) -> Bool {
        return left.value ==~ right.value || left.value >~ right.value
    }
    
    static func <~ (left: Crypto, right: Crypto) -> Bool {
        return left.value.distance(to: right.value) > 1e-8
    }
    
    static func >~ (left: Crypto, right: Crypto) -> Bool {
        return left.value.distance(to: right.value) < -1e-8
    }
}
