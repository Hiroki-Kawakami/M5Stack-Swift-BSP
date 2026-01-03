class EventGroup<T: OptionSet> where T.RawValue == UInt32 {

    let handle: EventGroupHandle_t

    init(type: T.Type) {
        handle = xEventGroupCreate()
    }
    deinit {
        vEventGroupDelete(handle)
    }

    @discardableResult func wait(
        bits: T,
        clear: Bool = true,
        waitAll: Bool = false,
        ticksToWait: TickType_t = portMAX_DELAY
    ) -> T {
        T(rawValue: xEventGroupWaitBits(handle, bits.rawValue, clear ? 1 : 0, waitAll ? 1 : 0, ticksToWait))
    }
    @discardableResult func set(bits: T) -> T {
        T(rawValue: xEventGroupSetBits(handle, bits.rawValue))
    }
    @discardableResult func clear(bits: T) -> T {
        T(rawValue: xEventGroupClearBits(handle, bits.rawValue))
    }
}
