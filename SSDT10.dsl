/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20150930-64
 * Copyright (c) 2000 - 2015 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT10.aml, Fri Oct 23 18:40:38 2015
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000067C (1660)
 *     Revision         0x02
 *     Checksum         0x55
 *     OEM ID           "SgRef"
 *     OEM Table ID     "SgPch"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)
 */
DefinitionBlock ("SSDT10.aml", "SSDT", 2, "SgRef", "SgPch", 0x00001000)
{

    /*
     * External declarations that were imported from
     * the reference file [refs.txt]
     */
    

    External (_SB_.PCI0.LPCB.EC0_.RRAM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.WRAM, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.RP05, DeviceObj)
    External (_SB_.PCI0.RP05.PEGP.NHDA, FieldUnitObj)
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // 2 Arguments
    External (\_SB.PCI0.RP05.PEGP._OFF, MethodObj)
    External (DLHR, FieldUnitObj)
    External (DLPW, FieldUnitObj)
    External (EBAS, FieldUnitObj)
    External (EECP, FieldUnitObj)
    External (GBAS, FieldUnitObj)
    External (GPRW, MethodObj)    // 2 Arguments
    External (HLRS, FieldUnitObj)
    External (HYSS, FieldUnitObj)
    External (OSYS, FieldUnitObj)
    External (PWEN, FieldUnitObj)
    External (RPA4, FieldUnitObj)
    External (SGGP, FieldUnitObj)
    External (SGMD, FieldUnitObj)
    External (XBAS, FieldUnitObj)

    Scope (\_SB.PCI0.RP05)
    {
        OperationRegion (MSID, SystemMemory, EBAS, 0x50)
        Field (MSID, DWordAcc, Lock, Preserve)
        {
            VEID,   16, 
            Offset (0x40), 
            NVID,   32, 
            Offset (0x4C), 
            ATID,   32
        }

        OperationRegion (RPCX, SystemMemory, Add (Add (\XBAS, 0x000E0000), ShiftLeft (And (\RPA4, 0x0F), 0x0C
            )), 0x1000)
        Field (RPCX, DWordAcc, NoLock, Preserve)
        {
            PVID,   16, 
            PDID,   16, 
            CMDR,   8, 
            Offset (0x19), 
            Offset (0x4A), 
            CEDR,   1, 
            Offset (0x50), 
            ASPM,   2, 
                ,   2, 
            LNKD,   1, 
            Offset (0x69), 
                ,   2, 
            LREN,   1, 
            Offset (0xA4), 
            D0ST,   2, 
            Offset (0x328), 
                ,   19, 
            LNKS,   4
        }

        PowerResource (PC05, 0x00, 0x0000)
        {
            Name (_STA, One)  // _STA: Status
            Method (_ON, 0, Serialized)  // _ON_: Power On
            {
                If (LNotEqual (OSYS, 0x07D9))
                {
                    \_SB.PCI0.RP05.PEGP.SGON ()
                    Store (0x07, CMDR) /* \_SB_.PCI0.RP05.CMDR */
                    Store (Zero, D0ST) /* \_SB_.PCI0.RP05.D0ST */
                    Store (Zero, \_SB.PCI0.RP05.PEGP.NHDA) /* External reference */
                    If (LEqual (VEID, 0x10DE))
                    {
                        Store (HYSS, NVID) /* \_SB_.PCI0.RP05.NVID */
                    }

                    If (LEqual (VEID, 0x1002))
                    {
                        Store (HYSS, ATID) /* \_SB_.PCI0.RP05.ATID */
                    }

                    Store (One, _STA) /* \_SB_.PCI0.RP05.PC05._STA */
                }
            }

            Method (_OFF, 0, Serialized)  // _OFF: Power Off
            {
                If (LNotEqual (OSYS, 0x07D9))
                {
                    \_SB.PCI0.RP05.PEGP.SGOF ()
                    Store (Zero, _STA) /* \_SB_.PCI0.RP05.PC05._STA */
                }
            }
        }

        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
        {
            PC05
        })
        Name (_PR2, Package (0x01)  // _PR2: Power Resources for D2
        {
            PC05
        })
        Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
        {
            PC05
        })
        Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
        {
            Return (0x04)
        }

        Device (PEGP)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x09, 0x04))
            }
        }

        Device (PEGA)
        {
            Name (_ADR, One)  // _ADR: Address
            OperationRegion (ACAP, PCI_Config, \EECP, 0x14)
            Field (ACAP, DWordAcc, NoLock, Preserve)
            {
                Offset (0x10), 
                LCT1,   16
            }

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                Return (GPRW (0x09, 0x04))
            }
        }
    }

    Scope (\_SB.PCI0.RP05.PEGP)
    {
        Name (IVID, 0xFFFF)
        Name (ELCT, Zero)
        Name (HVID, Zero)
        Name (HDID, Zero)
        Name (TCNT, Zero)
        Name (LDLY, 0x64)
        Name (LTRE, Zero)
        OperationRegion (PCIS, PCI_Config, Zero, 0xF0)
        Field (PCIS, AnyAcc, Lock, Preserve)
        {
            DVID,   16, 
            Offset (0x0B), 
            CBCC,   8, 
            Offset (0x2C), 
            SVID,   16, 
            SDID,   16
        }

        OperationRegion (PCAP, PCI_Config, \EECP, 0x14)
        Field (PCAP, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTL,   16
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (Zero, \_SB.PCI0.RP05.PEGP._ADR)
            \_SB.PCI0.RP05.PEGP._OFF ()
            
        }

        Method (SGON, 0, Serialized)
        {
            If (LEqual (CCHK (One), Zero))
            {
                Return (Zero)
            }

            SGPO (HLRS, One)
            SGPO (PWEN, One)
            Sleep (DLPW)
            SGPO (HLRS, Zero)
            Sleep (DLHR)
            Store (LTRE, LREN) /* \_SB_.PCI0.RP05.LREN */
            Store (One, CEDR) /* \_SB_.PCI0.RP05.CEDR */
            Store (Zero, LNKD) /* \_SB_.PCI0.RP05.LNKD */
            While (LLess (LNKS, 0x07))
            {
                Sleep (One)
            }

            Store (HVID, SVID) /* \_SB_.PCI0.RP05.PEGP.SVID */
            Store (HDID, SDID) /* \_SB_.PCI0.RP05.PEGP.SDID */
            Store (Zero, \_SB.PCI0.RP05.PEGP.NHDA) /* External reference */
            Or (And (ELCT, 0x43), And (LCTL, 0xFFBC), LCTL) /* \_SB_.PCI0.RP05.PEGP.LCTL */
            Or (And (ELCT, 0x43), And (\_SB.PCI0.RP05.PEGA.LCT1, 0xFFBC), \_SB.PCI0.RP05.PEGA.LCT1)
            \_SB.PCI0.LPCB.EC0.WRAM (0x052B, 0x9E)
            \_SB.PCI0.LPCB.EC0.WRAM (0x0520, 0x97)
            Store (\_SB.PCI0.LPCB.EC0.RRAM (0x0521), Local0)
            And (Local0, 0xCF, Local0)
            Or (Local0, 0x20, Local0)
            \_SB.PCI0.LPCB.EC0.WRAM (0x0521, Local0)
            Return (Zero)
        }

        Method (SGOF, 0, Serialized)
        {
            If (LEqual (CCHK (Zero), Zero))
            {
                Return (Zero)
            }

            Store (\_SB.PCI0.LPCB.EC0.RRAM (0x0521), Local0)
            And (Local0, 0xCF, Local0)
            \_SB.PCI0.LPCB.EC0.WRAM (0x0521, Local0)
            \_SB.PCI0.LPCB.EC0.WRAM (0x0520, 0x95)
            \_SB.PCI0.LPCB.EC0.WRAM (0x03A4, Zero)
            \_SB.PCI0.LPCB.EC0.WRAM (0x03A5, Zero)
            Store (LCTL, ELCT) /* \_SB_.PCI0.RP05.PEGP.ELCT */
            Store (SVID, HVID) /* \_SB_.PCI0.RP05.PEGP.HVID */
            Store (SDID, HDID) /* \_SB_.PCI0.RP05.PEGP.HDID */
            Store (LREN, LTRE) /* \_SB_.PCI0.RP05.PEGP.LTRE */
            Store (One, LNKD) /* \_SB_.PCI0.RP05.LNKD */
            While (LNotEqual (LNKS, Zero))
            {
                Sleep (One)
            }

            SGPO (HLRS, One)
            SGPO (PWEN, Zero)
            Return (Zero)
        }

        Method (SGST, 0, Serialized)
        {
            If (And (SGMD, 0x0F))
            {
                If (LNotEqual (SGGP, One))
                {
                    Return (0x0F)
                }

                If (LNotEqual (DVID, 0xFFFF))
                {
                    If (LEqual (CBCC, 0x03))
                    {
                        Return (0x0F)
                    }
                }

                Return (Zero)
            }

            If (LNotEqual (DVID, 0xFFFF))
            {
                Return (0x0F)
            }

            Return (Zero)
        }

        Method (SGPI, 1, Serialized)
        {
            If (And (SGMD, 0x0F))
            {
                If (LEqual (SGGP, One))
                {
                    ShiftRight (Arg0, 0x07, Local1)
                    And (Arg0, 0x7F, Arg0)
                    If (LLessEqual (Arg0, 0x5E))
                    {
                        Store (Add (Add (\GBAS, 0x0100), Multiply (Arg0, 0x08)), Local0)
                        OperationRegion (LGPI, SystemIO, Local0, 0x08)
                        Field (LGPI, ByteAcc, NoLock, Preserve)
                        {
                                ,   2, 
                            TEP0,   1, 
                                ,   27, 
                            TEP1,   1, 
                            TEP2,   1
                        }

                        If (LEqual (TEP0, One))
                        {
                            Store (TEP1, Local2)
                        }
                        Else
                        {
                            Store (TEP2, Local2)
                        }
                    }

                    If (LEqual (Local1, Zero))
                    {
                        Not (Local2, Local2)
                    }

                    Return (And (Local2, One))
                }
            }

            Return (Zero)
        }

        Method (SGPO, 2, Serialized)
        {
            If (And (SGMD, 0x0F))
            {
                If (LEqual (SGGP, One))
                {
                    ShiftRight (Arg0, 0x07, Local1)
                    And (Arg0, 0x7F, Arg0)
                    If (LEqual (Local1, Zero))
                    {
                        Not (Arg1, Arg1)
                    }

                    And (Arg1, One, Arg1)
                    If (LLessEqual (Arg0, 0x5E))
                    {
                        Store (Add (Add (\GBAS, 0x0100), Multiply (Arg0, 0x08)), Local0)
                        OperationRegion (LGPI, SystemIO, Local0, 0x08)
                        Field (LGPI, ByteAcc, NoLock, Preserve)
                        {
                                ,   31, 
                            TEMP,   1
                        }

                        Store (Arg1, TEMP) /* \_SB_.PCI0.RP05.PEGP.SGPO.TEMP */
                    }
                }
            }
        }

        Method (CCHK, 1, NotSerialized)
        {
            If (LEqual (PVID, IVID))
            {
                Return (Zero)
            }

            If (LEqual (Arg0, Zero))
            {
                If (LEqual (SGPI (PWEN), Zero))
                {
                    Return (Zero)
                }
            }
            Else
            {
                If (LEqual (Arg0, One))
                {
                    If (LEqual (SGPI (PWEN), One))
                    {
                        Return (Zero)
                    }
                }
            }

            Return (One)
        }
    }
}

