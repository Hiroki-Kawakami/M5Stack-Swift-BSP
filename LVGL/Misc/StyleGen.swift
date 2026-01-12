extension LVGL.StyleProtocol {
    // MARK: - Style Setters (from lv_style_gen.h)

    // Size
    func setWidth(_ value: Int32) { lv_style_set_width(style, value) }
    func setMinWidth(_ value: Int32) { lv_style_set_min_width(style, value) }
    func setMaxWidth(_ value: Int32) { lv_style_set_max_width(style, value) }
    func setHeight(_ value: Int32) { lv_style_set_height(style, value) }
    func setMinHeight(_ value: Int32) { lv_style_set_min_height(style, value) }
    func setMaxHeight(_ value: Int32) { lv_style_set_max_height(style, value) }
    func setLength(_ value: Int32) { lv_style_set_length(style, value) }

    // Position
    func setX(_ value: Int32) { lv_style_set_x(style, value) }
    func setY(_ value: Int32) { lv_style_set_y(style, value) }
    func setAlign(_ value: LVGL.Align) { lv_style_set_align(style, lv_align_t(value.rawValue)) }

    // Transform
    func setTransformWidth(_ value: Int32) { lv_style_set_transform_width(style, value) }
    func setTransformHeight(_ value: Int32) { lv_style_set_transform_height(style, value) }
    func setTranslateX(_ value: Int32) { lv_style_set_translate_x(style, value) }
    func setTranslateY(_ value: Int32) { lv_style_set_translate_y(style, value) }
    func setTranslateRadial(_ value: Int32) { lv_style_set_translate_radial(style, value) }
    func setTransformScaleX(_ value: Int32) { lv_style_set_transform_scale_x(style, value) }
    func setTransformScaleY(_ value: Int32) { lv_style_set_transform_scale_y(style, value) }
    func setTransformRotation(_ value: Int32) { lv_style_set_transform_rotation(style, value) }
    func setTransformPivotX(_ value: Int32) { lv_style_set_transform_pivot_x(style, value) }
    func setTransformPivotY(_ value: Int32) { lv_style_set_transform_pivot_y(style, value) }
    func setTransformSkewX(_ value: Int32) { lv_style_set_transform_skew_x(style, value) }
    func setTransformSkewY(_ value: Int32) { lv_style_set_transform_skew_y(style, value) }

    // Padding
    func setPadTop(_ value: Int32) { lv_style_set_pad_top(style, value) }
    func setPadBottom(_ value: Int32) { lv_style_set_pad_bottom(style, value) }
    func setPadLeft(_ value: Int32) { lv_style_set_pad_left(style, value) }
    func setPadRight(_ value: Int32) { lv_style_set_pad_right(style, value) }
    func setPadRow(_ value: Int32) { lv_style_set_pad_row(style, value) }
    func setPadColumn(_ value: Int32) { lv_style_set_pad_column(style, value) }
    func setPadRadial(_ value: Int32) { lv_style_set_pad_radial(style, value) }

    // Margin
    func setMarginTop(_ value: Int32) { lv_style_set_margin_top(style, value) }
    func setMarginBottom(_ value: Int32) { lv_style_set_margin_bottom(style, value) }
    func setMarginLeft(_ value: Int32) { lv_style_set_margin_left(style, value) }
    func setMarginRight(_ value: Int32) { lv_style_set_margin_right(style, value) }

    // Background
    func setBgColor(_ value: LVGL.Color) { lv_style_set_bg_color(style, value.lv_color) }
    func setBgOpa(_ value: LVGL.Opacity) { lv_style_set_bg_opa(style, value.rawValue) }
    func setBgGradColor(_ value: LVGL.Color) { lv_style_set_bg_grad_color(style, value.lv_color) }
    func setBgGradDir(_ value: lv_grad_dir_t) { lv_style_set_bg_grad_dir(style, value) }
    func setBgMainStop(_ value: Int32) { lv_style_set_bg_main_stop(style, value) }
    func setBgGradStop(_ value: Int32) { lv_style_set_bg_grad_stop(style, value) }
    func setBgMainOpa(_ value: LVGL.Opacity) { lv_style_set_bg_main_opa(style, value.rawValue) }
    func setBgGradOpa(_ value: LVGL.Opacity) { lv_style_set_bg_grad_opa(style, value.rawValue) }
    func setBgGrad(_ value: UnsafePointer<lv_grad_dsc_t>) { lv_style_set_bg_grad(style, value) }
    func setBgImageSrc(_ value: UnsafeRawPointer) { lv_style_set_bg_image_src(style, value) }
    func setBgImageOpa(_ value: LVGL.Opacity) { lv_style_set_bg_image_opa(style, value.rawValue) }
    func setBgImageRecolor(_ value: LVGL.Color) { lv_style_set_bg_image_recolor(style, value.lv_color) }
    func setBgImageRecolorOpa(_ value: LVGL.Opacity) { lv_style_set_bg_image_recolor_opa(style, value.rawValue) }
    func setBgImageTiled(_ value: Bool) { lv_style_set_bg_image_tiled(style, value) }

    // Border
    func setBorderColor(_ value: LVGL.Color) { lv_style_set_border_color(style, value.lv_color) }
    func setBorderOpa(_ value: LVGL.Opacity) { lv_style_set_border_opa(style, value.rawValue) }
    func setBorderWidth(_ value: Int32) { lv_style_set_border_width(style, value) }
    func setBorderSide(_ value: lv_border_side_t) { lv_style_set_border_side(style, value) }
    func setBorderPost(_ value: Bool) { lv_style_set_border_post(style, value) }

    // Outline
    func setOutlineWidth(_ value: Int32) { lv_style_set_outline_width(style, value) }
    func setOutlineColor(_ value: LVGL.Color) { lv_style_set_outline_color(style, value.lv_color) }
    func setOutlineOpa(_ value: LVGL.Opacity) { lv_style_set_outline_opa(style, value.rawValue) }
    func setOutlinePad(_ value: Int32) { lv_style_set_outline_pad(style, value) }

    // Shadow
    func setShadowWidth(_ value: Int32) { lv_style_set_shadow_width(style, value) }
    func setShadowOffsetX(_ value: Int32) { lv_style_set_shadow_offset_x(style, value) }
    func setShadowOffsetY(_ value: Int32) { lv_style_set_shadow_offset_y(style, value) }
    func setShadowSpread(_ value: Int32) { lv_style_set_shadow_spread(style, value) }
    func setShadowColor(_ value: LVGL.Color) { lv_style_set_shadow_color(style, value.lv_color) }
    func setShadowOpa(_ value: LVGL.Opacity) { lv_style_set_shadow_opa(style, value.rawValue) }

    // Image
    func setImageOpa(_ value: LVGL.Opacity) { lv_style_set_image_opa(style, value.rawValue) }
    func setImageRecolor(_ value: LVGL.Color) { lv_style_set_image_recolor(style, value.lv_color) }
    func setImageRecolorOpa(_ value: LVGL.Opacity) { lv_style_set_image_recolor_opa(style, value.rawValue) }
    func setImageColorkey(_ value: UnsafePointer<lv_image_colorkey_t>) { lv_style_set_image_colorkey(style, value) }

    // Line
    func setLineWidth(_ value: Int32) { lv_style_set_line_width(style, value) }
    func setLineDashWidth(_ value: Int32) { lv_style_set_line_dash_width(style, value) }
    func setLineDashGap(_ value: Int32) { lv_style_set_line_dash_gap(style, value) }
    func setLineRounded(_ value: Bool) { lv_style_set_line_rounded(style, value) }
    func setLineColor(_ value: LVGL.Color) { lv_style_set_line_color(style, value.lv_color) }
    func setLineOpa(_ value: LVGL.Opacity) { lv_style_set_line_opa(style, value.rawValue) }

    // Arc
    func setArcWidth(_ value: Int32) { lv_style_set_arc_width(style, value) }
    func setArcRounded(_ value: Bool) { lv_style_set_arc_rounded(style, value) }
    func setArcColor(_ value: LVGL.Color) { lv_style_set_arc_color(style, value.lv_color) }
    func setArcOpa(_ value: LVGL.Opacity) { lv_style_set_arc_opa(style, value.rawValue) }
    func setArcImageSrc(_ value: UnsafeRawPointer) { lv_style_set_arc_image_src(style, value) }

    // Text
    func setTextColor(_ value: LVGL.Color) { lv_style_set_text_color(style, value.lv_color) }
    func setTextOpa(_ value: LVGL.Opacity) { lv_style_set_text_opa(style, value.rawValue) }
    func setTextFont(_ value: UnsafePointer<lv_font_t>) { lv_style_set_text_font(style, value) }
    func setTextLetterSpace(_ value: Int32) { lv_style_set_text_letter_space(style, value) }
    func setTextLineSpace(_ value: Int32) { lv_style_set_text_line_space(style, value) }
    func setTextDecor(_ value: lv_text_decor_t) { lv_style_set_text_decor(style, value) }
    func setTextAlign(_ value: lv_text_align_t) { lv_style_set_text_align(style, value) }
    func setTextOutlineStrokeColor(_ value: LVGL.Color) { lv_style_set_text_outline_stroke_color(style, value.lv_color) }
    func setTextOutlineStrokeWidth(_ value: Int32) { lv_style_set_text_outline_stroke_width(style, value) }
    func setTextOutlineStrokeOpa(_ value: LVGL.Opacity) { lv_style_set_text_outline_stroke_opa(style, value.rawValue) }

    // Misc
    func setRadius(_ value: Int32) { lv_style_set_radius(style, value) }
    func setRadialOffset(_ value: Int32) { lv_style_set_radial_offset(style, value) }
    func setClipCorner(_ value: Bool) { lv_style_set_clip_corner(style, value) }
    func setOpa(_ value: LVGL.Opacity) { lv_style_set_opa(style, value.rawValue) }
    func setOpaLayered(_ value: LVGL.Opacity) { lv_style_set_opa_layered(style, value.rawValue) }
    func setColorFilterDsc(_ value: UnsafePointer<lv_color_filter_dsc_t>) { lv_style_set_color_filter_dsc(style, value) }
    func setColorFilterOpa(_ value: LVGL.Opacity) { lv_style_set_color_filter_opa(style, value.rawValue) }
    func setRecolor(_ value: LVGL.Color) { lv_style_set_recolor(style, value.lv_color) }
    func setRecolorOpa(_ value: LVGL.Opacity) { lv_style_set_recolor_opa(style, value.rawValue) }
    func setAnim(_ value: UnsafePointer<lv_anim_t>) { lv_style_set_anim(style, value) }
    func setAnimDuration(_ value: UInt32) { lv_style_set_anim_duration(style, value) }
    func setTransition(_ value: UnsafePointer<lv_style_transition_dsc_t>) { lv_style_set_transition(style, value) }
    func setBlendMode(_ value: lv_blend_mode_t) { lv_style_set_blend_mode(style, value) }
    func setLayout(_ value: UInt16) { lv_style_set_layout(style, value) }
    func setBaseDir(_ value: lv_base_dir_t) { lv_style_set_base_dir(style, value) }
    func setBitmapMaskSrc(_ value: UnsafeRawPointer) { lv_style_set_bitmap_mask_src(style, value) }
    func setRotarySensitivity(_ value: UInt32) { lv_style_set_rotary_sensitivity(style, value) }

    // Flex
    func setFlexFlow(_ value: lv_flex_flow_t) { lv_style_set_flex_flow(style, value) }
    func setFlexMainPlace(_ value: lv_flex_align_t) { lv_style_set_flex_main_place(style, value) }
    func setFlexCrossPlace(_ value: lv_flex_align_t) { lv_style_set_flex_cross_place(style, value) }
    func setFlexTrackPlace(_ value: lv_flex_align_t) { lv_style_set_flex_track_place(style, value) }
    func setFlexGrow(_ value: UInt8) { lv_style_set_flex_grow(style, value) }

    // Grid
    func setGridColumnDscArray(_ value: UnsafePointer<Int32>) { lv_style_set_grid_column_dsc_array(style, value) }
    func setGridColumnAlign(_ value: lv_grid_align_t) { lv_style_set_grid_column_align(style, value) }
    func setGridRowDscArray(_ value: UnsafePointer<Int32>) { lv_style_set_grid_row_dsc_array(style, value) }
    func setGridRowAlign(_ value: lv_grid_align_t) { lv_style_set_grid_row_align(style, value) }
    func setGridCellColumnPos(_ value: Int32) { lv_style_set_grid_cell_column_pos(style, value) }
    func setGridCellXAlign(_ value: lv_grid_align_t) { lv_style_set_grid_cell_x_align(style, value) }
    func setGridCellColumnSpan(_ value: Int32) { lv_style_set_grid_cell_column_span(style, value) }
    func setGridCellRowPos(_ value: Int32) { lv_style_set_grid_cell_row_pos(style, value) }
    func setGridCellYAlign(_ value: lv_grid_align_t) { lv_style_set_grid_cell_y_align(style, value) }
    func setGridCellRowSpan(_ value: Int32) { lv_style_set_grid_cell_row_span(style, value) }
}
