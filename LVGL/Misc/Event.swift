
extension LVGL {

    typealias EventCode = lv_event_code_t

    struct Event {
        let e: OpaquePointer

        // Get event information
        func getTarget() -> UnsafeMutableRawPointer! { lv_event_get_target(e) }
        func getCurrentTarget() -> UnsafeMutableRawPointer! { lv_event_get_current_target(e) }
        func getCode() -> lv_event_code_t { lv_event_get_code(e) }
        func getParam() -> UnsafeMutableRawPointer! { lv_event_get_param(e) }
        func getUserData() -> UnsafeMutableRawPointer! { lv_event_get_user_data(e) }

        // Event flow control
        func stopBubbling() { lv_event_stop_bubbling(e) }
        func stopTrickling() { lv_event_stop_trickling(e) }
        func stopProcessing() { lv_event_stop_processing(e) }
    }
}

extension lv_event_code_t {
    static let all = LV_EVENT_ALL

    // Input device events
    static let pressed = LV_EVENT_PRESSED
    static let pressing = LV_EVENT_PRESSING
    static let pressLost = LV_EVENT_PRESS_LOST
    static let shortClicked = LV_EVENT_SHORT_CLICKED
    static let singleClicked = LV_EVENT_SINGLE_CLICKED
    static let doubleClicked = LV_EVENT_DOUBLE_CLICKED
    static let tripleClicked = LV_EVENT_TRIPLE_CLICKED
    static let longPressed = LV_EVENT_LONG_PRESSED
    static let longPressedRepeat = LV_EVENT_LONG_PRESSED_REPEAT
    static let clicked = LV_EVENT_CLICKED
    static let released = LV_EVENT_RELEASED
    static let scrollBegin = LV_EVENT_SCROLL_BEGIN
    static let scrollThrowBegin = LV_EVENT_SCROLL_THROW_BEGIN
    static let scrollEnd = LV_EVENT_SCROLL_END
    static let scroll = LV_EVENT_SCROLL
    static let gesture = LV_EVENT_GESTURE
    static let key = LV_EVENT_KEY
    static let rotary = LV_EVENT_ROTARY
    static let focused = LV_EVENT_FOCUSED
    static let defocused = LV_EVENT_DEFOCUSED
    static let leave = LV_EVENT_LEAVE
    static let hitTest = LV_EVENT_HIT_TEST
    static let indevReset = LV_EVENT_INDEV_RESET
    static let hoverOver = LV_EVENT_HOVER_OVER
    static let hoverLeave = LV_EVENT_HOVER_LEAVE

    // Drawing events
    static let coverCheck = LV_EVENT_COVER_CHECK
    static let refrExtDrawSize = LV_EVENT_REFR_EXT_DRAW_SIZE
    static let drawMainBegin = LV_EVENT_DRAW_MAIN_BEGIN
    static let drawMain = LV_EVENT_DRAW_MAIN
    static let drawMainEnd = LV_EVENT_DRAW_MAIN_END
    static let drawPostBegin = LV_EVENT_DRAW_POST_BEGIN
    static let drawPost = LV_EVENT_DRAW_POST
    static let drawPostEnd = LV_EVENT_DRAW_POST_END
    static let drawTaskAdded = LV_EVENT_DRAW_TASK_ADDED

    // Special events
    static let valueChanged = LV_EVENT_VALUE_CHANGED
    static let insert = LV_EVENT_INSERT
    static let refresh = LV_EVENT_REFRESH
    static let ready = LV_EVENT_READY
    static let cancel = LV_EVENT_CANCEL

    // Other events
    static let create = LV_EVENT_CREATE
    static let delete = LV_EVENT_DELETE
    static let childChanged = LV_EVENT_CHILD_CHANGED
    static let childCreated = LV_EVENT_CHILD_CREATED
    static let childDeleted = LV_EVENT_CHILD_DELETED
    static let screenUnloadStart = LV_EVENT_SCREEN_UNLOAD_START
    static let screenLoadStart = LV_EVENT_SCREEN_LOAD_START
    static let screenLoaded = LV_EVENT_SCREEN_LOADED
    static let screenUnloaded = LV_EVENT_SCREEN_UNLOADED
    static let sizeChanged = LV_EVENT_SIZE_CHANGED
    static let styleChanged = LV_EVENT_STYLE_CHANGED
    static let layoutChanged = LV_EVENT_LAYOUT_CHANGED
    static let getSelfSize = LV_EVENT_GET_SELF_SIZE

    // Events of optional LVGL components
    static let invalidateArea = LV_EVENT_INVALIDATE_AREA
    static let resolutionChanged = LV_EVENT_RESOLUTION_CHANGED
    static let colorFormatChanged = LV_EVENT_COLOR_FORMAT_CHANGED
    static let refrRequest = LV_EVENT_REFR_REQUEST
    static let refrStart = LV_EVENT_REFR_START
    static let refrReady = LV_EVENT_REFR_READY
    static let renderStart = LV_EVENT_RENDER_START
    static let renderReady = LV_EVENT_RENDER_READY
    static let flushStart = LV_EVENT_FLUSH_START
    static let flushFinish = LV_EVENT_FLUSH_FINISH
    static let flushWaitStart = LV_EVENT_FLUSH_WAIT_START
    static let flushWaitFinish = LV_EVENT_FLUSH_WAIT_FINISH
    static let vsync = LV_EVENT_VSYNC
    static let vsyncRequest = LV_EVENT_VSYNC_REQUEST

    // Flags
    static let last = LV_EVENT_LAST
    static let preprocess = LV_EVENT_PREPROCESS
    static let markedDeleting = LV_EVENT_MARKED_DELETING
}

extension LVGL.ObjectProtocol {
    func addEventCallback(filter: lv_event_code_t, callback: FFI.Wrapper<() -> ()>) {
        addEventCb({
            let event = LVGL.Event(e: $0!)
            FFI.Wrapper<() -> ()>.unretained(event.getUserData())()
        }, filter: filter, userData: callback.passUnretained())
    }
}
