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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/CPU/ALU.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {8U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {7U, 0U};
static unsigned int ng6[] = {6U, 0U};
static unsigned int ng7[] = {4U, 0U};
static unsigned int ng8[] = {1U, 0U};
static unsigned int ng9[] = {5U, 0U};
static unsigned int ng10[] = {13U, 0U};



static void NetDecl_16_0(char *t0)
{
    char t3[8];
    char t4[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    t1 = (t0 + 4688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 2728U);
    t5 = *((char **)t2);
    memset(t4, 0, 8);
    t2 = (t5 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t12);
    t15 = (t13 || t14);
    if (t15 > 0)
        goto LAB8;

LAB9:    t18 = *((unsigned int *)t4);
    t19 = (~(t18));
    t20 = *((unsigned int *)t12);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t22, 8);

LAB16:    t16 = (t0 + 5352);
    t23 = (t16 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t3, 8);
    xsi_driver_vfirst_trans(t16, 0, 31U);
    t27 = (t0 + 5256);
    *((int *)t27) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 3048U);
    t17 = *((char **)t16);
    goto LAB9;

LAB10:    t16 = (t0 + 2888U);
    t22 = *((char **)t16);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t17, 32, t22, 32);
    goto LAB16;

LAB14:    memcpy(t3, t17, 8);
    goto LAB16;

}

static void Always_30_1(char *t0)
{
    char t8[8];
    char t9[16];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    int t32;
    int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;

LAB0:    t1 = (t0 + 4936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 5272);
    *((int *)t2) = 1;
    t3 = (t0 + 4968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2408U);
    t3 = *((char **)t2);

LAB6:    t2 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t3, 4, t2, 4);
    if (t6 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(64, ng0);

LAB49:    xsi_set_current_line(65, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 32, 0LL);

LAB29:    goto LAB2;

LAB7:    xsi_set_current_line(34, ng0);

LAB30:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t5, 32, t7, 32);
    t4 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t4, t8, 0, 0, 32, 0LL);
    goto LAB29;

LAB9:    xsi_set_current_line(37, ng0);

LAB31:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    xsi_vlog_unsigned_minus(t9, 33, t5, 32, t7, 32);
    t4 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);
    t10 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t10, t9, 32, 0, 1, 0LL);
    goto LAB29;

LAB11:    xsi_set_current_line(40, ng0);

LAB32:    xsi_set_current_line(41, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    xsi_vlog_unsigned_minus(t9, 33, t5, 32, t7, 32);
    t4 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);
    t10 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t10, t9, 32, 0, 1, 0LL);
    goto LAB29;

LAB13:    xsi_set_current_line(43, ng0);

LAB33:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    xsi_vlog_unsigned_minus(t9, 33, t5, 32, t7, 32);
    t4 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t4, t9, 0, 0, 32, 0LL);
    t10 = (t0 + 3608);
    xsi_vlogvar_wait_assign_value(t10, t9, 32, 0, 1, 0LL);
    goto LAB29;

LAB15:    xsi_set_current_line(46, ng0);

LAB34:    xsi_set_current_line(47, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    t11 = *((unsigned int *)t5);
    t12 = *((unsigned int *)t7);
    t13 = (t11 & t12);
    *((unsigned int *)t8) = t13;
    t4 = (t5 + 4);
    t10 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t10);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB35;

LAB36:
LAB37:    t40 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t40, t8, 0, 0, 32, 0LL);
    goto LAB29;

LAB17:    xsi_set_current_line(49, ng0);

LAB38:    xsi_set_current_line(50, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    t11 = *((unsigned int *)t5);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t8) = t13;
    t4 = (t5 + 4);
    t10 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t10);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB39;

LAB40:
LAB41:    t40 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t40, t8, 0, 0, 32, 0LL);
    goto LAB29;

LAB19:    xsi_set_current_line(52, ng0);

LAB42:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    t11 = *((unsigned int *)t5);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    *((unsigned int *)t8) = t13;
    t4 = (t5 + 4);
    t10 = (t7 + 4);
    t14 = (t8 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t10);
    t17 = (t15 | t16);
    *((unsigned int *)t14) = t17;
    t18 = *((unsigned int *)t14);
    t19 = (t18 != 0);
    if (t19 == 1)
        goto LAB43;

LAB44:
LAB45:    t22 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t22, t8, 0, 0, 32, 0LL);
    goto LAB29;

LAB21:    xsi_set_current_line(55, ng0);

LAB46:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    memset(t8, 0, 8);
    t4 = (t8 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t10);
    t15 = (t13 >> 0);
    *((unsigned int *)t4) = t15;
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t16 & 31U);
    t17 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t17 & 31U);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_lshift(t41, 32, t5, 32, t8, 5);
    t14 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t14, t41, 0, 0, 32, 0LL);
    goto LAB29;

LAB23:    xsi_set_current_line(58, ng0);

LAB47:    xsi_set_current_line(59, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    memset(t8, 0, 8);
    t4 = (t8 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t10);
    t15 = (t13 >> 0);
    *((unsigned int *)t4) = t15;
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t16 & 31U);
    t17 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t17 & 31U);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_rshift(t41, 32, t5, 32, t8, 5);
    t14 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t14, t41, 0, 0, 32, 0LL);
    goto LAB29;

LAB25:    xsi_set_current_line(61, ng0);

LAB48:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = (t0 + 3208U);
    t7 = *((char **)t4);
    memset(t8, 0, 8);
    t4 = (t8 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t8) = t12;
    t13 = *((unsigned int *)t10);
    t15 = (t13 >> 0);
    *((unsigned int *)t4) = t15;
    t16 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t16 & 31U);
    t17 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t17 & 31U);
    memset(t41, 0, 8);
    xsi_vlog_unsigned_arith_rshift(t41, 32, t5, 32, t8, 5);
    t14 = (t0 + 3768);
    xsi_vlogvar_wait_assign_value(t14, t41, 0, 0, 32, 0LL);
    goto LAB29;

LAB35:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    t22 = (t5 + 4);
    t23 = (t7 + 4);
    t24 = *((unsigned int *)t5);
    t25 = (~(t24));
    t26 = *((unsigned int *)t22);
    t27 = (~(t26));
    t28 = *((unsigned int *)t7);
    t29 = (~(t28));
    t30 = *((unsigned int *)t23);
    t31 = (~(t30));
    t32 = (t25 & t27);
    t33 = (t29 & t31);
    t34 = (~(t32));
    t35 = (~(t33));
    t36 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t36 & t34);
    t37 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t37 & t35);
    t38 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t38 & t34);
    t39 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t39 & t35);
    goto LAB37;

LAB39:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    t22 = (t5 + 4);
    t23 = (t7 + 4);
    t24 = *((unsigned int *)t22);
    t25 = (~(t24));
    t26 = *((unsigned int *)t5);
    t32 = (t26 & t25);
    t27 = *((unsigned int *)t23);
    t28 = (~(t27));
    t29 = *((unsigned int *)t7);
    t33 = (t29 & t28);
    t30 = (~(t32));
    t31 = (~(t33));
    t34 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t34 & t30);
    t35 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t35 & t31);
    goto LAB41;

LAB43:    t20 = *((unsigned int *)t8);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t8) = (t20 | t21);
    goto LAB45;

}


extern void work_m_00000000002099515460_0886308060_init()
{
	static char *pe[] = {(void *)NetDecl_16_0,(void *)Always_30_1};
	xsi_register_didat("work_m_00000000002099515460_0886308060", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000002099515460_0886308060.didat");
	xsi_register_executes(pe);
}
