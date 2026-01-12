extension LVGL {
    struct Object: ObjectProtocol {
        let obj: OpaquePointer

        init(obj: OpaquePointer) { self.obj = obj }
        init<T: ObjectProtocol>(parent: T?) { self.obj = lv_obj_create(parent?.obj) }

        struct Flag: OptionSet {
            let rawValue: UInt32
            static let hidden = Flag(rawValue: LV_OBJ_FLAG_HIDDEN.rawValue)
            static let clickable = Flag(rawValue: LV_OBJ_FLAG_CLICKABLE.rawValue)
            static let clickFocusable = Flag(rawValue: LV_OBJ_FLAG_CLICK_FOCUSABLE.rawValue)
            static let checkable = Flag(rawValue: LV_OBJ_FLAG_CHECKABLE.rawValue)
            static let scrollable = Flag(rawValue: LV_OBJ_FLAG_SCROLLABLE.rawValue)
            static let scrollElastic = Flag(rawValue: LV_OBJ_FLAG_SCROLL_ELASTIC.rawValue)
            static let scrollMomentum = Flag(rawValue: LV_OBJ_FLAG_SCROLL_MOMENTUM.rawValue)
            static let scrollOne = Flag(rawValue: LV_OBJ_FLAG_SCROLL_ONE.rawValue)
            static let scrollChainHor = Flag(rawValue: LV_OBJ_FLAG_SCROLL_CHAIN_HOR.rawValue)
            static let scrollChainVer = Flag(rawValue: LV_OBJ_FLAG_SCROLL_CHAIN_VER.rawValue)
            static let scrollChain = Flag(rawValue: LV_OBJ_FLAG_SCROLL_CHAIN.rawValue)
            static let scrollOnFocus = Flag(rawValue: LV_OBJ_FLAG_SCROLL_ON_FOCUS.rawValue)
            static let scrollWithArrow = Flag(rawValue: LV_OBJ_FLAG_SCROLL_WITH_ARROW.rawValue)
            static let snappable = Flag(rawValue: LV_OBJ_FLAG_SNAPPABLE.rawValue)
            static let pressLock = Flag(rawValue: LV_OBJ_FLAG_PRESS_LOCK.rawValue)
            static let eventBubble = Flag(rawValue: LV_OBJ_FLAG_EVENT_BUBBLE.rawValue)
            static let gestureBubble = Flag(rawValue: LV_OBJ_FLAG_GESTURE_BUBBLE.rawValue)
            static let advHittest = Flag(rawValue: LV_OBJ_FLAG_ADV_HITTEST.rawValue)
            static let ignoreLayout = Flag(rawValue: LV_OBJ_FLAG_IGNORE_LAYOUT.rawValue)
            static let floating = Flag(rawValue: LV_OBJ_FLAG_FLOATING.rawValue)
            static let sendDrawTaskEvents = Flag(rawValue: LV_OBJ_FLAG_SEND_DRAW_TASK_EVENTS.rawValue)
            static let overflowVisible = Flag(rawValue: LV_OBJ_FLAG_OVERFLOW_VISIBLE.rawValue)
            static let eventTrickle = Flag(rawValue: LV_OBJ_FLAG_EVENT_TRICKLE.rawValue)
            static let stateTrickle = Flag(rawValue: LV_OBJ_FLAG_STATE_TRICKLE.rawValue)

            static let layout1 = Flag(rawValue: LV_OBJ_FLAG_LAYOUT_1.rawValue)
            static let layout2 = Flag(rawValue: LV_OBJ_FLAG_LAYOUT_2.rawValue)
            static let widget1 = Flag(rawValue: LV_OBJ_FLAG_WIDGET_1.rawValue)
            static let widget2 = Flag(rawValue: LV_OBJ_FLAG_WIDGET_2.rawValue)
            static let user1 = Flag(rawValue: LV_OBJ_FLAG_USER_1.rawValue)
            static let user2 = Flag(rawValue: LV_OBJ_FLAG_USER_2.rawValue)
            static let user3 = Flag(rawValue: LV_OBJ_FLAG_USER_3.rawValue)
            static let user4 = Flag(rawValue: LV_OBJ_FLAG_USER_4.rawValue)
        }

        typealias Class = lv_obj_class_type_t
    }

    protocol ObjectProtocol {
        var obj: OpaquePointer { get }
    }
}

extension LVGL.ObjectProtocol {
    func addFlag(_ flag: LVGL.Object.Flag) { lv_obj_add_flag(obj, lv_obj_flag_t(flag.rawValue)) }
    func removeFlag(_ flag: LVGL.Object.Flag) { lv_obj_remove_flag(obj, lv_obj_flag_t(flag.rawValue)) }
    func setFlag(_ flag: LVGL.Object.Flag, _ v: Bool) { lv_obj_set_flag(obj, lv_obj_flag_t(flag.rawValue), v) }
    func addState(_ state: LVGL.State) { lv_obj_add_state(obj, lv_state_t(state.rawValue)) }
    func removeState(_ state: LVGL.State) { lv_obj_remove_state(obj, lv_state_t(state.rawValue)) }
    func setState(_ state: LVGL.State, _ v: Bool) { lv_obj_set_state(obj, lv_state_t(state.rawValue), v) }
    func setUserData(_ data: UnsafeMutableRawPointer) { lv_obj_set_user_data(obj, data) }
    func hasFlag(_ flag: LVGL.Object.Flag) -> Bool { lv_obj_has_flag(obj, lv_obj_flag_t(flag.rawValue)) }
    func hasFlagAny(_ flag: LVGL.Object.Flag) -> Bool { lv_obj_has_flag_any(obj, lv_obj_flag_t(flag.rawValue)) }
    func getState() -> LVGL.State { LVGL.State(rawValue: lv_obj_get_state(obj).rawValue) }
    func hasState(_ state: LVGL.State) -> Bool { lv_obj_has_state(obj, lv_state_t(state.rawValue)) }
    func getGroup() -> OpaquePointer! { lv_obj_get_group(obj) }
    func getUserData() -> UnsafeMutableRawPointer { lv_obj_get_user_data(obj) }
    func allocateSpecAttr() { lv_obj_allocate_spec_attr(obj) }
    func checkType(_ class: LVGL.Object.Class) -> Bool { lv_obj_check_type(obj, `class`.ptr) }
    func hasClass(_ class: LVGL.Object.Class) -> Bool { lv_obj_has_class(obj, `class`.ptr) }
    func getClass() -> LVGL.Object.Class { LVGL.Object.Class.from(lv_obj_get_class(obj)) }
    func isVaild() -> Bool { lv_obj_is_valid(obj) }
}

extension LVGL.Object.Class {
    static let obj = LV_OBJ_CLASS_TYPE_OBJ
    static let label = LV_OBJ_CLASS_TYPE_LABEL
    static let button = LV_OBJ_CLASS_TYPE_BUTTON
    static let buttonmatrix = LV_OBJ_CLASS_TYPE_BUTTONMATRIX
    static let bar = LV_OBJ_CLASS_TYPE_BAR
    static let slider = LV_OBJ_CLASS_TYPE_SLIDER
    static let table = LV_OBJ_CLASS_TYPE_TABLE
    static let checkbox = LV_OBJ_CLASS_TYPE_CHECKBOX
    static let `switch` = LV_OBJ_CLASS_TYPE_SWITCH
    static let chart = LV_OBJ_CLASS_TYPE_CHART
    static let roller = LV_OBJ_CLASS_TYPE_ROLLER
    static let dropdown = LV_OBJ_CLASS_TYPE_DROPDOWN
    static let dropdownlist = LV_OBJ_CLASS_TYPE_DROPDOWNLIST
    static let arc = LV_OBJ_CLASS_TYPE_ARC
    static let spinner = LV_OBJ_CLASS_TYPE_SPINNER
    static let textarea = LV_OBJ_CLASS_TYPE_TEXTAREA
    static let calendar = LV_OBJ_CLASS_TYPE_CALENDAR
    static let keyboard = LV_OBJ_CLASS_TYPE_KEYBOARD
    static let list = LV_OBJ_CLASS_TYPE_LIST
    static let listText = LV_OBJ_CLASS_TYPE_LIST_TEXT
    static let listButton = LV_OBJ_CLASS_TYPE_LIST_BUTTON
    static let msgbox = LV_OBJ_CLASS_TYPE_MSGBOX
    static let spinbox = LV_OBJ_CLASS_TYPE_SPINBOX
    static let tabview = LV_OBJ_CLASS_TYPE_TABVIEW
    static let tileview = LV_OBJ_CLASS_TYPE_TILEVIEW
    static let tileviewTile = LV_OBJ_CLASS_TYPE_TILEVIEW_TILE
    static let led = LV_OBJ_CLASS_TYPE_LED
    static let win = LV_OBJ_CLASS_TYPE_WIN
    static let unknown = LV_OBJ_CLASS_TYPE_UNKNOWN

    static func from(_ ptr: OpaquePointer) -> LVGL.Object.Class {
        lv_obj_class_get_type(ptr)
    }
    fileprivate var ptr: OpaquePointer! {
        switch self {
        case .obj: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_OBJ)
        case .label: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_LABEL)
        case .button: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_BUTTON)
        case .buttonmatrix: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_BUTTONMATRIX)
        case .bar: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_BAR)
        case .slider: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_SLIDER)
        case .table: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_TABLE)
        case .checkbox: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_CHECKBOX)
        case .`switch`: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_SWITCH)
        case .chart: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_CHART)
        case .roller: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_ROLLER)
        case .dropdown: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_DROPDOWN)
        case .dropdownlist: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_DROPDOWNLIST)
        case .arc: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_ARC)
        case .spinner: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_SPINNER)
        case .textarea: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_TEXTAREA)
        case .calendar: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_CALENDAR)
        case .keyboard: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_KEYBOARD)
        case .list: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_LIST)
        case .listText: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_LIST_TEXT)
        case .listButton: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_LIST_BUTTON)
        case .msgbox: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_MSGBOX)
        case .spinbox: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_SPINBOX)
        case .tabview: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_TABVIEW)
        case .tileview: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_TILEVIEW)
        case .tileviewTile: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_TILEVIEW_TILE)
        case .led: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_LED)
        case .win: lv_obj_class_get_ptr(LV_OBJ_CLASS_TYPE_WIN)
        default: nil
        }
    }
}
