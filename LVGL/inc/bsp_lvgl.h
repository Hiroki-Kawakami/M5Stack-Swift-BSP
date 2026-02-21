#pragma once
#include "lvgl.h"
#include "esp_lvgl_port.h"

// MARK: Object Class Declerations
typedef enum {
    LV_OBJ_CLASS_TYPE_OBJ,
    LV_OBJ_CLASS_TYPE_LABEL,
    LV_OBJ_CLASS_TYPE_BUTTON,
    LV_OBJ_CLASS_TYPE_BUTTONMATRIX,
    LV_OBJ_CLASS_TYPE_BAR,
    LV_OBJ_CLASS_TYPE_SLIDER,
    LV_OBJ_CLASS_TYPE_TABLE,
    LV_OBJ_CLASS_TYPE_CHECKBOX,
    LV_OBJ_CLASS_TYPE_SWITCH,
    LV_OBJ_CLASS_TYPE_CHART,
    LV_OBJ_CLASS_TYPE_ROLLER,
    LV_OBJ_CLASS_TYPE_DROPDOWN,
    LV_OBJ_CLASS_TYPE_DROPDOWNLIST,
    LV_OBJ_CLASS_TYPE_ARC,
    LV_OBJ_CLASS_TYPE_SPINNER,
    LV_OBJ_CLASS_TYPE_TEXTAREA,
    LV_OBJ_CLASS_TYPE_CALENDAR,
    LV_OBJ_CLASS_TYPE_KEYBOARD,
    LV_OBJ_CLASS_TYPE_LIST,
    LV_OBJ_CLASS_TYPE_LIST_TEXT,
    LV_OBJ_CLASS_TYPE_LIST_BUTTON,
    LV_OBJ_CLASS_TYPE_MSGBOX,
    LV_OBJ_CLASS_TYPE_SPINBOX,
    LV_OBJ_CLASS_TYPE_TABVIEW,
    LV_OBJ_CLASS_TYPE_TILEVIEW,
    LV_OBJ_CLASS_TYPE_TILEVIEW_TILE,
    LV_OBJ_CLASS_TYPE_LED,
    LV_OBJ_CLASS_TYPE_WIN,

    LV_OBJ_CLASS_TYPE_UNKNOWN,
} lv_obj_class_type_t;
static const lv_obj_class_t *lv_obj_class_get_ptr(lv_obj_class_type_t type) {
    switch (type) {
    case LV_OBJ_CLASS_TYPE_OBJ: return &lv_obj_class;
#if LV_USE_LABEL
    case LV_OBJ_CLASS_TYPE_LABEL: return &lv_label_class;
#endif
#if LV_USE_BUTTON
    case LV_OBJ_CLASS_TYPE_BUTTON: return &lv_button_class;
#endif
#if LV_USE_BUTTONMATRIX
    case LV_OBJ_CLASS_TYPE_BUTTONMATRIX: return &lv_buttonmatrix_class;
#endif
#if LV_USE_BAR
    case LV_OBJ_CLASS_TYPE_BAR: return &lv_bar_class;
#endif
#if LV_USE_SLIDER
    case LV_OBJ_CLASS_TYPE_SLIDER: return &lv_slider_class;
#endif
#if LV_USE_TABLE
    case LV_OBJ_CLASS_TYPE_TABLE: return &lv_table_class;
#endif
#if LV_USE_CHECKBOX
    case LV_OBJ_CLASS_TYPE_CHECKBOX: return &lv_checkbox_class;
#endif
#if LV_USE_SWITCH
    case LV_OBJ_CLASS_TYPE_SWITCH: return &lv_switch_class;
#endif
#if LV_USE_CHART
    case LV_OBJ_CLASS_TYPE_CHART: return &lv_chart_class;
#endif
#if LV_USE_ROLLER
    case LV_OBJ_CLASS_TYPE_ROLLER: return &lv_roller_class;
#endif
#if LV_USE_DROPDOWN
    case LV_OBJ_CLASS_TYPE_DROPDOWN: return &lv_dropdown_class;
    case LV_OBJ_CLASS_TYPE_DROPDOWNLIST: return &lv_dropdownlist_class;
#endif
#if LV_USE_ARC
    case LV_OBJ_CLASS_TYPE_ARC: return &lv_arc_class;
#endif
#if LV_USE_SPINNER
    case LV_OBJ_CLASS_TYPE_SPINNER: return &lv_spinner_class;
#endif
#if LV_USE_TEXTAREA
    case LV_OBJ_CLASS_TYPE_TEXTAREA: return &lv_textarea_class;
#endif
#if LV_USE_CALENDAR
    case LV_OBJ_CLASS_TYPE_CALENDAR: return &lv_calendar_class;
#endif
#if LV_USE_KEYBOARD
    case LV_OBJ_CLASS_TYPE_KEYBOARD: return &lv_keyboard_class;
#endif
#if LV_USE_LIST
    case LV_OBJ_CLASS_TYPE_LIST: return &lv_list_class;
    case LV_OBJ_CLASS_TYPE_LIST_TEXT: return &lv_list_text_class;
    case LV_OBJ_CLASS_TYPE_LIST_BUTTON: return &lv_list_button_class;
#endif
#if LV_USE_MSGBOX
    case LV_OBJ_CLASS_TYPE_MSGBOX: return &lv_msgbox_class;
#endif
#if LV_USE_SPINBOX
    case LV_OBJ_CLASS_TYPE_SPINBOX: return &lv_spinbox_class;
#endif
#if LV_USE_TABVIEW
    case LV_OBJ_CLASS_TYPE_TABVIEW: return &lv_tabview_class;
#endif
#if LV_USE_TILEVIEW
    case LV_OBJ_CLASS_TYPE_TILEVIEW: return &lv_tileview_class;
    case LV_OBJ_CLASS_TYPE_TILEVIEW_TILE: return &lv_tileview_tile_class;
#endif
#if LV_USE_LED
    case LV_OBJ_CLASS_TYPE_LED: return &lv_led_class;
#endif
#if LV_USE_WIN
    case LV_OBJ_CLASS_TYPE_WIN: return &lv_win_class;
#endif
    default: return NULL;
    }
}
static lv_obj_class_type_t lv_obj_class_get_type(const lv_obj_class_t *ptr) {
    if (ptr == &lv_obj_class) return LV_OBJ_CLASS_TYPE_OBJ;
#if LV_USE_LABEL
    if (ptr == &lv_label_class) return LV_OBJ_CLASS_TYPE_LABEL;
#endif
#if LV_USE_BUTTON
    if (ptr == &lv_button_class) return LV_OBJ_CLASS_TYPE_BUTTON;
#endif
#if LV_USE_BUTTONMATRIX
    if (ptr == &lv_buttonmatrix_class) return LV_OBJ_CLASS_TYPE_BUTTONMATRIX;
#endif
#if LV_USE_BAR
    if (ptr == &lv_bar_class) return LV_OBJ_CLASS_TYPE_BAR;
#endif
#if LV_USE_SLIDER
    if (ptr == &lv_slider_class) return LV_OBJ_CLASS_TYPE_SLIDER;
#endif
#if LV_USE_TABLE
    if (ptr == &lv_table_class) return LV_OBJ_CLASS_TYPE_TABLE;
#endif
#if LV_USE_CHECKBOX
    if (ptr == &lv_checkbox_class) return LV_OBJ_CLASS_TYPE_CHECKBOX;
#endif
#if LV_USE_SWITCH
    if (ptr == &lv_switch_class) return LV_OBJ_CLASS_TYPE_SWITCH;
#endif
#if LV_USE_CHART
    if (ptr == &lv_chart_class) return LV_OBJ_CLASS_TYPE_CHART;
#endif
#if LV_USE_ROLLER
    if (ptr == &lv_roller_class) return LV_OBJ_CLASS_TYPE_ROLLER;
#endif
#if LV_USE_DROPDOWN
    if (ptr == &lv_dropdown_class) return LV_OBJ_CLASS_TYPE_DROPDOWN;
    if (ptr == &lv_dropdownlist_class) return LV_OBJ_CLASS_TYPE_DROPDOWNLIST;
#endif
#if LV_USE_ARC
    if (ptr == &lv_arc_class) return LV_OBJ_CLASS_TYPE_ARC;
#endif
#if LV_USE_SPINNER
    if (ptr == &lv_spinner_class) return LV_OBJ_CLASS_TYPE_SPINNER;
#endif
#if LV_USE_TEXTAREA
    if (ptr == &lv_textarea_class) return LV_OBJ_CLASS_TYPE_TEXTAREA;
#endif
#if LV_USE_CALENDAR
    if (ptr == &lv_calendar_class) return LV_OBJ_CLASS_TYPE_CALENDAR;
#endif
#if LV_USE_KEYBOARD
    if (ptr == &lv_keyboard_class) return LV_OBJ_CLASS_TYPE_KEYBOARD;
#endif
#if LV_USE_LIST
    if (ptr == &lv_list_class) return LV_OBJ_CLASS_TYPE_LIST;
    if (ptr == &lv_list_text_class) return LV_OBJ_CLASS_TYPE_LIST_TEXT;
    if (ptr == &lv_list_button_class) return LV_OBJ_CLASS_TYPE_LIST_BUTTON;
#endif
#if LV_USE_MSGBOX
    if (ptr == &lv_msgbox_class) return LV_OBJ_CLASS_TYPE_MSGBOX;
#endif
#if LV_USE_SPINBOX
    if (ptr == &lv_spinbox_class) return LV_OBJ_CLASS_TYPE_SPINBOX;
#endif
#if LV_USE_TABVIEW
    if (ptr == &lv_tabview_class) return LV_OBJ_CLASS_TYPE_TABVIEW;
#endif
#if LV_USE_TILEVIEW
    if (ptr == &lv_tileview_class) return LV_OBJ_CLASS_TYPE_TILEVIEW;
    if (ptr == &lv_tileview_tile_class) return LV_OBJ_CLASS_TYPE_TILEVIEW_TILE;
#endif
#if LV_USE_LED
    if (ptr == &lv_led_class) return LV_OBJ_CLASS_TYPE_LED;
#endif
#if LV_USE_WIN
    if (ptr == &lv_win_class) return LV_OBJ_CLASS_TYPE_WIN;
#endif
    return LV_OBJ_CLASS_TYPE_UNKNOWN;
}

// MARK: size content
static int32_t lv_size_content() { return LV_SIZE_CONTENT; }
