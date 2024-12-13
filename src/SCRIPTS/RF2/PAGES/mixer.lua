local template = assert(rf2.loadScript(rf2.radio.template))()
local margin = template.margin
local indent = template.indent
local lineSpacing = template.lineSpacing
local tableSpacing = template.tableSpacing
local sp = template.listSpacing.field
local yMinLim = rf2.radio.yMinLimit
local x = margin
local y = yMinLim - lineSpacing
local inc = { x = function(val) x = x + val return x end, y = function(val) y = y + val return y end }
local labels = {}
local fields = {}

labels[#labels + 1] = { t = "Swashplate",               x = x,          y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Geo correction",           x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = -125,  max = 125,  vals = { 19 }, scale = 5,      id = "mixerCollectiveGeoCorrection" }
fields[#fields + 1] = { t = "Total pitch limit",        x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = 0,     max = 3000, vals = { 10, 11 }, scale = 83.33333333333333, mult = 8.3333333333333, id = "mixerTotalPitchLimit" }
fields[#fields + 1] = { t = "Phase angle",              x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = -1800, max = 1800, vals = { 8, 9 }, scale = 10, mult = 5, id = "mixerSwashPhase" }
fields[#fields + 1] = { t = "TTA precomp",              x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = 0,     max = 250,  vals = { 18 } }

inc.y(lineSpacing * 0.25)
labels[#labels + 1] = { t = "Swashplate Link Trims",    x = x,          y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Roll trim %",              x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = -1000, max = 1000, vals = { 12, 13 }, scale = 10, id = "mixerSwashRollTrim" }
fields[#fields + 1] = { t = "Pitch trim %",             x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = -1000, max = 1000, vals = { 14, 15 }, scale = 10, id = "mixerSwashPitchTrim" }
fields[#fields + 1] = { t = "Coll. trim %",             x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = -1000, max = 1000, vals = { 16, 17 }, scale = 10, id = "mixerSwashCollectiveTrim" }

inc.y(lineSpacing * 0.25)
labels[#labels + 1] = { t = "Motorised Tail",           x = x,          y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Motor idle thr%",          x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = 0,     max = 250,  vals = { 3 }, scale = 10,      id = "mixerTailMotorIdle" }
fields[#fields + 1] = { t = "Center trim",              x = x + indent, y = inc.y(lineSpacing), sp = x + sp, min = -500,  max = 500,  vals = { 4,5 }, scale = 10,    id = "mixerTailRotorCenterTrim" }

inc.y(lineSpacing * 0.25)
labels[#labels + 1] = { t = "Adv Mix Coll.",     x = x,          y = inc.y(lineSpacing) }
labels[#labels + 1] = { t = "Dir. A (Negative)", x = x + sp,     y = y }
labels[#labels + 1] = { t = "Dir. B (Positive)", x = x + 2 * sp, y = y }
fields[#fields + 1] = { t = "Coll. to Roll",  x = x + indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 20 } }
fields[#fields + 1] = {                       x = x + indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 21 } }
fields[#fields + 1] = { t = "Coll. to Pitch", x = x + indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 22 } }
fields[#fields + 1] = {                       x = x + indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 23 } }

inc.y(lineSpacing * 0.25)
labels[#labels + 1] = { t = "Adv Mix Cyclic->Cyclic",  x = x,          y = inc.y(lineSpacing) }
labels[#labels + 1] = { t = "Dir. A (Left/Backward)",   x = x + sp,     y = y }
labels[#labels + 1] = { t = "Dir. B (Right/Forward)", x = x + 2 * sp, y = y }

labels[#labels + 1] = { t = "Roll to Pitch",  x = x + indent,     y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Positive Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 26 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 29 } }
fields[#fields + 1] = { t = "Center Coll.",   x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 25 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 28 } }
fields[#fields + 1] = { t = "Negative Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 24 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 27 } }

labels[#labels + 1] = { t = "Pitch to Roll",  x = x + indent,     y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Positive Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 38 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 41 } }
fields[#fields + 1] = { t = "Center Coll.",   x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 37 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 40 } }
fields[#fields + 1] = { t = "Negative Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 36 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 39 } }

inc.y(lineSpacing * 0.25)
labels[#labels + 1] = { t = "Adv Mix Cyclic->Coll",    x = x,          y = inc.y(lineSpacing) }
labels[#labels + 1] = { t = "Dir. A (Left/Backward)",   x = x + sp,     y = y }
labels[#labels + 1] = { t = "Dir. B (Right/Forward)", x = x + 2 * sp, y = y }

labels[#labels + 1] = { t = "Roll to Coll.",  x = x + indent,     y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Positive Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 32 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 35 } }
fields[#fields + 1] = { t = "Center Coll.",   x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 31 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 34 } }
fields[#fields + 1] = { t = "Negative Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 30 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 33 } }

labels[#labels + 1] = { t = "Pitch to Coll.", x = x + indent,     y = inc.y(lineSpacing) }
fields[#fields + 1] = { t = "Positive Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 44 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 47 } }
fields[#fields + 1] = { t = "Center Coll.",   x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 43 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 46 } }
fields[#fields + 1] = { t = "Negative Coll.", x = x + 2 * indent, y = inc.y(lineSpacing), sp = x + sp,     min = -125, max = 125, vals = { 42 } }
fields[#fields + 1] = {                       x = x + 2 * indent, y = y,                  sp = x + 2 * sp, min = -125, max = 125, vals = { 45 } }

return {
    read        = 42, -- MSP_MIXER_CONFIG
    write       = 43, -- MSP_SET_MIXER_CONFIG
    eepromWrite = true,
    reboot      = false,
    title       = "Mixer",
    minBytes    = 47,
    labels      = labels,
    fields      = fields,
    simulatorResponse = { 0, 0, 0, 0, 0, 2, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
}
