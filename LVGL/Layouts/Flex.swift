extension LVGL {
    struct Flex {
        static func `init`() { lv_flex_init() }

        typealias Align = lv_flex_align_t
        typealias Flow = lv_flex_flow_t
    }
}

extension LVGL.Flex.Align {
    static let start = LV_FLEX_ALIGN_START
    static let end = LV_FLEX_ALIGN_END
    static let center = LV_FLEX_ALIGN_CENTER
    static let spaceEvenly = LV_FLEX_ALIGN_SPACE_EVENLY
    static let spaceAround = LV_FLEX_ALIGN_SPACE_AROUND
    static let spaceBetween = LV_FLEX_ALIGN_SPACE_BETWEEN
}

extension LVGL.Flex.Flow {
    static let row = LV_FLEX_FLOW_ROW
    static let column = LV_FLEX_FLOW_COLUMN
    static let rowWrap = LV_FLEX_FLOW_ROW_WRAP
    static let rowReverse = LV_FLEX_FLOW_ROW_REVERSE
    static let rowWrapReverse = LV_FLEX_FLOW_ROW_WRAP_REVERSE
    static let columnWrap = LV_FLEX_FLOW_COLUMN_WRAP
    static let columnReverse = LV_FLEX_FLOW_COLUMN_REVERSE
    static let columnWrapReverse = LV_FLEX_FLOW_COLUMN_WRAP_REVERSE
}

extension LVGL.ObjectProtocol {
    func setFlexFlow(_ flow: LVGL.Flex.Flow) { lv_obj_set_flex_flow(obj, flow) }
    func setFlexAlign(mainPlace: LVGL.Flex.Align, crossPlace: LVGL.Flex.Align, trackCrossPlace: LVGL.Flex.Align) { lv_obj_set_flex_align(obj, mainPlace, crossPlace, trackCrossPlace) }
    func setFlexGrow(_ grow: UInt8) { lv_obj_set_flex_grow(obj, grow) }
}
