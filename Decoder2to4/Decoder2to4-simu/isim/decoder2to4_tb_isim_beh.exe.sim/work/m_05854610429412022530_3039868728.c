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
static const char *ng0 = "/home/ise/Verilog_project/Chapter_4/Decoder2to4/decoder2to4_tb.v";
static const char *ng1 = "decoder2to4_tb.vcd";
static int ng2[] = {0, 0};
static int ng3[] = {4, 0};
static int ng4[] = {1, 0};



static void Initial_11_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(11, ng0);

LAB4:    xsi_set_current_line(12, ng0);
    xsi_vcd_dumpfile(ng1);
    xsi_set_current_line(13, ng0);
    t2 = ((char*)((ng2)));
    xsi_vcd_dumpvars_args(*((unsigned int *)t2), t0, (char)109, t0, (char)101);
    xsi_set_current_line(14, ng0);
    xsi_set_current_line(14, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB5:    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t4, 32, t5, 32);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(18, ng0);
    xsi_vlog_finish(1);

LAB1:    return;
LAB6:    xsi_set_current_line(14, ng0);

LAB8:    xsi_set_current_line(15, ng0);
    t13 = (t0 + 1608);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t0 + 1448);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 2);
    xsi_set_current_line(16, ng0);
    t2 = (t0 + 2328);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB9;
    goto LAB1;

LAB9:    xsi_set_current_line(14, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t4, 32, t5, 32);
    t7 = (t0 + 1608);
    xsi_vlogvar_assign_value(t7, t6, 0, 0, 32);
    goto LAB5;

}


extern void work_m_05854610429412022530_3039868728_init()
{
	static char *pe[] = {(void *)Initial_11_0};
	xsi_register_didat("work_m_05854610429412022530_3039868728", "isim/decoder2to4_tb_isim_beh.exe.sim/work/m_05854610429412022530_3039868728.didat");
	xsi_register_executes(pe);
}
