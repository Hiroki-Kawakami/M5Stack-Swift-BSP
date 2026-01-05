extension LVGL {
    enum Text {

        typealias Flag = lv_text_flag_t
        typealias Align = lv_text_align_t

        func getSize(text: String, font: UnsafePointer<lv_font_t>, letterSpace: Int32, lineSpace: Int32, maxWidth: Int32, flag: Flag) -> Size {
            text.withCString {
                var point = lv_point_t()
                lv_text_get_size(&point, $0, font, letterSpace, lineSpace, maxWidth, flag)
                return Size(width: Int(point.x), height: Int(point.y))
            }
        }
    }
}

extension lv_text_flag_t {
    static let none = LV_TEXT_FLAG_NONE
    static let expand = LV_TEXT_FLAG_EXPAND
    static let fit = LV_TEXT_FLAG_FIT
    static let breakAll = LV_TEXT_FLAG_BREAK_ALL
    static let recolor = LV_TEXT_FLAG_RECOLOR
}

extension lv_text_align_t {
    static let auto = LV_TEXT_ALIGN_AUTO
    static let left = LV_TEXT_ALIGN_LEFT
    static let center = LV_TEXT_ALIGN_CENTER
    static let right = LV_TEXT_ALIGN_RIGHT
}
