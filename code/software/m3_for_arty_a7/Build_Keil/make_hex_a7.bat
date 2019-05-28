@REM -----------------------------------------------------------------------------
@REM  The confidential and proprietary information contained in this file may
@REM  only be used by a person authorised under and to the extent permitted
@REM  by a subsisting licensing agreement from ARM limited.
@REM
@REM             (C) COPYRIGHT 2018 ARM limited.
@REM                 ALL RIGHTS RESERVED
@REM
@REM  This entire notice must be reproduced on all copies of this file
@REM  and copies of this file may only be made by a person if such person is
@REM  permitted to do so under the terms of a subsisting license agreement
@REM  from ARM limited.
@REM
@REM       SVN Information
@REM
@REM       Checked In          : $Date$
@REM
@REM       Revision            : $Revision$
@REM
@REM       Release Information : Cortex-M3 DesignStart-r0p0-00rel0
@REM
@REM -----------------------------------------------------------------------------
@REM  Project : Cortex-M1 Arty A7 Example design with V2C-DAPLink adaptor board
@REM
@REM  Purpose : Convert axf file to hex for both BRAM and QSPI simulation models
@REM            Also convert axf file to elf for bitstream generation
@REM -----------------------------------------------------------------------------

@REM - Create the output files.
@REM - File to load into FPGA RAM
call fromelf --vhx --32x1 --output bram_a7.hex objects\m3_for_arty_a7.axf
@REM - File to merge SW into bitstream
call fromelf --elf        --output bram_a7.elf objects\m3_for_arty_a7.axf
@REM - File to load into DAPLink QSPI simulation
call fromelf --vhx --8x1  --output qspi_a7.hex objects\m3_for_arty_a7.axf
@REM - Files to load onto DAPLink QSPI board
call fromelf --bin        --output qspi_a7.bin objects\m3_for_arty_a7.axf

@REM - Copy the files to the relevant directories of the hardware project
copy bram_a7.* ..\..\..\hardware\m3_for_arty_a7\m3_for_arty_a7
copy qspi_a7.hex ..\..\..\hardware\m3_for_arty_a7\testbench




