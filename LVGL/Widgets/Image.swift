extension LVGL {
    struct Image: ObjectProtocol {
        let obj: OpaquePointer

        typealias Align = lv_image_align_t

        init(obj: OpaquePointer) { self.obj = obj }
        init<T: ObjectProtocol>(parent: T?) { self.obj = lv_image_create(parent?.obj) }

        // Setter functions
        func setSrc(_ src: UnsafeRawPointer) { lv_image_set_src(obj, src) }
        func setOffsetX(_ x: Int32) { lv_image_set_offset_x(obj, x) }
        func setOffsetY(_ y: Int32) { lv_image_set_offset_y(obj, y) }
        func setRotation(_ angle: Int32) { lv_image_set_rotation(obj, angle) }
        func setPivot(x: Int32, y: Int32) { lv_image_set_pivot(obj, x, y) }
        func setPivotX(_ x: Int32) { lv_image_set_pivot_x(obj, x) }
        func setPivotY(_ y: Int32) { lv_image_set_pivot_y(obj, y) }
        func setScale(_ zoom: UInt32) { lv_image_set_scale(obj, zoom) }
        func setScaleX(_ zoom: UInt32) { lv_image_set_scale_x(obj, zoom) }
        func setScaleY(_ zoom: UInt32) { lv_image_set_scale_y(obj, zoom) }
        func setBlendMode(_ blendMode: lv_blend_mode_t) { lv_image_set_blend_mode(obj, blendMode) }
        func setAntialias(_ antialias: Bool) { lv_image_set_antialias(obj, antialias) }
        func setInnerAlign(_ align: Align) { lv_image_set_inner_align(obj, align) }
        func setBitmapMapSrc(_ src: UnsafePointer<lv_image_dsc_t>) { lv_image_set_bitmap_map_src(obj, src) }

        // Getter functions
        func getSrc() -> UnsafeRawPointer? { lv_image_get_src(obj) }
        func getOffsetX() -> Int32 { lv_image_get_offset_x(obj) }
        func getOffsetY() -> Int32 { lv_image_get_offset_y(obj) }
        func getRotation() -> Int32 { lv_image_get_rotation(obj) }
        func getPivot(_ pivot: UnsafeMutablePointer<lv_point_t>) { lv_image_get_pivot(obj, pivot) }
        func getScale() -> Int32 { lv_image_get_scale(obj) }
        func getScaleX() -> Int32 { lv_image_get_scale_x(obj) }
        func getScaleY() -> Int32 { lv_image_get_scale_y(obj) }
        func getSrcWidth() -> Int32 { lv_image_get_src_width(obj) }
        func getSrcHeight() -> Int32 { lv_image_get_src_height(obj) }
        func getTransformedWidth() -> Int32 { lv_image_get_transformed_width(obj) }
        func getTransformedHeight() -> Int32 { lv_image_get_transformed_height(obj) }
        func getBlendMode() -> lv_blend_mode_t { lv_image_get_blend_mode(obj) }
        func getAntialias() -> Bool { lv_image_get_antialias(obj) }
        func getInnerAlign() -> Align { lv_image_get_inner_align(obj) }
        func getBitmapMapSrc() -> UnsafePointer<lv_image_dsc_t>? { lv_image_get_bitmap_map_src(obj) }
    }
}

extension lv_image_align_t {
    static let `default` = LV_IMAGE_ALIGN_DEFAULT
    static let topLeft = LV_IMAGE_ALIGN_TOP_LEFT
    static let topMid = LV_IMAGE_ALIGN_TOP_MID
    static let topRight = LV_IMAGE_ALIGN_TOP_RIGHT
    static let bottomLeft = LV_IMAGE_ALIGN_BOTTOM_LEFT
    static let bottomMid = LV_IMAGE_ALIGN_BOTTOM_MID
    static let bottomRight = LV_IMAGE_ALIGN_BOTTOM_RIGHT
    static let leftMid = LV_IMAGE_ALIGN_LEFT_MID
    static let rightMid = LV_IMAGE_ALIGN_RIGHT_MID
    static let center = LV_IMAGE_ALIGN_CENTER
    static let stretch = LV_IMAGE_ALIGN_STRETCH
    static let tile = LV_IMAGE_ALIGN_TILE
    static let contain = LV_IMAGE_ALIGN_CONTAIN
    static let cover = LV_IMAGE_ALIGN_COVER
}
