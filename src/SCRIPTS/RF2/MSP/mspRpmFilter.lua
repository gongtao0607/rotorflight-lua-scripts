local function getRpmFilterConfig(callback, callbackParam)
    local message = {
        command = 120, -- MSP_SERVO_CONFIGURATIONS
        processReply = function(self, buf)
            local servoCount = rf2.mspHelper.readU8(buf)
            --rf2.print("Servo count "..tostring(servoCount))
            local configs = {}
            for i = 0, servoCount-1 do
                local config = {}
                config.mid = { value = rf2.mspHelper.readU16(buf), min = 50,    max = 2250 }
                config.min = { value = rf2.mspHelper.readS16(buf), min = -1000, max = 1000 }
                config.max = { value = rf2.mspHelper.readS16(buf), min = -1000, max = 1000 }
                config.scaleNeg = { value = rf2.mspHelper.readU16(buf), min = 100, max = 1000 }
                config.scalePos = { value = rf2.mspHelper.readU16(buf), min = 100, max = 1000 }
                config.rate = { value = rf2.mspHelper.readU16(buf), min = 50, max = 5000 }
                config.speed = { value = rf2.mspHelper.readU16(buf), min = 0, max = 60000 }
                config.flags = { value = rf2.mspHelper.readU16(buf), min = 0, max = 3 }
                configs[i] = config
            end
            callback(callbackParam, configs)
        end,
        simulatorResponse = {
            2,
            220, 5, 68, 253, 188, 2, 244, 1, 244, 1, 77, 1, 0, 0, 0, 0,
            221, 5, 68, 253, 188, 2, 244, 1, 244, 1, 77, 1, 0, 0, 0, 0
        }
    }
    rf2.mspQueue:add(message)
end

local function setRpmFilterConfig(rpmFilterAxis, rpmFilterConfig)
    local message = {
        command = 145, -- MSP_SET_RPM_FILTER
        payload = {}
    }
    
    local bank_idx = rpmFilterAxis * 16 --RPM_FILTER_BANK_COUNT
    if rpmFilterConfig.
    rf2.mspHelper.writeU8(message.payload, servoIndex)
    rf2.mspHelper.writeU16(message.payload, servoConfig.mid.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.min.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.max.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.scaleNeg.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.scalePos.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.rate.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.speed.value)
    rf2.mspHelper.writeU16(message.payload, servoConfig.flags.value)
    rf2.mspQueue:add(message)
end

return {
    getRpmFilterConfig = getRpmFilterConfig,
    setRpmFilterConfig = setRpmFilterConfig
}