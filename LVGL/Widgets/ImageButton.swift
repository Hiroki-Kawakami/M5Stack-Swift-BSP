extension LVGL {
    struct ImageButton: ObjectProtocol {
        let obj: OpaquePointer

        typealias State = lv_imagebutton_state_t

        init(obj: OpaquePointer) { self.obj = obj }
        @discardableResult init<T: ObjectProtocol>(parent: T?, objectInit: ((ImageButton) -> ())? = nil) {
            self.obj = lv_imagebutton_create(parent?.obj)
            objectInit?(self)
        }

        func setSrc(state: State, srcLeft: UnsafeRawPointer, srcMid: UnsafeRawPointer, srcRight: UnsafeRawPointer) { lv_imagebutton_set_src(obj, state, srcLeft, srcMid, srcRight) }
        func setState(_ state: State) { lv_imagebutton_set_state(obj, state) }
        func getSrcLeft(state: State) { lv_imagebutton_get_src_left(obj, state) }
        func getSrcMiddle(state: State) { lv_imagebutton_get_src_middle(obj, state) }
        func getSrcRight(state: State) { lv_imagebutton_get_src_right(obj, state) }
    }
}

extension lv_imagebutton_state_t {
    static let released = LV_IMAGEBUTTON_STATE_RELEASED
    static let pressed = LV_IMAGEBUTTON_STATE_PRESSED
    static let disabled = LV_IMAGEBUTTON_STATE_DISABLED
    static let checkedReleased = LV_IMAGEBUTTON_STATE_CHECKED_RELEASED
    static let checkedPressed = LV_IMAGEBUTTON_STATE_CHECKED_PRESSED
    static let checkedDisabled = LV_IMAGEBUTTON_STATE_CHECKED_DISABLED
    static let num = LV_IMAGEBUTTON_STATE_NUM
}
