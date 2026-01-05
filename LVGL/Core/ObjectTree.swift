extension LVGL.ObjectProtocol {
    // MARK: - Delete
    func delete() { lv_obj_delete(obj) }
    func clean() { lv_obj_clean(obj) }
    func deleteDelayed(_ delayMs: UInt32) { lv_obj_delete_delayed(obj, delayMs) }
    func deleteAsync() { lv_obj_delete_async(obj) }

    // MARK: - Parent and Hierarchy
    func setParent<T: LVGL.ObjectProtocol>(_ parent: T) { lv_obj_set_parent(obj, parent.obj) }
    func swap<T: LVGL.ObjectProtocol>(with other: T) { lv_obj_swap(obj, other.obj) }
    func moveToIndex(_ index: Int32) { lv_obj_move_to_index(obj, index) }

    func getScreen() -> OpaquePointer? { lv_obj_get_screen(obj) }
    func getDisplay() -> OpaquePointer? { lv_obj_get_display(obj) }
    func getParent() -> OpaquePointer? { lv_obj_get_parent(obj) }

    // MARK: - Children
    func getChild(_ idx: Int32) -> LVGL.Object? { if let obj = lv_obj_get_child(obj, idx) { LVGL.Object(obj: obj) } else { nil } }
    func getChildByType(_ idx: Int32, classP: OpaquePointer) -> OpaquePointer? { lv_obj_get_child_by_type(obj, idx, classP) }
    func getChildCount() -> UInt32 { lv_obj_get_child_count(obj) }
    func getChildCountByType(_ classP: OpaquePointer) -> UInt32 { lv_obj_get_child_count_by_type(obj, classP) }

    // MARK: - Siblings
    func getSibling(_ idx: Int32) -> OpaquePointer? { lv_obj_get_sibling(obj, idx) }
    func getSiblingByType(_ idx: Int32, classP: OpaquePointer) -> OpaquePointer? { lv_obj_get_sibling_by_type(obj, idx, classP) }

    // MARK: - Index
    func getIndex() -> Int32 { lv_obj_get_index(obj) }
    func getIndexByType(_ classP: OpaquePointer) -> Int32 { lv_obj_get_index_by_type(obj, classP) }

    // MARK: - Tree Walking
    func treeWalk(_ cb: lv_obj_tree_walk_cb_t, userData: UnsafeMutableRawPointer?) { lv_obj_tree_walk(obj, cb, userData) }
    func dumpTree() { lv_obj_dump_tree(obj) }
}

#if LV_USE_OBJ_NAME
extension LVGL.ObjectProtocol {
    // MARK: - Name
    func setName(_ name: String) { lv_obj_set_name(obj, name) }
    func setNameStatic(_ name: UnsafePointer<CChar>) { lv_obj_set_name_static(obj, name) }
    func getName() -> String? {
        guard let cString = lv_obj_get_name(obj) else { return nil }
        return String(cString: cString)
    }
    func getNameResolved(buf: UnsafeMutablePointer<CChar>, bufSize: Int) { lv_obj_get_name_resolved(obj, buf, bufSize) }

    // MARK: - Find by Name
    func findByName(_ name: String) -> OpaquePointer? { lv_obj_find_by_name(obj, name) }
    func getChildByName(_ namePath: String) -> OpaquePointer? { lv_obj_get_child_by_name(obj, namePath) }
}
#endif

// MARK: - Global Functions
// extension LVGL {
//     static func objDeleteAnimCompletedCb(_ anim: UnsafeMutablePointer<lv_anim_t>) { lv_obj_delete_anim_completed_cb(anim) }
// }
