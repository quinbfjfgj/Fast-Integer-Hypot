const std = @import("std");

fn wfabs(x: i32, y: i32) i32 {
    const mx = x >> 31;
    const my = y >> 31;
    const ax: u32 = @bitCast((x ^ mx) -% mx);
    const ay: u32 = @bitCast((y ^ my) -% my);
    const s = ax + ay;
    const max_val = if (ax > ay) ax else ay;
    const m_scaled = (max_val * 1614) >> 10;
    const m = if (s > m_scaled) s else m_scaled;
    return @intCast(((s << 9) + (m * 946)) >> 11);
}
// W FABS?
