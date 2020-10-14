import Foundation

// https://www.vadimbulavin.com/swift-atomic-properties-with-property-wrappers/
@propertyWrapper
class Atomic<Value> {
    private let queue = DispatchQueue(label: "org.vanillamud.atomic.\(UUID().uuidString)")
    private var value: Value

    var projectedValue: Atomic<Value> { self }

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    func mutate(_ mutation: (inout Value) -> Void) {
        queue.sync(flags: .barrier) { mutation(&value) }
    }

    var wrappedValue: Value {
        get { queue.sync { value } }
        set { queue.sync { value = newValue } }
    }
}
