K /*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20150930-64
 * Copyright (c) 2000 - 2015 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT5.aml, Fri Oct 23 18:40:38 2015
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000041 (65)
 *     Revision         0x01
 *     Checksum         0xD6
 *     OEM ID           "Ssdt"
 *     OEM Table ID     "PttSsdt"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)
 */
DefinitionBlock ("SSDT5.aml", "SSDT", 1, "Ssdt", "PttSsdt", 0x00001000)
{

    /*
     * External declarations that were imported from
     * the reference file [refs.txt]
     */
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // 2 Arguments


    OperationRegion (FTNV, SystemMemory, 0x98E1BE98, 0x0008)
    Field (FTNV, AnyAcc, Lock, Preserve)
    {
        CRBI,   64
    }
}

