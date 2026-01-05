extension LVGL {
    struct List: ObjectProtocol {
        let obj: OpaquePointer

        init(obj: OpaquePointer) { self.obj = obj }
        init<T: ObjectProtocol>(parent: T?) { self.obj = lv_list_create(parent?.obj) }

        func addText(_ text: String) -> LVGL.Label { text.withCString { LVGL.Label(obj: lv_list_add_text(obj, $0)) } }
        func addButton(icon: UnsafeRawPointer? = nil, text: String?) -> LVGL.Button {
            LVGL.Button(obj:
                text?.withCString { lv_list_add_button(obj, icon, $0) } ??
                lv_list_add_button(obj, icon, nil)
            )
        }
        func getButtonText<T: ObjectProtocol>(button: T) -> String { lv_list_get_button_text(obj, button.obj).map { String(cString: $0) } ?? "" }
        func setButtonText<T: ObjectProtocol>(button: T, text: String) { text.withCString { lv_list_set_button_text(obj, button.obj, $0) } }
    }
}
