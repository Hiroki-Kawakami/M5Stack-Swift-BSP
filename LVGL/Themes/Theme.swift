extension LVGL {
    typealias ThemeApplyCallback = @convention(c) (OpaquePointer?, OpaquePointer?) -> Void

    struct Theme {
        let obj: OpaquePointer

        init(obj: OpaquePointer) {
            self.obj = obj
        }

        // MARK: - Theme Functions (from lv_theme.h)

        /// Set a base theme for this theme
        func setParent(_ parent: Theme) {
            lv_theme_set_parent(obj, parent.obj)
        }

        /// Set an apply callback for this theme
        func setApplyCb(_ callback: @escaping ThemeApplyCallback) {
            lv_theme_set_apply_cb(obj, callback)
        }
    }
}

extension LVGL.ObjectProtocol {
    // MARK: - Theme Functions (from lv_theme.h)

    /// Get the theme assigned to the display of the object
    func getTheme() -> LVGL.Theme? {
        guard let theme = lv_theme_get_from_obj(obj) else {
            return nil
        }
        return LVGL.Theme(obj: theme)
    }

    /// Apply the active theme on this object
    func applyTheme() {
        lv_theme_apply(obj)
    }

    /// Get the small font of the theme
    func getThemeFontSmall() -> UnsafePointer<lv_font_t>? {
        lv_theme_get_font_small(obj)
    }

    /// Get the normal font of the theme
    func getThemeFontNormal() -> UnsafePointer<lv_font_t>? {
        lv_theme_get_font_normal(obj)
    }

    /// Get the large font of the theme
    func getThemeFontLarge() -> UnsafePointer<lv_font_t>? {
        lv_theme_get_font_large(obj)
    }

    /// Get the primary color of the theme
    func getThemeColorPrimary() -> LVGL.Color {
        LVGL.Color(lv_color: lv_theme_get_color_primary(obj))
    }

    /// Get the secondary color of the theme
    func getThemeColorSecondary() -> LVGL.Color {
        LVGL.Color(lv_color: lv_theme_get_color_secondary(obj))
    }
}
