enum IDF {

    struct Error: Swift.Error, CustomStringConvertible, Equatable {
        let rawValue: esp_err_t
        init(_ rawValue: esp_err_t) {
            self.rawValue = rawValue
        }

        static let ok = Self(ESP_OK)
        static let fail: IDF.Error = Self(ESP_FAIL)
        static let noMem = Self(ESP_ERR_NO_MEM)
        static let invalidArg = Self(ESP_ERR_INVALID_ARG)
        static let invalidState = Self(ESP_ERR_INVALID_STATE)
        static let invalidSize = Self(ESP_ERR_INVALID_SIZE)
        static let notFound = Self(ESP_ERR_NOT_FOUND)
        static let notSupported = Self(ESP_ERR_NOT_SUPPORTED)
        static let timeout = Self(ESP_ERR_TIMEOUT)
        static let invalidResponse = Self(ESP_ERR_INVALID_RESPONSE)
        static let invalidCrc = Self(ESP_ERR_INVALID_CRC)
        static let invalidVersion = Self(ESP_ERR_INVALID_VERSION)
        static let invalidMac = Self(ESP_ERR_INVALID_MAC)
        static let notFinished = Self(ESP_ERR_NOT_FINISHED)
        static let notAllowed = Self(ESP_ERR_NOT_ALLOWED)

        static let wifiBase = Self(ESP_ERR_WIFI_BASE)
        static let meshBase = Self(ESP_ERR_MESH_BASE)
        static let flashBase = Self(ESP_ERR_FLASH_BASE)
        static let hwCryptoBase = Self(ESP_ERR_HW_CRYPTO_BASE)
        static let memprotBase = Self(ESP_ERR_MEMPROT_BASE)

        static func check(_ result: esp_err_t) throws(IDF.Error) {
            if result != ESP_OK {
                throw IDF.Error(result)
            }
        }
        static func check(_ result: Self) throws(IDF.Error) {
            try check(result.rawValue)
        }

        var description: String {
            String(cString: esp_err_to_name(rawValue))
        }
    }

    struct ResourcePool {
        let max: UInt32
        var used: UInt32 = 0
        init(max: UInt32) {
            self.max = max
        }

        mutating func take(_ value: UInt32? = nil) -> UInt32 {
            if let value = value {
                if value >= max {
                    fatalError("Resource out of range")
                }
                if used & (1 << value) != 0 {
                    fatalError("Resource already taken")
                }
                used |= (1 << value)
                return value
            } else {
                for i in 0..<max {
                    if used & (1 << i) == 0 {
                        used |= (1 << i)
                        return i
                    }
                }
                fatalError("No more resources available")
            }
        }

        mutating func give(_ value: UInt32) {
            if (used & (1 << value)) == 0 {
                fatalError("Resource is not taken")
            }
            used &= ~(1 << value)
        }
    }
}

extension Comparable {
    func clamp(minValue: Self, maxValue: Self) -> Self {
        min(max(minValue, self), maxValue)
    }
}
