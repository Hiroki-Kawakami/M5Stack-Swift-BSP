extension IDF {
    class PPAClient {
        let client: ppa_client_handle_t

        enum Operation {
            case srm
            case blend
            case fill

            fileprivate var value: ppa_operation_t {
                switch self {
                case .srm: PPA_OPERATION_SRM
                case .blend: PPA_OPERATION_BLEND
                case .fill: PPA_OPERATION_FILL
                }
            }
        }

        typealias SRMColorMode = ppa_srm_color_mode_t;
        typealias FillColorMode = ppa_fill_color_mode_t;

        init(operType: Operation) throws(IDF.Error) {
            var client: ppa_client_handle_t?
            var config = ppa_client_config_t()
            config.oper_type = operType.value
            try IDF.Error.check(ppa_register_client(&config, &client))
            self.client = client!
        }

        func srm(
            input: (buffer: UnsafeRawBufferPointer, size: Size, block: Rect?, colorMode: SRMColorMode),
            output: (buffer: UnsafeMutableRawBufferPointer, size: Size, offset: Point, scale: Float, colorMode: SRMColorMode),
            rotate: Int = 0,
        ) throws(IDF.Error) {
            var config = ppa_srm_oper_config_t()
            config.in.buffer = input.buffer.baseAddress
            config.in.pic_w = UInt32(input.size.width)
            config.in.pic_h = UInt32(input.size.height)
            config.in.block_w = UInt32(input.block?.size.width ?? input.size.width)
            config.in.block_h = UInt32(input.block?.size.height ?? input.size.height)
            config.in.block_offset_x = UInt32(input.block?.origin.x ?? 0)
            config.in.block_offset_y = UInt32(input.block?.origin.y ?? 0)
            config.in.srm_cm = input.colorMode
            config.out.buffer = output.buffer.baseAddress
            config.out.buffer_size = UInt32(output.buffer.count)
            config.out.pic_w = UInt32(output.size.width)
            config.out.pic_h = UInt32(output.size.height)
            config.out.block_offset_x = UInt32(output.offset.x)
            config.out.block_offset_y = UInt32(output.offset.y)
            config.out.srm_cm = output.colorMode
            config.rotation_angle = rotate == 90  ? PPA_SRM_ROTATION_ANGLE_90  : rotate == 180 ? PPA_SRM_ROTATION_ANGLE_180 :
                                    rotate == 270 ? PPA_SRM_ROTATION_ANGLE_270 : PPA_SRM_ROTATION_ANGLE_0
            config.scale_x = output.scale
            config.scale_y = output.scale
            try IDF.Error.check(ppa_do_scale_rotate_mirror(client, &config))
        }

        func srm(
            input: (buffer: UnsafeRawBufferPointer, size: Size, block: Rect?, colorMode: SRMColorMode),
            output: (buffer: UnsafeMutableRawBufferPointer, size: Size, block: Rect?, colorMode: SRMColorMode),
            rotate: Int = 0,
        ) throws(IDF.Error) {
            var config = ppa_srm_oper_config_t()
            config.in.buffer = input.buffer.baseAddress
            config.in.pic_w = UInt32(input.size.width)
            config.in.pic_h = UInt32(input.size.height)
            config.in.block_w = UInt32(input.block?.size.width ?? input.size.width)
            config.in.block_h = UInt32(input.block?.size.height ?? input.size.height)
            config.in.block_offset_x = UInt32(input.block?.origin.x ?? 0)
            config.in.block_offset_y = UInt32(input.block?.origin.y ?? 0)
            config.in.srm_cm = input.colorMode
            config.out.buffer = output.buffer.baseAddress
            config.out.buffer_size = UInt32(output.buffer.count)
            config.out.pic_w = UInt32(output.size.width)
            config.out.pic_h = UInt32(output.size.height)
            config.out.block_offset_x = UInt32(output.block?.origin.x ?? 0)
            config.out.block_offset_y = UInt32(output.block?.origin.y ?? 0)
            config.out.srm_cm = output.colorMode
            config.rotation_angle = rotate == 90  ? PPA_SRM_ROTATION_ANGLE_90  : rotate == 180 ? PPA_SRM_ROTATION_ANGLE_180 :
                                    rotate == 270 ? PPA_SRM_ROTATION_ANGLE_270 : PPA_SRM_ROTATION_ANGLE_0
            config.scale_x = rotate == 90 || rotate == 270 ?
                Float(output.block?.size.width ?? output.size.width) / Float(input.block?.size.height ?? input.size.height) :
                Float(output.block?.size.width ?? output.size.width) / Float(input.block?.size.width ?? input.size.width)
            config.scale_y = rotate == 90 || rotate == 270 ?
                Float(output.block?.size.height ?? output.size.height) / Float(input.block?.size.width ?? input.size.width) :
                Float(output.block?.size.height ?? output.size.height) / Float(input.block?.size.height ?? input.size.height)
            try IDF.Error.check(ppa_do_scale_rotate_mirror(client, &config))
        }

        func fill(
            output: (buffer: UnsafeMutableRawBufferPointer, size: Size, colorMode: FillColorMode),
            rect: Rect, color: Color,
        ) throws(IDF.Error) {
            var config = ppa_fill_oper_config_t()
            config.out.buffer = output.buffer.baseAddress
            config.out.buffer_size = UInt32(output.buffer.count)
            config.out.pic_w = UInt32(output.size.width)
            config.out.pic_h = UInt32(output.size.height)
            config.out.block_offset_x = UInt32(rect.origin.x)
            config.out.block_offset_y = UInt32(rect.origin.y)
            config.out.fill_cm = output.colorMode
            config.fill_block_w = UInt32(rect.width)
            config.fill_block_h = UInt32(rect.height)
            config.fill_argb_color.a = 0
            config.fill_argb_color.r = UInt32(color.red)
            config.fill_argb_color.g = UInt32(color.green)
            config.fill_argb_color.b = UInt32(color.blue)
            try IDF.Error.check(ppa_do_fill(client, &config))
        }
    }
}

extension ppa_srm_color_mode_t {
    static let argb8888 = PPA_SRM_COLOR_MODE_ARGB8888
    static let rgb888 = PPA_SRM_COLOR_MODE_RGB888
    static let rgb565 = PPA_SRM_COLOR_MODE_RGB565
    static let yuv420 = PPA_SRM_COLOR_MODE_YUV420
    static let yuv444 = PPA_SRM_COLOR_MODE_YUV444
}
extension ppa_fill_color_mode_t {
    static let argb8888 = PPA_FILL_COLOR_MODE_ARGB8888
    static let rgb888 = PPA_FILL_COLOR_MODE_RGB888
    static let rgb565 = PPA_FILL_COLOR_MODE_RGB565
}
