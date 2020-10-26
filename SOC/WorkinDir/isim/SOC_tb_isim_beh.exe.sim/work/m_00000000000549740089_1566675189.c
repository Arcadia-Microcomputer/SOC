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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/GPIO/SevenSegmentDriver.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {1777779519U, 0U, 4279236462U, 0U, 4221566451U, 0U, 58341U, 0U};
static int ng3[] = {2, 0};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {1U, 0U};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {4U, 0U};



static void Initial_15_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(15, ng0);

LAB2:    xsi_set_current_line(16, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 3, 0LL);
    xsi_set_current_line(17, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 7, 0LL);

LAB1:    return;
}

static void NetDecl_20_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(20, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 5656);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    xsi_vlog_bit_copy(t7, 0, t2, 0, 112);
    xsi_driver_vfirst_trans(t3, 0, 111U);

LAB1:    return;
}

static void NetDecl_39_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t18[8];
    char t24[8];
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
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1208U);
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

LAB9:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t12);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t39, 8);

LAB16:    t38 = (t0 + 5720);
    t40 = (t38 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memset(t43, 0, 8);
    t44 = 127U;
    t45 = t44;
    t46 = (t3 + 4);
    t47 = *((unsigned int *)t3);
    t44 = (t44 & t47);
    t48 = *((unsigned int *)t46);
    t45 = (t45 & t48);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t50 | t44);
    t51 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t51 | t45);
    xsi_driver_vfirst_trans(t38, 0, 6U);
    t52 = (t0 + 5528);
    *((int *)t52) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 1848U);
    t17 = *((char **)t16);
    t16 = (t0 + 1808U);
    t19 = (t16 + 72U);
    t20 = *((char **)t19);
    t21 = (t0 + 1808U);
    t22 = (t21 + 48U);
    t23 = *((char **)t22);
    t25 = (t0 + 1368U);
    t26 = *((char **)t25);
    memset(t24, 0, 8);
    t25 = (t24 + 4);
    t27 = (t26 + 4);
    t28 = *((unsigned int *)t26);
    t29 = (t28 >> 0);
    *((unsigned int *)t24) = t29;
    t30 = *((unsigned int *)t27);
    t31 = (t30 >> 0);
    *((unsigned int *)t25) = t31;
    t32 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t32 & 15U);
    t33 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t33 & 15U);
    xsi_vlog_generic_get_array_select_value(t18, 7, t17, t20, t23, 2, 1, t24, 4, 2);
    goto LAB9;

LAB10:    t38 = (t0 + 1368U);
    t39 = *((char **)t38);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 7, t18, 7, t39, 7);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void NetDecl_40_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t18[8];
    char t24[8];
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
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1208U);
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

LAB9:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t12);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t39, 8);

LAB16:    t38 = (t0 + 5784);
    t40 = (t38 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memset(t43, 0, 8);
    t44 = 127U;
    t45 = t44;
    t46 = (t3 + 4);
    t47 = *((unsigned int *)t3);
    t44 = (t44 & t47);
    t48 = *((unsigned int *)t46);
    t45 = (t45 & t48);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t50 | t44);
    t51 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t51 | t45);
    xsi_driver_vfirst_trans(t38, 0, 6U);
    t52 = (t0 + 5544);
    *((int *)t52) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 1848U);
    t17 = *((char **)t16);
    t16 = (t0 + 1808U);
    t19 = (t16 + 72U);
    t20 = *((char **)t19);
    t21 = (t0 + 1808U);
    t22 = (t21 + 48U);
    t23 = *((char **)t22);
    t25 = (t0 + 1528U);
    t26 = *((char **)t25);
    memset(t24, 0, 8);
    t25 = (t24 + 4);
    t27 = (t26 + 4);
    t28 = *((unsigned int *)t26);
    t29 = (t28 >> 0);
    *((unsigned int *)t24) = t29;
    t30 = *((unsigned int *)t27);
    t31 = (t30 >> 0);
    *((unsigned int *)t25) = t31;
    t32 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t32 & 15U);
    t33 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t33 & 15U);
    xsi_vlog_generic_get_array_select_value(t18, 7, t17, t20, t23, 2, 1, t24, 4, 2);
    goto LAB9;

LAB10:    t38 = (t0 + 1528U);
    t39 = *((char **)t38);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 7, t18, 7, t39, 7);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void NetDecl_41_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t18[8];
    char t24[8];
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
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;

LAB0:    t1 = (t0 + 4960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 1208U);
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

LAB9:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t12);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t39, 8);

LAB16:    t38 = (t0 + 5848);
    t40 = (t38 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memset(t43, 0, 8);
    t44 = 127U;
    t45 = t44;
    t46 = (t3 + 4);
    t47 = *((unsigned int *)t3);
    t44 = (t44 & t47);
    t48 = *((unsigned int *)t46);
    t45 = (t45 & t48);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t50 | t44);
    t51 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t51 | t45);
    xsi_driver_vfirst_trans(t38, 0, 6U);
    t52 = (t0 + 5560);
    *((int *)t52) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 1848U);
    t17 = *((char **)t16);
    t16 = (t0 + 1808U);
    t19 = (t16 + 72U);
    t20 = *((char **)t19);
    t21 = (t0 + 1808U);
    t22 = (t21 + 48U);
    t23 = *((char **)t22);
    t25 = (t0 + 1688U);
    t26 = *((char **)t25);
    memset(t24, 0, 8);
    t25 = (t24 + 4);
    t27 = (t26 + 4);
    t28 = *((unsigned int *)t26);
    t29 = (t28 >> 0);
    *((unsigned int *)t24) = t29;
    t30 = *((unsigned int *)t27);
    t31 = (t30 >> 0);
    *((unsigned int *)t25) = t31;
    t32 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t32 & 15U);
    t33 = *((unsigned int *)t25);
    *((unsigned int *)t25) = (t33 & 15U);
    xsi_vlog_generic_get_array_select_value(t18, 7, t17, t20, t23, 2, 1, t24, 4, 2);
    goto LAB9;

LAB10:    t38 = (t0 + 1688U);
    t39 = *((char **)t38);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 7, t18, 7, t39, 7);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void Always_45_5(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    int t32;

LAB0:    t1 = (t0 + 5208U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 5576);
    *((int *)t2) = 1;
    t3 = (t0 + 5240);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(45, ng0);

LAB5:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng3)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB9;

LAB6:    if (t20 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t8) = 1;

LAB9:    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(48, ng0);

LAB14:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t8, 0, 8);
    xsi_vlog_unsigned_add(t8, 32, t4, 3, t5, 32);
    t6 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t6, t8, 0, 0, 3, 0LL);

LAB12:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB15:    t5 = ((char*)((ng1)));
    t32 = xsi_vlog_unsigned_case_compare(t4, 3, t5, 32);
    if (t32 == 1)
        goto LAB16;

LAB17:    t2 = ((char*)((ng4)));
    t32 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 32);
    if (t32 == 1)
        goto LAB18;

LAB19:    t2 = ((char*)((ng3)));
    t32 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 32);
    if (t32 == 1)
        goto LAB20;

LAB21:
LAB22:    goto LAB2;

LAB8:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(46, ng0);

LAB13:    xsi_set_current_line(47, ng0);
    t30 = ((char*)((ng1)));
    t31 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 3, 0LL);
    goto LAB12;

LAB16:    xsi_set_current_line(53, ng0);

LAB23:    xsi_set_current_line(54, ng0);
    t6 = ((char*)((ng5)));
    t7 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t7, t6, 0, 0, 3, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 7, 0LL);
    goto LAB22;

LAB18:    xsi_set_current_line(57, ng0);

LAB24:    xsi_set_current_line(58, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 7, 0LL);
    goto LAB22;

LAB20:    xsi_set_current_line(61, ng0);

LAB25:    xsi_set_current_line(62, ng0);
    t3 = ((char*)((ng7)));
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 3, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2328U);
    t3 = *((char **)t2);
    t2 = (t0 + 2888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 7, 0LL);
    goto LAB22;

}


extern void work_m_00000000000549740089_1566675189_init()
{
	static char *pe[] = {(void *)Initial_15_0,(void *)NetDecl_20_1,(void *)NetDecl_39_2,(void *)NetDecl_40_3,(void *)NetDecl_41_4,(void *)Always_45_5};
	xsi_register_didat("work_m_00000000000549740089_1566675189", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000000549740089_1566675189.didat");
	xsi_register_executes(pe);
}
