extension IDF {
    class GeneralPurposeTimer {

        let gptimer: gptimer_handle_t?

        init(resolutionHz: UInt32 = 1 * 1000 * 1000) throws(IDF.Error) {
            var config = gptimer_config_t()
            config.clk_src = GPTIMER_CLK_SRC_DEFAULT
            config.direction = GPTIMER_COUNT_UP
            config.resolution_hz = resolutionHz

            var gptimer: gptimer_handle_t?
            try IDF.Error.check(gptimer_new_timer(&config, &gptimer))
            try IDF.Error.check(gptimer_enable(gptimer))
            try IDF.Error.check(gptimer_start(gptimer))
            self.gptimer = gptimer
        }

        deinit {
            gptimer_stop(gptimer)
            gptimer_disable(gptimer)
            gptimer_del_timer(gptimer)
        }

        var count: UInt64 {
            var count: UInt64 = 0
            gptimer_get_raw_count(gptimer, &count)
            return count
        }
        func duration(from: UInt64) -> UInt64 {
            return count - from
        }
    }

    class ESPTimer {

        private var handle: esp_timer_handle_t?
        private var callback: FFI.Wrapper<() -> ()>

        init(
            name: String,
            dispatchMethod: esp_timer_dispatch_t = ESP_TIMER_TASK,
            skipUnhandledEvents: Bool = false,
            callback: @escaping () -> ()
        ) throws(IDF.Error) {
            self.callback = FFI.Wrapper(callback)
            var handle: esp_timer_handle_t?
            let err = name.withCString {
                var args = esp_timer_create_args_t(
                    callback: {
                        FFI.Wrapper<() -> ()>.unretained($0)()
                    },
                    arg: self.callback.passUnretained(),
                    dispatch_method: dispatchMethod,
                    name: $0,
                    skip_unhandled_events: skipUnhandledEvents
                )
                return esp_timer_create(&args, &handle)
            }
            try IDF.Error.check(err)
            self.handle = handle
        }

        deinit {
            if let handle = self.handle {
                esp_timer_delete(handle)
            }
        }

        func startOnce(timeout: UInt64) {
            esp_timer_start_once(handle, timeout)
        }
        func startPeriodic(period: UInt64) {
            esp_timer_start_periodic(handle, period)
        }
        func stop() {
            esp_timer_stop(handle)
        }
        func delete() {
            if let handle = self.handle {
                esp_timer_delete(handle)
                self.handle = nil
            }
        }
    }
}
