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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/GPIO/GPIOBusInterface.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};



static void Initial_24_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(24, ng0);

LAB2:    xsi_set_current_line(25, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(26, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Always_43_1(char *t0)
{
    char t21[8];
    char t35[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    int t19;
    char *t20;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;

LAB0:    t1 = (t0 + 5536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5856);
    *((int *)t2) = 1;
    t3 = (t0 + 5568);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1888U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(47, ng0);

LAB9:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 2528U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (~(t11));
    t13 = *((unsigned int *)t5);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB10;

LAB11:
LAB12:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB31;

LAB32:
LAB33:    goto LAB8;

LAB10:    xsi_set_current_line(49, ng0);

LAB13:    xsi_set_current_line(50, ng0);
    t16 = (t0 + 2048U);
    t17 = *((char **)t16);

LAB14:    t16 = (t0 + 1016);
    t18 = *((char **)t16);
    t19 = xsi_vlog_unsigned_case_compare(t17, 10, t18, 32);
    if (t19 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB12;

LAB15:    xsi_set_current_line(51, ng0);

LAB18:    xsi_set_current_line(52, ng0);
    t16 = (t0 + 2208U);
    t20 = *((char **)t16);
    memset(t21, 0, 8);
    t16 = (t21 + 4);
    t22 = (t20 + 4);
    t23 = *((unsigned int *)t20);
    t24 = (t23 >> 0);
    t25 = (t24 & 1);
    *((unsigned int *)t21) = t25;
    t26 = *((unsigned int *)t22);
    t27 = (t26 >> 0);
    t28 = (t27 & 1);
    *((unsigned int *)t16) = t28;
    t29 = (t21 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t21);
    t33 = (t32 & t31);
    t34 = (t33 != 0);
    if (t34 > 0)
        goto LAB19;

LAB20:
LAB21:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t21) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t21 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t21);
    t15 = (t14 & t13);
    t23 = (t15 != 0);
    if (t23 > 0)
        goto LAB22;

LAB23:
LAB24:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t21) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 2);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t21 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t21);
    t15 = (t14 & t13);
    t23 = (t15 != 0);
    if (t23 > 0)
        goto LAB25;

LAB26:
LAB27:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 3);
    t8 = (t7 & 1);
    *((unsigned int *)t21) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 3);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t21 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t21);
    t15 = (t14 & t13);
    t23 = (t15 != 0);
    if (t23 > 0)
        goto LAB28;

LAB29:
LAB30:    goto LAB17;

LAB19:    xsi_set_current_line(52, ng0);
    t36 = (t0 + 2688U);
    t37 = *((char **)t36);
    memset(t35, 0, 8);
    t36 = (t35 + 4);
    t38 = (t37 + 4);
    t39 = *((unsigned int *)t37);
    t40 = (t39 >> 0);
    *((unsigned int *)t35) = t40;
    t41 = *((unsigned int *)t38);
    t42 = (t41 >> 0);
    *((unsigned int *)t36) = t42;
    t43 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t43 & 127U);
    t44 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t44 & 127U);
    t45 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t45, t35, 0, 0, 7, 0LL);
    goto LAB21;

LAB22:    xsi_set_current_line(53, ng0);
    t16 = (t0 + 2688U);
    t18 = *((char **)t16);
    memset(t35, 0, 8);
    t16 = (t35 + 4);
    t20 = (t18 + 4);
    t24 = *((unsigned int *)t18);
    t25 = (t24 >> 8);
    *((unsigned int *)t35) = t25;
    t26 = *((unsigned int *)t20);
    t27 = (t26 >> 8);
    *((unsigned int *)t16) = t27;
    t28 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t28 & 127U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 127U);
    t22 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t22, t35, 0, 0, 7, 0LL);
    goto LAB24;

LAB25:    xsi_set_current_line(54, ng0);
    t16 = (t0 + 2688U);
    t18 = *((char **)t16);
    memset(t35, 0, 8);
    t16 = (t35 + 4);
    t20 = (t18 + 4);
    t24 = *((unsigned int *)t18);
    t25 = (t24 >> 16);
    *((unsigned int *)t35) = t25;
    t26 = *((unsigned int *)t20);
    t27 = (t26 >> 16);
    *((unsigned int *)t16) = t27;
    t28 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t28 & 127U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 127U);
    t22 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t22, t35, 0, 0, 7, 0LL);
    goto LAB27;

LAB28:    xsi_set_current_line(55, ng0);
    t16 = (t0 + 2688U);
    t18 = *((char **)t16);
    memset(t35, 0, 8);
    t16 = (t35 + 4);
    t20 = (t18 + 4);
    t24 = *((unsigned int *)t18);
    t25 = (t24 >> 24);
    t26 = (t25 & 1);
    *((unsigned int *)t35) = t26;
    t27 = *((unsigned int *)t20);
    t28 = (t27 >> 24);
    t30 = (t28 & 1);
    *((unsigned int *)t16) = t30;
    t22 = (t0 + 4368);
    xsi_vlogvar_wait_assign_value(t22, t35, 0, 0, 1, 0LL);
    goto LAB30;

LAB31:    xsi_set_current_line(61, ng0);

LAB34:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 2048U);
    t5 = *((char **)t4);

LAB35:    t4 = (t0 + 1016);
    t16 = *((char **)t4);
    t19 = xsi_vlog_unsigned_case_compare(t5, 10, t16, 32);
    if (t19 == 1)
        goto LAB36;

LAB37:
LAB39:
LAB38:    xsi_set_current_line(66, ng0);

LAB42:    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB40:    goto LAB33;

LAB36:    xsi_set_current_line(63, ng0);

LAB41:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 3888);
    t18 = (t4 + 56U);
    t20 = *((char **)t18);
    t22 = (t0 + 4048);
    t29 = (t22 + 56U);
    t36 = *((char **)t29);
    t37 = (t0 + 4208);
    t38 = (t37 + 56U);
    t45 = *((char **)t38);
    t46 = (t0 + 4368);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    t49 = ((char*)((ng2)));
    xsi_vlogtype_concat(t21, 32, 29, 5U, t49, 7, t48, 1, t45, 7, t36, 7, t20, 7);
    t50 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t50, t21, 0, 0, 32, 0LL);
    goto LAB40;

}


extern void work_m_00000000000719263270_3426534761_init()
{
	static char *pe[] = {(void *)Initial_24_0,(void *)Always_43_1};
	xsi_register_didat("work_m_00000000000719263270_3426534761", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000000719263270_3426534761.didat");
	xsi_register_executes(pe);
}
