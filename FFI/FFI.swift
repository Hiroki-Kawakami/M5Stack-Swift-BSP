enum FFI {
    class Wrapper<T> {
        let value: T
        init(_ value: T) { self.value = value }

        static func unretained(_ opaquePointer: UnsafeMutableRawPointer!) -> T {
            Unmanaged<Self>.fromOpaque(opaquePointer!).takeUnretainedValue().value
        }
        static func retained(_ opaquePointer: UnsafeMutableRawPointer!) -> T {
            Unmanaged<Self>.fromOpaque(opaquePointer!).takeRetainedValue().value
        }
        func passUnretained() -> UnsafeMutableRawPointer! {
            Unmanaged.passUnretained(self).toOpaque()
        }
        func passRetained() -> UnsafeMutableRawPointer! {
            Unmanaged.passRetained(self).toOpaque()
        }
    }
}
