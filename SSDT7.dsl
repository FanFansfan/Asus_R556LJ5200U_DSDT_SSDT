/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20150930-64
 * Copyright (c) 2000 - 2015 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT7.aml, Fri Oct 23 18:40:38 2015
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000394 (916)
 *     Revision         0x02
 *     Checksum         0xB1
 *     OEM ID           "CppcTa"
 *     OEM Table ID     "CppcTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120913 (538052883)
 */
DefinitionBlock ("SSDT7.aml", "SSDT", 2, "CppcTa", "CppcTabl", 0x00001000)
{

    /*
     * External declarations that were imported from
     * the reference file [refs.txt]
     */
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // 2 Arguments

    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CPU0._PPC, IntObj)
    External (_PR_.CPU0._PSS, PkgObj)
    External (_PR_.CPU0._TSS, IntObj)
    External (_PR_.CPU1, ProcessorObj)
    External (_PR_.CPU2, ProcessorObj)
    External (_PR_.CPU3, ProcessorObj)
    External (_PR_.CPU4, ProcessorObj)
    External (_PR_.CPU5, ProcessorObj)
    External (_PR_.CPU6, ProcessorObj)
    External (_PR_.CPU7, ProcessorObj)
    External (OSYS, FieldUnitObj)
    External (PDC0, IntObj)
    External (TCNT, FieldUnitObj)

    Scope (\_SB)
    {
        Device (PCCD)
        {
            Name (PCCA, 0x99743018)
            Name (PCCS, 0x00001000)
            Name (PENB, 0x00000001)
            Name (_HID, EisaId ("INT340F"))  // _HID: Hardware ID
            Name (_STR, Unicode ("Collaborative Processor Performance Control (CPPC)"))  // _STR: Description String
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (LGreaterEqual (OSYS, 0x07DC))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (TMPP, Package (0x02)
            {
                0x80000000, 
                0x80000000
            })
            Method (PADR, 0, NotSerialized)
            {
                Store (PCCA, Index (TMPP, Zero))
                Store (PCCS, Index (TMPP, One))
                Return (TMPP) /* \_SB_.PCCD.TMPP */
            }

            Method (GPRN, 0, Serialized)
            {
                Name (T_0, Zero)  // _T_x: Emitted by ASL Compiler
                While (One)
                {
                    Store (ToInteger (\TCNT), T_0) /* \_SB_.PCCD.GPRN.T_0 */
                    If (LEqual (T_0, 0x08))
                    {
                        Notify (\_PR.CPU0, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU1, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU2, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU3, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU4, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU5, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU6, 0x83) // Device-Specific Change
                        Notify (\_PR.CPU7, 0x83) // Device-Specific Change
                    }
                    Else
                    {
                        If (LEqual (T_0, 0x04))
                        {
                            Notify (\_PR.CPU0, 0x83) // Device-Specific Change
                            Notify (\_PR.CPU1, 0x83) // Device-Specific Change
                            Notify (\_PR.CPU2, 0x83) // Device-Specific Change
                            Notify (\_PR.CPU3, 0x83) // Device-Specific Change
                        }
                        Else
                        {
                            If (LEqual (T_0, 0x02))
                            {
                                Notify (\_PR.CPU0, 0x83) // Device-Specific Change
                                Notify (\_PR.CPU1, 0x83) // Device-Specific Change
                            }
                            Else
                            {
                                Notify (\_PR.CPU0, 0x83) // Device-Specific Change
                            }
                        }
                    }

                    Break
                }
            }

            Name (PCFG, Zero)
            Method (_PTC, 0, NotSerialized)  // _PTC: Processor Throttling Control
            {
                If (LAnd (CondRefOf (\PDC0), LNotEqual (\PDC0, 0x80000000)))
                {
                    If (And (\PDC0, 0x04))
                    {
                        Return (Package (0x02)
                        {
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x05,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000001810, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemIO, 
                                    0x05,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000001810, // Address
                                    ,)
                            }
                        })
                    }
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }
                    })
                }
            }

            Method (_PSS, 0, NotSerialized)  // _PSS: Performance Supported States
            {
                If (CondRefOf (\_PR.CPU0._PSS))
                {
                    Return (\_PR.CPU0._PSS) /* External reference */
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        Package (0x06)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x06)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    })
                }
            }

            Method (_PPC, 0, NotSerialized)  // _PPC: Performance Present Capabilities
            {
                If (CondRefOf (\_PR.CPU0._PPC))
                {
                    Return (\_PR.CPU0._PPC) /* External reference */
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_TSS, 0, NotSerialized)  // _TSS: Throttling Supported States
            {
                If (CondRefOf (\_PR.CPU0._TSS))
                {
                    Return (\_PR.CPU0._TSS) /* External reference */
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        Package (0x05)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }, 

                        Package (0x05)
                        {
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero, 
                            Zero
                        }
                    })
                }
            }
        }
    }
}

