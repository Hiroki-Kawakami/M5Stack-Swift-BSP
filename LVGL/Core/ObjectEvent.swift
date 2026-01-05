extension LVGL.ObjectProtocol {
    @discardableResult func addEventCb(_ eventCb: lv_event_cb_t, filter: lv_event_code_t, userData: UnsafeMutableRawPointer!) -> OpaquePointer! { lv_obj_add_event_cb(obj, eventCb, filter, userData) }
    func getEventCount() -> UInt32 { lv_obj_get_event_count(obj) }
    @discardableResult func removeEvent(index: UInt32) -> Bool { lv_obj_remove_event(obj, index) }
}
