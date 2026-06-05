/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/Verilog_project/Chapter_4/Decoder2to4/decoder2to4.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {1, 0};



static void Always_5_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    int t11;

LAB0:    t1 = (t0 + 2360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(5, ng0);
    t2 = (t0 + 2680);
    *((int *)t2) = 1;
    t3 = (t0 + 2392);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(5, ng0);

LAB5:    xsi_set_current_line(6, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 4);
    xsi_set_current_line(7, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1448);
    t4 = (t0 + 1448);
    t5 = (t4 + 72U);
    t7 = *((char **)t5);
    t8 = (t0 + 1048U);
    t9 = *((char **)t8);
    xsi_vlog_generic_convert_bit_index(t6, t7, 2, t9, 2, 2);
    t8 = (t6 + 4);
    t10 = *((unsigned int *)t8);
    t11 = (!(t10));
    if (t11 == 1)
        goto LAB6;

LAB7:    goto LAB2;

LAB6:    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t6), 1);
    goto LAB7;

}


extern void work_m_02031460810697686230_4129199223_init()
{
	static char *pe[] = {(void *)Always_5_0};
	xsi_register_didat("work_m_02031460810697686230_4129199223", "isim/decoder2to4_tb_isim_beh.exe.sim/work/m_02031460810697686230_4129199223.didat");
	xsi_register_executes(pe);
}
