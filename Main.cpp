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
        default:
            return ErrorCode::SyscallNotImplemented;
    }
}
