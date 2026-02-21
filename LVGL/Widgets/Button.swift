extension LVGL {
    struct Button: ObjectProtocol {
        let obj: OpaquePointer

        init(obj: OpaquePointer) { self.obj = obj }
        @discardableResult init<T: ObjectProtocol>(parent: T?, objectInit: ((Button) -> ())? = nil) {
            self.obj = lv_button_create(parent?.obj)
            objectInit?(self)
        }
    }
}
