extension LVGL {
    struct Dropdown: ObjectProtocol {
        let obj: OpaquePointer

        init(obj: OpaquePointer) { self.obj = obj }
        @discardableResult init<T: ObjectProtocol>(parent: T?, objectInit: ((Dropdown) -> ())? = nil) {
            self.obj = lv_dropdown_create(parent?.obj)
            objectInit?(self)
        }

        // Setter functions
        func setText(_ text: String) { text.withCString { lv_dropdown_set_text(obj, $0) } }
        func setOptions(_ options: String) { options.withCString { lv_dropdown_set_options(obj, $0) } }
        func setOptions(_ options: StaticString) { options.withUTF8Buffer { lv_dropdown_set_options_static(obj, $0.baseAddress) } }
        func addOption(_ option: String, pos: UInt32) { option.withCString { lv_dropdown_add_option(obj, $0, pos) } }
        func clearOptions() { lv_dropdown_clear_options(obj) }
        func setSelected(_ selOpt: UInt32) { lv_dropdown_set_selected(obj, selOpt) }
        func setDir(_ dir: lv_dir_t) { lv_dropdown_set_dir(obj, dir) }
        func setSymbol(_ symbol: String) { symbol.withCString { lv_dropdown_set_symbol(obj, $0) } }
        func setSelectedHighlight(_ en: Bool) { lv_dropdown_set_selected_highlight(obj, en) }

        // Getter functions
        func getList() -> OpaquePointer? { lv_dropdown_get_list(obj) }
        func getText() -> String? {
            guard let cStr = lv_dropdown_get_text(obj) else { return nil }
            return String(cString: cStr)
        }
        func getOptions() -> String? {
            guard let cStr = lv_dropdown_get_options(obj) else { return nil }
            return String(cString: cStr)
        }
        func getSelected() -> UInt32 { lv_dropdown_get_selected(obj) }
        func getOptionCount() -> UInt32 { lv_dropdown_get_option_count(obj) }
        func getSelectedStr(buf: UnsafeMutablePointer<CChar>, bufSize: UInt32) {
            lv_dropdown_get_selected_str(obj, buf, bufSize)
        }
        func getSelectedStr() -> String {
            let bufSize: UInt32 = 64
            let buf = UnsafeMutablePointer<CChar>.allocate(capacity: Int(bufSize))
            defer { buf.deallocate() }
            lv_dropdown_get_selected_str(obj, buf, bufSize)
            return String(cString: buf)
        }
        func getOptionIndex(_ option: String) -> Int32 {
            option.withCString { lv_dropdown_get_option_index(obj, $0) }
        }
        func getSymbol() -> String? {
            guard let cStr = lv_dropdown_get_symbol(obj) else { return nil }
            return String(cString: cStr)
        }
        func getSelectedHighlight() -> Bool { lv_dropdown_get_selected_highlight(obj) }
        func getDir() -> lv_dir_t { lv_dropdown_get_dir(obj) }

        // Other functions
        func open() { lv_dropdown_open(obj) }
        func close() { lv_dropdown_close(obj) }
        func isOpen() -> Bool { lv_dropdown_is_open(obj) }
    }
}
