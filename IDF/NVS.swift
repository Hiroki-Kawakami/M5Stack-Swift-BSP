extension IDF {
    class NVS {

        typealias OpenMode = nvs_open_mode_t

        static func initialize() throws(IDF.Error) {
            var err = IDF.Error(nvs_flash_init())
            if err == .nvsNoFreePages || err == .nvsNewVersionFound {
                try IDF.Error.check(nvs_flash_erase())
                err = IDF.Error(nvs_flash_init())
            }
            try IDF.Error.check(err)
        }

        static func flashErase() throws(IDF.Error) {
            try IDF.Error.check(nvs_flash_erase())
        }

        let name: String
        let handle: nvs_handle_t

        init(name: String, mode: OpenMode = .readWrite) throws(IDF.Error) {
            var handle: nvs_handle_t = 0
            let err = name.withCString {
                nvs_open($0, mode, &handle)
            }
            try IDF.Error.check(err)
            self.name = name
            self.handle = handle
        }

        deinit {
            nvs_close(handle)
        }

        func erase(key: String) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_erase_key(handle, $0) })
        }
        func eraseAll() throws(IDF.Error) {
            try IDF.Error.check(nvs_erase_all(handle))
        }
        func commit() throws(IDF.Error) {
            try IDF.Error.check(nvs_commit(handle))
        }
        func getUsedEntryCount() throws(IDF.Error) -> Int {
            var usedEntries: size_t = 0
            try IDF.Error.check(nvs_get_used_entry_count(handle, &usedEntries))
            return usedEntries
        }

        // Set functions
        func set(key: String, value: Int8) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_i8(handle, $0, value) })
        }
        func set(key: String, value: UInt8) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_u8(handle, $0, value) })
        }
        func set(key: String, value: Int16) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_i16(handle, $0, value) })
        }
        func set(key: String, value: UInt16) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_u16(handle, $0, value) })
        }
        func set(key: String, value: Int32) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_i32(handle, $0, value) })
        }
        func set(key: String, value: UInt32) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_u32(handle, $0, value) })
        }
        func set(key: String, value: Int64) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_i64(handle, $0, value) })
        }
        func set(key: String, value: UInt64) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_u64(handle, $0, value) })
        }
        func set(key: String, value: String) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { keyPtr in
                value.withCString { valuePtr in
                    nvs_set_str(handle, keyPtr, valuePtr)
                }
            })
        }

        // Get functions
        func get(type: Int8.Type, key: String) throws(IDF.Error) -> Int8 {
            var value: Int8 = 0
            try IDF.Error.check(key.withCString { nvs_get_i8(handle, $0, &value) })
            return value
        }
        func get(type: UInt8.Type, key: String) throws(IDF.Error) -> UInt8 {
            var value: UInt8 = 0
            try IDF.Error.check(key.withCString { nvs_get_u8(handle, $0, &value) })
            return value
        }
        func get(type: Int16.Type, key: String) throws(IDF.Error) -> Int16 {
            var value: Int16 = 0
            try IDF.Error.check(key.withCString { nvs_get_i16(handle, $0, &value) })
            return value
        }
        func get(type: UInt16.Type, key: String) throws(IDF.Error) -> UInt16 {
            var value: UInt16 = 0
            try IDF.Error.check(key.withCString { nvs_get_u16(handle, $0, &value) })
            return value
        }
        func get(type: Int32.Type, key: String) throws(IDF.Error) -> Int32 {
            var value: Int32 = 0
            try IDF.Error.check(key.withCString { nvs_get_i32(handle, $0, &value) })
            return value
        }
        func get(type: UInt32.Type, key: String) throws(IDF.Error) -> UInt32 {
            var value: UInt32 = 0
            try IDF.Error.check(key.withCString { nvs_get_u32(handle, $0, &value) })
            return value
        }
        func get(type: Int64.Type, key: String) throws(IDF.Error) -> Int64 {
            var value: Int64 = 0
            try IDF.Error.check(key.withCString { nvs_get_i64(handle, $0, &value) })
            return value
        }
        func get(type: UInt64.Type, key: String) throws(IDF.Error) -> UInt64 {
            var value: UInt64 = 0
            try IDF.Error.check(key.withCString { nvs_get_u64(handle, $0, &value) })
            return value
        }
        func get(type: String.Type, key: String) throws(IDF.Error) -> String {
            var result: String!
            let err = key.withCString {
                var length: size_t = 0
                var err = nvs_get_str(handle, $0, nil, &length)
                if err != ESP_OK { return err }

                var buffer = [CChar](repeating: 0, count: length)
                err = nvs_get_str(handle, $0, &buffer, &length)
                if err != ESP_OK { return err }

                result = String(cString: buffer)
                return ESP_OK
            }
            try IDF.Error.check(err)
            return result
        }

        // Blob functions
        func set(key: String, blob: UnsafeRawBufferPointer) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_blob(handle, $0, blob.baseAddress, blob.count) })
        }
        func set(key: String, blob: UnsafeBufferPointer<UInt8>) throws(IDF.Error) {
            try IDF.Error.check(key.withCString { nvs_set_blob(handle, $0, blob.baseAddress, blob.count) })
        }
        func get(key: String, into buffer: UnsafeMutableRawBufferPointer) throws(IDF.Error) -> Int {
            var length = buffer.count
            try IDF.Error.check(key.withCString { nvs_get_blob(handle, $0, buffer.baseAddress, &length) })
            return length
        }
        func get(key: String, into buffer: UnsafeMutableBufferPointer<UInt8>) throws(IDF.Error) -> Int {
            var length = buffer.count
            try IDF.Error.check(key.withCString { nvs_get_blob(handle, $0, buffer.baseAddress, &length) })
            return length
        }

        // Convenient functions
        func set(key: String, value: Int) throws(IDF.Error) {
            try set(key: key, value: Int32(value))
        }
        func get(type: Int.Type, key: String) throws(IDF.Error) -> Int {
            return Int(try get(type: Int32.self, key: key))
        }
    }
}

extension nvs_open_mode_t {
    static let readOnly = NVS_READONLY
    static let readWrite = NVS_READWRITE
}

extension IDF.Error {
    static let nvsBase = Self(ESP_ERR_NVS_BASE)
    static let nvsNotInitialized = Self(ESP_ERR_NVS_BASE + 0x01)
    static let nvsNotFound = Self(ESP_ERR_NVS_BASE + 0x02)
    static let nvsTypeMismatch = Self(ESP_ERR_NVS_BASE + 0x03)
    static let nvsReadOnly = Self(ESP_ERR_NVS_BASE + 0x04)
    static let nvsNotEnoughSpace = Self(ESP_ERR_NVS_BASE + 0x05)
    static let nvsInvalidName = Self(ESP_ERR_NVS_BASE + 0x06)
    static let nvsInvalidHandle = Self(ESP_ERR_NVS_BASE + 0x07)
    static let nvsRemoveFailed = Self(ESP_ERR_NVS_BASE + 0x08)
    static let nvsKeyTooLong = Self(ESP_ERR_NVS_BASE + 0x09)
    static let nvsPageFull = Self(ESP_ERR_NVS_BASE + 0x0a)
    static let nvsInvalidState = Self(ESP_ERR_NVS_BASE + 0x0b)
    static let nvsInvalidLength = Self(ESP_ERR_NVS_BASE + 0x0c)
    static let nvsNoFreePages = Self(ESP_ERR_NVS_BASE + 0x0d)
    static let nvsValueTooLong = Self(ESP_ERR_NVS_BASE + 0x0e)
    static let nvsPartNotFound = Self(ESP_ERR_NVS_BASE + 0x0f)
    static let nvsNewVersionFound = Self(ESP_ERR_NVS_BASE + 0x10)
    static let nvsXtsEncrFailed = Self(ESP_ERR_NVS_BASE + 0x11)
    static let nvsXtsDecrFailed = Self(ESP_ERR_NVS_BASE + 0x12)
    static let nvsXtsCfgFailed = Self(ESP_ERR_NVS_BASE + 0x13)
    static let nvsXtsCfgNotFound = Self(ESP_ERR_NVS_BASE + 0x14)
    static let nvsEncrNotSupported = Self(ESP_ERR_NVS_BASE + 0x15)
    static let nvsKeysNotInitialized = Self(ESP_ERR_NVS_BASE + 0x16)
    static let nvsCorruptKeyPart = Self(ESP_ERR_NVS_BASE + 0x17)
    static let nvsWrongEncryption = Self(ESP_ERR_NVS_BASE + 0x19)
    static let nvsContentDiffers = Self(ESP_ERR_NVS_BASE + 0x18)
}
