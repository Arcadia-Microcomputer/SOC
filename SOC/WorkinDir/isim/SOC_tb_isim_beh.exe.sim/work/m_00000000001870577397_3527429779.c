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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/CPU/DBusMaster.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {0U, 536870911U};
static unsigned int ng3[] = {0U, 15U};
static unsigned int ng4[] = {0U, 1U};
static unsigned int ng5[] = {0U, 4294967295U};
static int ng6[] = {24, 0};
static int ng7[] = {31, 0};
static int ng8[] = {8, 0};
static int ng9[] = {0, 0};
static int ng10[] = {7, 0};
static int ng11[] = {1, 0};
static int ng12[] = {2, 0};
static int ng13[] = {3, 0};
static unsigned int ng14[] = {1U, 0U};
static int ng15[] = {16, 0};
static int ng16[] = {15, 0};
static unsigned int ng17[] = {2U, 0U};
static unsigned int ng18[] = {3U, 0U};
static unsigned int ng19[] = {6U, 0U};
static unsigned int ng20[] = {12U, 0U};
static unsigned int ng21[] = {15U, 0U};



static void Initial_25_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(25, ng0);

LAB2:    xsi_set_current_line(26, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);

LAB1:    return;
}

static void Cont_29_1(char *t0)
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
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 7344U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1776U);
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

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 9856);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 1073741823U;
    t30 = t29;
    t31 = (t3 + 4);
    t32 = *((unsigned int *)t3);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 29);
    t37 = (t0 + 9648);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 4416);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    goto LAB9;

LAB10:    t23 = ((char*)((ng2)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 30, t18, 30, t23, 30);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void Cont_30_2(char *t0)
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
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 7592U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1776U);
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

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 9920);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 15U;
    t30 = t29;
    t31 = (t3 + 4);
    t32 = *((unsigned int *)t3);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 3);
    t37 = (t0 + 9664);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 4576);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    goto LAB9;

LAB10:    t23 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 4, t18, 4, t23, 4);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void Cont_31_3(char *t0)
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
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 7840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 1776U);
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

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 9984);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 1U;
    t30 = t29;
    t31 = (t3 + 4);
    t32 = *((unsigned int *)t3);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 0);
    t37 = (t0 + 9680);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 4736);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    goto LAB9;

LAB10:    t23 = ((char*)((ng4)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t18, 1, t23, 1);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void Cont_32_4(char *t0)
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
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 8088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1776U);
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

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 10048);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 1U;
    t30 = t29;
    t31 = (t3 + 4);
    t32 = *((unsigned int *)t3);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 0);
    t37 = (t0 + 9696);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 4896);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    goto LAB9;

LAB10:    t23 = ((char*)((ng4)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t18, 1, t23, 1);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void Cont_33_5(char *t0)
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
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 8336U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1776U);
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

LAB9:    t19 = *((unsigned int *)t4);
    t20 = (~(t19));
    t21 = *((unsigned int *)t12);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 10112);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t3, 8);
    xsi_driver_vfirst_trans(t24, 0, 31);
    t29 = (t0 + 9712);
    *((int *)t29) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = (t0 + 5056);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    goto LAB9;

LAB10:    t23 = ((char*)((ng5)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t18, 32, t23, 32);
    goto LAB16;

LAB14:    memcpy(t3, t18, 8);
    goto LAB16;

}

static void NetDecl_51_6(char *t0)
{
    char t3[8];
    char t5[8];
    char *t1;
    char *t2;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;

LAB0:    t1 = (t0 + 8584U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2896U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t5 + 4);
    t6 = (t4 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (t7 >> 2);
    t9 = (t8 & 1);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 2);
    t12 = (t11 & 1);
    *((unsigned int *)t2) = t12;
    memset(t3, 0, 8);
    t13 = (t5 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t5);
    t17 = (t16 & t15);
    t18 = (t17 & 1U);
    if (t18 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t13) == 0)
        goto LAB4;

LAB6:    t19 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t19) = 1;

LAB7:    t20 = (t0 + 10176);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memset(t24, 0, 8);
    t25 = 1U;
    t26 = t25;
    t27 = (t3 + 4);
    t28 = *((unsigned int *)t3);
    t25 = (t25 & t28);
    t29 = *((unsigned int *)t27);
    t26 = (t26 & t29);
    t30 = (t24 + 4);
    t31 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t31 | t25);
    t32 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t32 | t26);
    xsi_driver_vfirst_trans(t20, 0, 0U);
    t33 = (t0 + 9728);
    *((int *)t33) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

}

static void NetDecl_54_7(char *t0)
{
    char t3[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 8832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 6016);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t7 = (t6 + 4);
    t8 = (t5 + 4);
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    t11 = (t10 & 1);
    *((unsigned int *)t6) = t11;
    t12 = *((unsigned int *)t8);
    t13 = (t12 >> 2);
    t14 = (t13 & 1);
    *((unsigned int *)t7) = t14;
    memset(t3, 0, 8);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t15);
    t17 = (~(t16));
    t18 = *((unsigned int *)t6);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t15) == 0)
        goto LAB4;

LAB6:    t21 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t21) = 1;

LAB7:    t22 = (t0 + 10240);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t3 + 4);
    t30 = *((unsigned int *)t3);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0U);
    t35 = (t0 + 9744);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

}

static void Always_61_8(char *t0)
{
    char t13[8];
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
    char *t11;
    char *t12;
    unsigned int t14;

LAB0:    t1 = (t0 + 9080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 9760);
    *((int *)t2) = 1;
    t3 = (t0 + 9112);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(61, ng0);

LAB5:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(62, ng0);

LAB9:    xsi_set_current_line(63, ng0);
    t11 = (t0 + 2896U);
    t12 = *((char **)t11);
    t11 = (t0 + 6016);
    xsi_vlogvar_wait_assign_value(t11, t12, 0, 0, 3, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 3056U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t13 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t13) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t10 & 3U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 3U);
    t5 = (t0 + 6176);
    xsi_vlogvar_wait_assign_value(t5, t13, 0, 0, 2, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 4416);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5216);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 30, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 4576);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5376);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 4736);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5536);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 4896);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5696);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 5056);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 5856);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    goto LAB8;

}

static void Always_74_9(char *t0)
{
    char t11[8];
    char t23[8];
    char t24[8];
    char t27[8];
    char t30[8];
    char t63[8];
    char t64[8];
    char t65[8];
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
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    int t22;
    char *t25;
    char *t26;
    char *t28;
    unsigned int t29;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    int t54;
    int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    unsigned int t72;
    int t73;
    char *t74;
    unsigned int t75;
    int t76;
    int t77;
    char *t78;
    unsigned int t79;
    int t80;
    int t81;
    unsigned int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    int t86;
    int t87;

LAB0:    t1 = (t0 + 9328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 9776);
    *((int *)t2) = 1;
    t3 = (t0 + 9360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(74, ng0);

LAB5:    xsi_set_current_line(75, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(177, ng0);

LAB118:    xsi_set_current_line(178, ng0);
    t2 = (t0 + 5216);
    t3 = (t2 + 56U);
    t12 = *((char **)t3);
    t13 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 30, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 5376);
    t3 = (t2 + 56U);
    t12 = *((char **)t3);
    t13 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 4, 0LL);
    xsi_set_current_line(180, ng0);
    t2 = (t0 + 5536);
    t3 = (t2 + 56U);
    t12 = *((char **)t3);
    t13 = (t0 + 4736);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 5696);
    t3 = (t2 + 56U);
    t12 = *((char **)t3);
    t13 = (t0 + 4896);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 5856);
    t3 = (t2 + 56U);
    t12 = *((char **)t3);
    t13 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, 0, 32, 0LL);
    xsi_set_current_line(183, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(75, ng0);

LAB9:    xsi_set_current_line(76, ng0);
    t12 = (t0 + 3056U);
    t13 = *((char **)t12);
    memset(t11, 0, 8);
    t12 = (t11 + 4);
    t14 = (t13 + 4);
    t15 = *((unsigned int *)t13);
    t16 = (t15 >> 2);
    *((unsigned int *)t11) = t16;
    t17 = *((unsigned int *)t14);
    t18 = (t17 >> 2);
    *((unsigned int *)t12) = t18;
    t19 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t19 & 1073741823U);
    t20 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t20 & 1073741823U);
    t21 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t21, t11, 0, 0, 30, 0LL);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3216U);
    t3 = *((char **)t2);
    t2 = (t0 + 4736);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3376U);
    t3 = *((char **)t2);
    t2 = (t0 + 4896);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 6016);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t11, 0, 8);
    t5 = (t11 + 4);
    t12 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t11) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t10 & 3U);
    t15 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t15 & 3U);

LAB10:    t13 = ((char*)((ng1)));
    t22 = xsi_vlog_unsigned_case_compare(t11, 2, t13, 2);
    if (t22 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng14)));
    t22 = xsi_vlog_unsigned_case_compare(t11, 2, t2, 2);
    if (t22 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng17)));
    t22 = xsi_vlog_unsigned_case_compare(t11, 2, t2, 2);
    if (t22 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(123, ng0);

LAB75:    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB19:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 2896U);
    t3 = *((char **)t2);
    memset(t23, 0, 8);
    t2 = (t23 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);

LAB76:    t13 = ((char*)((ng1)));
    t22 = xsi_vlog_unsigned_case_compare(t23, 2, t13, 2);
    if (t22 == 1)
        goto LAB77;

LAB78:    t2 = ((char*)((ng14)));
    t22 = xsi_vlog_unsigned_case_compare(t23, 2, t2, 2);
    if (t22 == 1)
        goto LAB79;

LAB80:    t2 = ((char*)((ng17)));
    t22 = xsi_vlog_unsigned_case_compare(t23, 2, t2, 2);
    if (t22 == 1)
        goto LAB81;

LAB82:
LAB84:
LAB83:    xsi_set_current_line(172, ng0);

LAB117:    xsi_set_current_line(173, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(174, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB85:    goto LAB8;

LAB11:    xsi_set_current_line(82, ng0);

LAB20:    xsi_set_current_line(84, ng0);
    t14 = ((char*)((ng6)));
    t21 = (t0 + 3856U);
    t25 = *((char **)t21);
    t21 = (t0 + 2576U);
    t26 = *((char **)t21);
    memset(t27, 0, 8);
    t21 = (t27 + 4);
    t28 = (t26 + 4);
    t16 = *((unsigned int *)t26);
    t17 = (t16 >> 7);
    t18 = (t17 & 1);
    *((unsigned int *)t27) = t18;
    t19 = *((unsigned int *)t28);
    t20 = (t19 >> 7);
    t29 = (t20 & 1);
    *((unsigned int *)t21) = t29;
    t31 = *((unsigned int *)t25);
    t32 = *((unsigned int *)t27);
    t33 = (t31 & t32);
    *((unsigned int *)t30) = t33;
    t34 = (t25 + 4);
    t35 = (t27 + 4);
    t36 = (t30 + 4);
    t37 = *((unsigned int *)t34);
    t38 = *((unsigned int *)t35);
    t39 = (t37 | t38);
    *((unsigned int *)t36) = t39;
    t40 = *((unsigned int *)t36);
    t41 = (t40 != 0);
    if (t41 == 1)
        goto LAB21;

LAB22:
LAB23:    xsi_vlog_mul_concat(t24, 24, 1, t14, 1U, t30, 1);
    xsi_vlogtype_concat(t23, 24, 24, 1U, t24, 24);
    t62 = (t0 + 4256);
    t66 = (t0 + 4256);
    t67 = (t66 + 72U);
    t68 = *((char **)t67);
    t69 = ((char*)((ng7)));
    t70 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t63, t64, t65, ((int*)(t68)), 2, t69, 32, 1, t70, 32, 1);
    t71 = (t63 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (!(t72));
    t74 = (t64 + 4);
    t75 = *((unsigned int *)t74);
    t76 = (!(t75));
    t77 = (t73 && t76);
    t78 = (t65 + 4);
    t79 = *((unsigned int *)t78);
    t80 = (!(t79));
    t81 = (t77 && t80);
    if (t81 == 1)
        goto LAB24;

LAB25:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 6176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB26:    t5 = ((char*)((ng9)));
    t22 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 32);
    if (t22 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng11)));
    t22 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t22 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng12)));
    t22 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t22 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng13)));
    t22 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 32);
    if (t22 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB19;

LAB13:    xsi_set_current_line(101, ng0);

LAB48:    xsi_set_current_line(103, ng0);
    t3 = ((char*)((ng15)));
    t5 = (t0 + 3856U);
    t12 = *((char **)t5);
    t5 = (t0 + 2576U);
    t13 = *((char **)t5);
    memset(t27, 0, 8);
    t5 = (t27 + 4);
    t14 = (t13 + 4);
    t6 = *((unsigned int *)t13);
    t7 = (t6 >> 15);
    t8 = (t7 & 1);
    *((unsigned int *)t27) = t8;
    t9 = *((unsigned int *)t14);
    t10 = (t9 >> 15);
    t15 = (t10 & 1);
    *((unsigned int *)t5) = t15;
    t16 = *((unsigned int *)t12);
    t17 = *((unsigned int *)t27);
    t18 = (t16 & t17);
    *((unsigned int *)t30) = t18;
    t21 = (t12 + 4);
    t25 = (t27 + 4);
    t26 = (t30 + 4);
    t19 = *((unsigned int *)t21);
    t20 = *((unsigned int *)t25);
    t29 = (t19 | t20);
    *((unsigned int *)t26) = t29;
    t31 = *((unsigned int *)t26);
    t32 = (t31 != 0);
    if (t32 == 1)
        goto LAB49;

LAB50:
LAB51:    xsi_vlog_mul_concat(t24, 16, 1, t3, 1U, t30, 1);
    xsi_vlogtype_concat(t23, 16, 16, 1U, t24, 16);
    t35 = (t0 + 4256);
    t36 = (t0 + 4256);
    t44 = (t36 + 72U);
    t45 = *((char **)t44);
    t62 = ((char*)((ng7)));
    t66 = ((char*)((ng15)));
    xsi_vlog_convert_partindices(t63, t64, t65, ((int*)(t45)), 2, t62, 32, 1, t66, 32, 1);
    t67 = (t63 + 4);
    t56 = *((unsigned int *)t67);
    t73 = (!(t56));
    t68 = (t64 + 4);
    t57 = *((unsigned int *)t68);
    t76 = (!(t57));
    t77 = (t73 && t76);
    t69 = (t65 + 4);
    t58 = *((unsigned int *)t69);
    t80 = (!(t58));
    t81 = (t77 && t80);
    if (t81 == 1)
        goto LAB52;

LAB53:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 6176);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB54:    t12 = ((char*)((ng9)));
    t22 = xsi_vlog_unsigned_case_compare(t5, 2, t12, 32);
    if (t22 == 1)
        goto LAB55;

LAB56:    t2 = ((char*)((ng11)));
    t22 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t22 == 1)
        goto LAB57;

LAB58:    t2 = ((char*)((ng12)));
    t22 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 32);
    if (t22 == 1)
        goto LAB59;

LAB60:
LAB62:
LAB61:    xsi_set_current_line(115, ng0);

LAB73:    xsi_set_current_line(116, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB63:    goto LAB19;

LAB15:    xsi_set_current_line(120, ng0);

LAB74:    xsi_set_current_line(121, ng0);
    t3 = (t0 + 2576U);
    t12 = *((char **)t3);
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t12, 0, 0, 32, 0LL);
    goto LAB19;

LAB21:    t42 = *((unsigned int *)t30);
    t43 = *((unsigned int *)t36);
    *((unsigned int *)t30) = (t42 | t43);
    t44 = (t25 + 4);
    t45 = (t27 + 4);
    t46 = *((unsigned int *)t25);
    t47 = (~(t46));
    t48 = *((unsigned int *)t44);
    t49 = (~(t48));
    t50 = *((unsigned int *)t27);
    t51 = (~(t50));
    t52 = *((unsigned int *)t45);
    t53 = (~(t52));
    t54 = (t47 & t49);
    t55 = (t51 & t53);
    t56 = (~(t54));
    t57 = (~(t55));
    t58 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t58 & t56);
    t59 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t59 & t57);
    t60 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t60 & t56);
    t61 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t61 & t57);
    goto LAB23;

LAB24:    t82 = *((unsigned int *)t65);
    t83 = (t82 + 0);
    t84 = *((unsigned int *)t63);
    t85 = *((unsigned int *)t64);
    t86 = (t84 - t85);
    t87 = (t86 + 1);
    xsi_vlogvar_wait_assign_value(t62, t23, t83, *((unsigned int *)t64), t87, 0LL);
    goto LAB25;

LAB27:    xsi_set_current_line(87, ng0);

LAB36:    xsi_set_current_line(88, ng0);
    t12 = (t0 + 2576U);
    t13 = *((char **)t12);
    memset(t23, 0, 8);
    t12 = (t23 + 4);
    t14 = (t13 + 4);
    t6 = *((unsigned int *)t13);
    t7 = (t6 >> 0);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 255U);
    t15 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t15 & 255U);
    t21 = (t0 + 4256);
    t25 = (t0 + 4256);
    t26 = (t25 + 72U);
    t28 = *((char **)t26);
    t34 = ((char*)((ng10)));
    t35 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t28)), 2, t34, 32, 1, t35, 32, 1);
    t36 = (t24 + 4);
    t16 = *((unsigned int *)t36);
    t54 = (!(t16));
    t44 = (t27 + 4);
    t17 = *((unsigned int *)t44);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t45 = (t30 + 4);
    t18 = *((unsigned int *)t45);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB37;

LAB38:    goto LAB35;

LAB29:    xsi_set_current_line(90, ng0);

LAB39:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 2576U);
    t5 = *((char **)t3);
    memset(t23, 0, 8);
    t3 = (t23 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 8);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 8);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 255U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 255U);
    t13 = (t0 + 4256);
    t14 = (t0 + 4256);
    t21 = (t14 + 72U);
    t25 = *((char **)t21);
    t26 = ((char*)((ng10)));
    t28 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t25)), 2, t26, 32, 1, t28, 32, 1);
    t34 = (t24 + 4);
    t16 = *((unsigned int *)t34);
    t54 = (!(t16));
    t35 = (t27 + 4);
    t17 = *((unsigned int *)t35);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t36 = (t30 + 4);
    t18 = *((unsigned int *)t36);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB40;

LAB41:    goto LAB35;

LAB31:    xsi_set_current_line(93, ng0);

LAB42:    xsi_set_current_line(94, ng0);
    t3 = (t0 + 2576U);
    t5 = *((char **)t3);
    memset(t23, 0, 8);
    t3 = (t23 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 16);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 16);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 255U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 255U);
    t13 = (t0 + 4256);
    t14 = (t0 + 4256);
    t21 = (t14 + 72U);
    t25 = *((char **)t21);
    t26 = ((char*)((ng10)));
    t28 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t25)), 2, t26, 32, 1, t28, 32, 1);
    t34 = (t24 + 4);
    t16 = *((unsigned int *)t34);
    t54 = (!(t16));
    t35 = (t27 + 4);
    t17 = *((unsigned int *)t35);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t36 = (t30 + 4);
    t18 = *((unsigned int *)t36);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB43;

LAB44:    goto LAB35;

LAB33:    xsi_set_current_line(96, ng0);

LAB45:    xsi_set_current_line(97, ng0);
    t3 = (t0 + 2576U);
    t5 = *((char **)t3);
    memset(t23, 0, 8);
    t3 = (t23 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 24);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 24);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 255U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 255U);
    t13 = (t0 + 4256);
    t14 = (t0 + 4256);
    t21 = (t14 + 72U);
    t25 = *((char **)t21);
    t26 = ((char*)((ng10)));
    t28 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t25)), 2, t26, 32, 1, t28, 32, 1);
    t34 = (t24 + 4);
    t16 = *((unsigned int *)t34);
    t54 = (!(t16));
    t35 = (t27 + 4);
    t17 = *((unsigned int *)t35);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t36 = (t30 + 4);
    t18 = *((unsigned int *)t36);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB46;

LAB47:    goto LAB35;

LAB37:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t21, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB38;

LAB40:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t13, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB41;

LAB43:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t13, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB44;

LAB46:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t13, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB47;

LAB49:    t33 = *((unsigned int *)t30);
    t37 = *((unsigned int *)t26);
    *((unsigned int *)t30) = (t33 | t37);
    t28 = (t12 + 4);
    t34 = (t27 + 4);
    t38 = *((unsigned int *)t12);
    t39 = (~(t38));
    t40 = *((unsigned int *)t28);
    t41 = (~(t40));
    t42 = *((unsigned int *)t27);
    t43 = (~(t42));
    t46 = *((unsigned int *)t34);
    t47 = (~(t46));
    t54 = (t39 & t41);
    t55 = (t43 & t47);
    t48 = (~(t54));
    t49 = (~(t55));
    t50 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t50 & t48);
    t51 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t51 & t49);
    t52 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t52 & t48);
    t53 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t53 & t49);
    goto LAB51;

LAB52:    t59 = *((unsigned int *)t65);
    t83 = (t59 + 0);
    t60 = *((unsigned int *)t63);
    t61 = *((unsigned int *)t64);
    t86 = (t60 - t61);
    t87 = (t86 + 1);
    xsi_vlogvar_wait_assign_value(t35, t23, t83, *((unsigned int *)t64), t87, 0LL);
    goto LAB53;

LAB55:    xsi_set_current_line(106, ng0);

LAB64:    xsi_set_current_line(107, ng0);
    t13 = (t0 + 2576U);
    t14 = *((char **)t13);
    memset(t23, 0, 8);
    t13 = (t23 + 4);
    t21 = (t14 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (t6 >> 0);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t21);
    t9 = (t8 >> 0);
    *((unsigned int *)t13) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 65535U);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 & 65535U);
    t25 = (t0 + 4256);
    t26 = (t0 + 4256);
    t28 = (t26 + 72U);
    t34 = *((char **)t28);
    t35 = ((char*)((ng16)));
    t36 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t34)), 2, t35, 32, 1, t36, 32, 1);
    t44 = (t24 + 4);
    t16 = *((unsigned int *)t44);
    t54 = (!(t16));
    t45 = (t27 + 4);
    t17 = *((unsigned int *)t45);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t62 = (t30 + 4);
    t18 = *((unsigned int *)t62);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB65;

LAB66:    goto LAB63;

LAB57:    xsi_set_current_line(109, ng0);

LAB67:    xsi_set_current_line(110, ng0);
    t3 = (t0 + 2576U);
    t12 = *((char **)t3);
    memset(t23, 0, 8);
    t3 = (t23 + 4);
    t13 = (t12 + 4);
    t6 = *((unsigned int *)t12);
    t7 = (t6 >> 8);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t13);
    t9 = (t8 >> 8);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 65535U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 65535U);
    t14 = (t0 + 4256);
    t21 = (t0 + 4256);
    t25 = (t21 + 72U);
    t26 = *((char **)t25);
    t28 = ((char*)((ng16)));
    t34 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t26)), 2, t28, 32, 1, t34, 32, 1);
    t35 = (t24 + 4);
    t16 = *((unsigned int *)t35);
    t54 = (!(t16));
    t36 = (t27 + 4);
    t17 = *((unsigned int *)t36);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t44 = (t30 + 4);
    t18 = *((unsigned int *)t44);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB68;

LAB69:    goto LAB63;

LAB59:    xsi_set_current_line(112, ng0);

LAB70:    xsi_set_current_line(113, ng0);
    t3 = (t0 + 2576U);
    t12 = *((char **)t3);
    memset(t23, 0, 8);
    t3 = (t23 + 4);
    t13 = (t12 + 4);
    t6 = *((unsigned int *)t12);
    t7 = (t6 >> 16);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t13);
    t9 = (t8 >> 16);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 65535U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 65535U);
    t14 = (t0 + 4256);
    t21 = (t0 + 4256);
    t25 = (t21 + 72U);
    t26 = *((char **)t25);
    t28 = ((char*)((ng16)));
    t34 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t24, t27, t30, ((int*)(t26)), 2, t28, 32, 1, t34, 32, 1);
    t35 = (t24 + 4);
    t16 = *((unsigned int *)t35);
    t54 = (!(t16));
    t36 = (t27 + 4);
    t17 = *((unsigned int *)t36);
    t55 = (!(t17));
    t73 = (t54 && t55);
    t44 = (t30 + 4);
    t18 = *((unsigned int *)t44);
    t76 = (!(t18));
    t77 = (t73 && t76);
    if (t77 == 1)
        goto LAB71;

LAB72:    goto LAB63;

LAB65:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t25, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB66;

LAB68:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t14, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB69;

LAB71:    t19 = *((unsigned int *)t30);
    t80 = (t19 + 0);
    t20 = *((unsigned int *)t24);
    t29 = *((unsigned int *)t27);
    t81 = (t20 - t29);
    t83 = (t81 + 1);
    xsi_vlogvar_wait_assign_value(t14, t23, t80, *((unsigned int *)t27), t83, 0LL);
    goto LAB72;

LAB77:    xsi_set_current_line(130, ng0);

LAB86:    xsi_set_current_line(131, ng0);
    t14 = ((char*)((ng14)));
    t21 = (t0 + 3056U);
    t25 = *((char **)t21);
    memset(t24, 0, 8);
    t21 = (t24 + 4);
    t26 = (t25 + 4);
    t16 = *((unsigned int *)t25);
    t17 = (t16 >> 0);
    *((unsigned int *)t24) = t17;
    t18 = *((unsigned int *)t26);
    t19 = (t18 >> 0);
    *((unsigned int *)t21) = t19;
    t20 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t20 & 3U);
    t29 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t29 & 3U);
    memset(t27, 0, 8);
    xsi_vlog_unsigned_lshift(t27, 4, t14, 4, t24, 2);
    t28 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t28, t27, 0, 0, 4, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = (t0 + 3056U);
    t3 = *((char **)t2);
    memset(t24, 0, 8);
    t2 = (t24 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t24) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t10 & 3U);
    t15 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t15 & 3U);

LAB87:    t13 = ((char*)((ng9)));
    t22 = xsi_vlog_unsigned_case_compare(t24, 32, t13, 32);
    if (t22 == 1)
        goto LAB88;

LAB89:    t2 = ((char*)((ng11)));
    t22 = xsi_vlog_unsigned_case_compare(t24, 32, t2, 32);
    if (t22 == 1)
        goto LAB90;

LAB91:    t2 = ((char*)((ng12)));
    t22 = xsi_vlog_unsigned_case_compare(t24, 32, t2, 32);
    if (t22 == 1)
        goto LAB92;

LAB93:    t2 = ((char*)((ng13)));
    t22 = xsi_vlog_unsigned_case_compare(t24, 32, t2, 32);
    if (t22 == 1)
        goto LAB94;

LAB95:
LAB96:    goto LAB85;

LAB79:    xsi_set_current_line(148, ng0);

LAB101:    xsi_set_current_line(149, ng0);
    t3 = (t0 + 3056U);
    t12 = *((char **)t3);
    memset(t27, 0, 8);
    t3 = (t27 + 4);
    t13 = (t12 + 4);
    t6 = *((unsigned int *)t12);
    t7 = (t6 >> 0);
    *((unsigned int *)t27) = t7;
    t8 = *((unsigned int *)t13);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t10 & 3U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 3U);

LAB102:    t14 = ((char*)((ng9)));
    t54 = xsi_vlog_unsigned_case_compare(t27, 32, t14, 32);
    if (t54 == 1)
        goto LAB103;

LAB104:    t2 = ((char*)((ng11)));
    t22 = xsi_vlog_unsigned_case_compare(t27, 32, t2, 32);
    if (t22 == 1)
        goto LAB105;

LAB106:    t2 = ((char*)((ng12)));
    t22 = xsi_vlog_unsigned_case_compare(t27, 32, t2, 32);
    if (t22 == 1)
        goto LAB107;

LAB108:
LAB110:
LAB109:    xsi_set_current_line(162, ng0);

LAB115:    xsi_set_current_line(163, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB111:    goto LAB85;

LAB81:    xsi_set_current_line(168, ng0);

LAB116:    xsi_set_current_line(169, ng0);
    t3 = (t0 + 3536U);
    t12 = *((char **)t3);
    t3 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t3, t12, 0, 0, 32, 0LL);
    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng21)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB85;

LAB88:    xsi_set_current_line(134, ng0);

LAB97:    xsi_set_current_line(135, ng0);
    t14 = (t0 + 3536U);
    t21 = *((char **)t14);
    memset(t30, 0, 8);
    t14 = (t30 + 4);
    t25 = (t21 + 4);
    t16 = *((unsigned int *)t21);
    t17 = (t16 >> 0);
    *((unsigned int *)t30) = t17;
    t18 = *((unsigned int *)t25);
    t19 = (t18 >> 0);
    *((unsigned int *)t14) = t19;
    t20 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t20 & 255U);
    t29 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t29 & 255U);
    t26 = ((char*)((ng1)));
    xsi_vlogtype_concat(t27, 32, 32, 2U, t26, 24, t30, 8);
    t28 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t28, t27, 0, 0, 32, 0LL);
    goto LAB96;

LAB90:    xsi_set_current_line(137, ng0);

LAB98:    xsi_set_current_line(138, ng0);
    t3 = ((char*)((ng1)));
    t12 = (t0 + 3536U);
    t13 = *((char **)t12);
    memset(t30, 0, 8);
    t12 = (t30 + 4);
    t14 = (t13 + 4);
    t6 = *((unsigned int *)t13);
    t7 = (t6 >> 0);
    *((unsigned int *)t30) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t10 & 255U);
    t15 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t15 & 255U);
    t21 = ((char*)((ng1)));
    xsi_vlogtype_concat(t27, 32, 32, 3U, t21, 16, t30, 8, t3, 8);
    t25 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t25, t27, 0, 0, 32, 0LL);
    goto LAB96;

LAB92:    xsi_set_current_line(140, ng0);

LAB99:    xsi_set_current_line(141, ng0);
    t3 = ((char*)((ng1)));
    t12 = (t0 + 3536U);
    t13 = *((char **)t12);
    memset(t30, 0, 8);
    t12 = (t30 + 4);
    t14 = (t13 + 4);
    t6 = *((unsigned int *)t13);
    t7 = (t6 >> 0);
    *((unsigned int *)t30) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t10 & 255U);
    t15 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t15 & 255U);
    t21 = ((char*)((ng1)));
    xsi_vlogtype_concat(t27, 32, 32, 3U, t21, 8, t30, 8, t3, 16);
    t25 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t25, t27, 0, 0, 32, 0LL);
    goto LAB96;

LAB94:    xsi_set_current_line(143, ng0);

LAB100:    xsi_set_current_line(144, ng0);
    t3 = ((char*)((ng1)));
    t12 = (t0 + 3536U);
    t13 = *((char **)t12);
    memset(t30, 0, 8);
    t12 = (t30 + 4);
    t14 = (t13 + 4);
    t6 = *((unsigned int *)t13);
    t7 = (t6 >> 0);
    *((unsigned int *)t30) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t10 & 255U);
    t15 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t15 & 255U);
    xsi_vlogtype_concat(t27, 32, 32, 2U, t30, 8, t3, 24);
    t21 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t21, t27, 0, 0, 32, 0LL);
    goto LAB96;

LAB103:    xsi_set_current_line(150, ng0);

LAB112:    xsi_set_current_line(151, ng0);
    t21 = (t0 + 3536U);
    t25 = *((char **)t21);
    memset(t63, 0, 8);
    t21 = (t63 + 4);
    t26 = (t25 + 4);
    t16 = *((unsigned int *)t25);
    t17 = (t16 >> 0);
    *((unsigned int *)t63) = t17;
    t18 = *((unsigned int *)t26);
    t19 = (t18 >> 0);
    *((unsigned int *)t21) = t19;
    t20 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t20 & 65535U);
    t29 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t29 & 65535U);
    t28 = ((char*)((ng1)));
    xsi_vlogtype_concat(t30, 32, 32, 2U, t28, 16, t63, 16);
    t34 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t34, t30, 0, 0, 32, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = ((char*)((ng18)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB111;

LAB105:    xsi_set_current_line(154, ng0);

LAB113:    xsi_set_current_line(155, ng0);
    t3 = ((char*)((ng1)));
    t12 = (t0 + 3536U);
    t13 = *((char **)t12);
    memset(t63, 0, 8);
    t12 = (t63 + 4);
    t14 = (t13 + 4);
    t6 = *((unsigned int *)t13);
    t7 = (t6 >> 0);
    *((unsigned int *)t63) = t7;
    t8 = *((unsigned int *)t14);
    t9 = (t8 >> 0);
    *((unsigned int *)t12) = t9;
    t10 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t10 & 65535U);
    t15 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t15 & 65535U);
    t21 = ((char*)((ng1)));
    xsi_vlogtype_concat(t30, 32, 32, 3U, t21, 8, t63, 16, t3, 8);
    t25 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t25, t30, 0, 0, 32, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng19)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB111;

LAB107:    xsi_set_current_line(158, ng0);

LAB114:    xsi_set_current_line(159, ng0);
    t3 = (t0 + 3536U);
    t12 = *((char **)t3);
    memset(t63, 0, 8);
    t3 = (t63 + 4);
    t13 = (t12 + 4);
    t6 = *((unsigned int *)t12);
    t7 = (t6 >> 0);
    *((unsigned int *)t63) = t7;
    t8 = *((unsigned int *)t13);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t63);
    *((unsigned int *)t63) = (t10 & 65535U);
    t15 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t15 & 65535U);
    t14 = ((char*)((ng1)));
    xsi_vlogtype_concat(t30, 32, 32, 2U, t14, 16, t63, 16);
    t21 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t21, t30, 0, 0, 32, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = ((char*)((ng20)));
    t3 = (t0 + 4576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB111;

}


extern void work_m_00000000001870577397_3527429779_init()
{
	static char *pe[] = {(void *)Initial_25_0,(void *)Cont_29_1,(void *)Cont_30_2,(void *)Cont_31_3,(void *)Cont_32_4,(void *)Cont_33_5,(void *)NetDecl_51_6,(void *)NetDecl_54_7,(void *)Always_61_8,(void *)Always_74_9};
	xsi_register_didat("work_m_00000000001870577397_3527429779", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000001870577397_3527429779.didat");
	xsi_register_executes(pe);
}
