#include "easm.h"
#include "MipsDisplay.hpp"

extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];
    static MipsDisplay display;
    switch (v0)
    {
        case 100:
            display.RunEngine();
            return ErrorCode::Ok;
        case 103:
            display.Clear(regs[Register::a0]);
            return ErrorCode::Ok;
        case 102:
            display.Flush();
            return ErrorCode::Ok;
        case 101:
            display.SetPixel(regs[Register::a0],regs[Register::a1],regs[Register::a2]);
            return ErrorCode::Ok;
        default:
            return ErrorCode::SyscallNotImplemented;
    }
}
