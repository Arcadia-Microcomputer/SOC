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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/CPU/ImmGen.v";
static unsigned int ng1[] = {99U, 0U};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {20, 0};
static unsigned int ng4[] = {35U, 0U};
static int ng5[] = {21, 0};
static unsigned int ng6[] = {19U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {103U, 0U};
static unsigned int ng9[] = {55U, 0U};
static unsigned int ng10[] = {23U, 0U};
static unsigned int ng11[] = {111U, 0U};
static int ng12[] = {12, 0};



static void Always_18_0(char *t0)
{
    char t4[8];
    char t16[8];
    char t18[8];
    char t28[8];
    char t40[8];
    char t48[8];
    char t52[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t49;
    char *t50;
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;

LAB0:    t1 = (t0 + 3456U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 3776);
    *((int *)t2) = 1;
    t3 = (t0 + 3488);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(18, ng0);

LAB5:    xsi_set_current_line(19, ng0);
    t5 = (t0 + 2136U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 0);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 127U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 127U);

LAB6:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t14, 7);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 7, t2, 7);
    if (t15 == 1)
        goto LAB21;

LAB22:
LAB24:
LAB23:    xsi_set_current_line(44, ng0);

LAB34:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB25:    goto LAB2;

LAB7:    xsi_set_current_line(20, ng0);

LAB26:    xsi_set_current_line(21, ng0);
    t17 = ((char*)((ng2)));
    t19 = (t0 + 2136U);
    t20 = *((char **)t19);
    memset(t18, 0, 8);
    t19 = (t18 + 4);
    t21 = (t20 + 4);
    t22 = *((unsigned int *)t20);
    t23 = (t22 >> 8);
    *((unsigned int *)t18) = t23;
    t24 = *((unsigned int *)t21);
    t25 = (t24 >> 8);
    *((unsigned int *)t19) = t25;
    t26 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t26 & 15U);
    t27 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t27 & 15U);
    t29 = (t0 + 2136U);
    t30 = *((char **)t29);
    memset(t28, 0, 8);
    t29 = (t28 + 4);
    t31 = (t30 + 4);
    t32 = *((unsigned int *)t30);
    t33 = (t32 >> 25);
    *((unsigned int *)t28) = t33;
    t34 = *((unsigned int *)t31);
    t35 = (t34 >> 25);
    *((unsigned int *)t29) = t35;
    t36 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t36 & 63U);
    t37 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t37 & 63U);
    t38 = (t0 + 2136U);
    t39 = *((char **)t38);
    memset(t40, 0, 8);
    t38 = (t40 + 4);
    t41 = (t39 + 4);
    t42 = *((unsigned int *)t39);
    t43 = (t42 >> 7);
    t44 = (t43 & 1);
    *((unsigned int *)t40) = t44;
    t45 = *((unsigned int *)t41);
    t46 = (t45 >> 7);
    t47 = (t46 & 1);
    *((unsigned int *)t38) = t47;
    t49 = ((char*)((ng3)));
    t50 = (t0 + 2136U);
    t51 = *((char **)t50);
    memset(t52, 0, 8);
    t50 = (t52 + 4);
    t53 = (t51 + 4);
    t54 = *((unsigned int *)t51);
    t55 = (t54 >> 31);
    t56 = (t55 & 1);
    *((unsigned int *)t52) = t56;
    t57 = *((unsigned int *)t53);
    t58 = (t57 >> 31);
    t59 = (t58 & 1);
    *((unsigned int *)t50) = t59;
    xsi_vlog_mul_concat(t48, 20, 1, t49, 1U, t52, 1);
    xsi_vlogtype_concat(t16, 32, 32, 5U, t48, 20, t40, 1, t28, 6, t18, 4, t17, 1);
    t60 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t60, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB9:    xsi_set_current_line(23, ng0);

LAB27:    xsi_set_current_line(24, ng0);
    t3 = (t0 + 2136U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t3 = (t18 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 7);
    t10 = (t9 & 1);
    *((unsigned int *)t18) = t10;
    t11 = *((unsigned int *)t6);
    t12 = (t11 >> 7);
    t13 = (t12 & 1);
    *((unsigned int *)t3) = t13;
    t7 = (t0 + 2136U);
    t14 = *((char **)t7);
    memset(t28, 0, 8);
    t7 = (t28 + 4);
    t17 = (t14 + 4);
    t22 = *((unsigned int *)t14);
    t23 = (t22 >> 8);
    *((unsigned int *)t28) = t23;
    t24 = *((unsigned int *)t17);
    t25 = (t24 >> 8);
    *((unsigned int *)t7) = t25;
    t26 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t26 & 15U);
    t27 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t27 & 15U);
    t19 = (t0 + 2136U);
    t20 = *((char **)t19);
    memset(t40, 0, 8);
    t19 = (t40 + 4);
    t21 = (t20 + 4);
    t32 = *((unsigned int *)t20);
    t33 = (t32 >> 25);
    *((unsigned int *)t40) = t33;
    t34 = *((unsigned int *)t21);
    t35 = (t34 >> 25);
    *((unsigned int *)t19) = t35;
    t36 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t36 & 63U);
    t37 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t37 & 63U);
    t29 = ((char*)((ng5)));
    t30 = (t0 + 2136U);
    t31 = *((char **)t30);
    memset(t52, 0, 8);
    t30 = (t52 + 4);
    t38 = (t31 + 4);
    t42 = *((unsigned int *)t31);
    t43 = (t42 >> 31);
    t44 = (t43 & 1);
    *((unsigned int *)t52) = t44;
    t45 = *((unsigned int *)t38);
    t46 = (t45 >> 31);
    t47 = (t46 & 1);
    *((unsigned int *)t30) = t47;
    xsi_vlog_mul_concat(t48, 21, 1, t29, 1U, t52, 1);
    xsi_vlogtype_concat(t16, 32, 32, 4U, t48, 21, t40, 6, t28, 4, t18, 1);
    t39 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t39, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB11:    xsi_set_current_line(26, ng0);

LAB28:    xsi_set_current_line(27, ng0);
    t3 = (t0 + 2136U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t3 = (t18 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 20);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 20);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 2047U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 2047U);
    t7 = ((char*)((ng5)));
    t14 = (t0 + 2136U);
    t17 = *((char **)t14);
    memset(t40, 0, 8);
    t14 = (t40 + 4);
    t19 = (t17 + 4);
    t22 = *((unsigned int *)t17);
    t23 = (t22 >> 31);
    t24 = (t23 & 1);
    *((unsigned int *)t40) = t24;
    t25 = *((unsigned int *)t19);
    t26 = (t25 >> 31);
    t27 = (t26 & 1);
    *((unsigned int *)t14) = t27;
    xsi_vlog_mul_concat(t28, 21, 1, t7, 1U, t40, 1);
    xsi_vlogtype_concat(t16, 32, 32, 2U, t28, 21, t18, 11);
    t20 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t20, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB13:    xsi_set_current_line(29, ng0);

LAB29:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 2136U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t3 = (t18 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 20);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 20);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 2047U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 2047U);
    t7 = ((char*)((ng5)));
    t14 = (t0 + 2136U);
    t17 = *((char **)t14);
    memset(t40, 0, 8);
    t14 = (t40 + 4);
    t19 = (t17 + 4);
    t22 = *((unsigned int *)t17);
    t23 = (t22 >> 31);
    t24 = (t23 & 1);
    *((unsigned int *)t40) = t24;
    t25 = *((unsigned int *)t19);
    t26 = (t25 >> 31);
    t27 = (t26 & 1);
    *((unsigned int *)t14) = t27;
    xsi_vlog_mul_concat(t28, 21, 1, t7, 1U, t40, 1);
    xsi_vlogtype_concat(t16, 32, 32, 2U, t28, 21, t18, 11);
    t20 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t20, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB15:    xsi_set_current_line(32, ng0);

LAB30:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 2136U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t3 = (t18 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 20);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 20);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 2047U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 2047U);
    t7 = ((char*)((ng5)));
    t14 = (t0 + 2136U);
    t17 = *((char **)t14);
    memset(t40, 0, 8);
    t14 = (t40 + 4);
    t19 = (t17 + 4);
    t22 = *((unsigned int *)t17);
    t23 = (t22 >> 31);
    t24 = (t23 & 1);
    *((unsigned int *)t40) = t24;
    t25 = *((unsigned int *)t19);
    t26 = (t25 >> 31);
    t27 = (t26 & 1);
    *((unsigned int *)t14) = t27;
    xsi_vlog_mul_concat(t28, 21, 1, t7, 1U, t40, 1);
    xsi_vlogtype_concat(t16, 32, 32, 2U, t28, 21, t18, 11);
    t20 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t20, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB17:    xsi_set_current_line(35, ng0);

LAB31:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 2136U);
    t6 = *((char **)t5);
    memset(t18, 0, 8);
    t5 = (t18 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 12);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 12);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 1048575U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 1048575U);
    xsi_vlogtype_concat(t16, 32, 32, 2U, t18, 20, t3, 12);
    t14 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t14, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB19:    xsi_set_current_line(38, ng0);

LAB32:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 2136U);
    t6 = *((char **)t5);
    memset(t18, 0, 8);
    t5 = (t18 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 12);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 12);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 1048575U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 1048575U);
    xsi_vlogtype_concat(t16, 32, 32, 2U, t18, 20, t3, 12);
    t14 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t14, t16, 0, 0, 32, 0LL);
    goto LAB25;

LAB21:    xsi_set_current_line(41, ng0);

LAB33:    xsi_set_current_line(42, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 2136U);
    t6 = *((char **)t5);
    memset(t18, 0, 8);
    t5 = (t18 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 21);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 21);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 1023U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 1023U);
    t14 = (t0 + 2136U);
    t17 = *((char **)t14);
    memset(t28, 0, 8);
    t14 = (t28 + 4);
    t19 = (t17 + 4);
    t22 = *((unsigned int *)t17);
    t23 = (t22 >> 20);
    t24 = (t23 & 1);
    *((unsigned int *)t28) = t24;
    t25 = *((unsigned int *)t19);
    t26 = (t25 >> 20);
    t27 = (t26 & 1);
    *((unsigned int *)t14) = t27;
    t20 = (t0 + 2136U);
    t21 = *((char **)t20);
    memset(t40, 0, 8);
    t20 = (t40 + 4);
    t29 = (t21 + 4);
    t32 = *((unsigned int *)t21);
    t33 = (t32 >> 12);
    *((unsigned int *)t40) = t33;
    t34 = *((unsigned int *)t29);
    t35 = (t34 >> 12);
    *((unsigned int *)t20) = t35;
    t36 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t36 & 255U);
    t37 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t37 & 255U);
    t30 = ((char*)((ng12)));
    t31 = (t0 + 2136U);
    t38 = *((char **)t31);
    memset(t52, 0, 8);
    t31 = (t52 + 4);
    t39 = (t38 + 4);
    t42 = *((unsigned int *)t38);
    t43 = (t42 >> 31);
    t44 = (t43 & 1);
    *((unsigned int *)t52) = t44;
    t45 = *((unsigned int *)t39);
    t46 = (t45 >> 31);
    t47 = (t46 & 1);
    *((unsigned int *)t31) = t47;
    xsi_vlog_mul_concat(t48, 12, 1, t30, 1U, t52, 1);
    xsi_vlogtype_concat(t16, 32, 32, 5U, t48, 12, t40, 8, t28, 1, t18, 10, t3, 1);
    t41 = (t0 + 2536);
    xsi_vlogvar_wait_assign_value(t41, t16, 0, 0, 32, 0LL);
    goto LAB25;

}


extern void work_m_00000000000426587552_2444586083_init()
{
	static char *pe[] = {(void *)Always_18_0};
	xsi_register_didat("work_m_00000000000426587552_2444586083", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000000426587552_2444586083.didat");
	xsi_register_executes(pe);
}
