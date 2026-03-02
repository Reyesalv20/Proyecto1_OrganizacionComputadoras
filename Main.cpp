#include "easm.h"

extern "C" ErrorCode handleSyscall(uint32_t *regs, void *mem, MemoryMap *mem_map)
{
    unsigned v0 = regs[Register::v0];

    switch (v0)
    {
        default:
            return ErrorCode::SyscallNotImplemented;
    }
}
