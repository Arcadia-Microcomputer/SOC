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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/FIFO.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};
static int ng3[] = {1095521093, 0, 70, 0};
static int ng4[] = {1414681925, 0, 0, 0};
static unsigned int ng5[] = {9U, 8U};
static unsigned int ng6[] = {6U, 4U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {11U, 0U};
static unsigned int ng9[] = {7U, 0U};



static void Cont_34_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
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
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 5288U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 4208);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 1016);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t6 + 4);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t8);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t7);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t9) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t9 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t9);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 6992);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 6848);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t23 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng2)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}

static void Cont_35_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
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
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 5536U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 4208);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng2)));
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
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 7056);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 6864);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng2)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t35, 32, t40, 32);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}

static void Cont_37_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 5784U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 4208);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 608);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t6 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t10 = (t8 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t6) < *((unsigned int *)t8))
        goto LAB7;

LAB6:    *((unsigned int *)t9) = 1;

LAB7:    memset(t4, 0, 8);
    t12 = (t9 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t9);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB12:    t19 = (t4 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t19) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t28, 8);

LAB21:    t29 = (t0 + 7120);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 1U;
    t35 = t34;
    t36 = (t3 + 4);
    t37 = *((unsigned int *)t3);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t42 = (t0 + 6880);
    *((int *)t42) = 1;

LAB1:    return;
LAB5:    t11 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t18 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB12;

LAB13:    t23 = ((char*)((ng1)));
    goto LAB14;

LAB15:    t28 = ((char*)((ng2)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 32, t23, 32, t28, 32);
    goto LAB21;

LAB19:    memcpy(t3, t23, 8);
    goto LAB21;

}

static void Cont_38_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t9[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;

LAB0:    t1 = (t0 + 6032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 4208);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t0 + 744);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t6 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t10 = (t8 + 4);
    if (*((unsigned int *)t10) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t6) > *((unsigned int *)t8))
        goto LAB7;

LAB6:    *((unsigned int *)t9) = 1;

LAB7:    memset(t4, 0, 8);
    t12 = (t9 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t9);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t12) != 0)
        goto LAB11;

LAB12:    t19 = (t4 + 4);
    t20 = *((unsigned int *)t4);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB13;

LAB14:    t24 = *((unsigned int *)t4);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t19) > 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t4) > 0)
        goto LAB19;

LAB20:    memcpy(t3, t28, 8);

LAB21:    t29 = (t0 + 7184);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 1U;
    t35 = t34;
    t36 = (t3 + 4);
    t37 = *((unsigned int *)t3);
    t34 = (t34 & t37);
    t38 = *((unsigned int *)t36);
    t35 = (t35 & t38);
    t39 = (t33 + 4);
    t40 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t40 | t34);
    t41 = *((unsigned int *)t39);
    *((unsigned int *)t39) = (t41 | t35);
    xsi_driver_vfirst_trans(t29, 0, 0);
    t42 = (t0 + 6896);
    *((int *)t42) = 1;

LAB1:    return;
LAB5:    t11 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t4) = 1;
    goto LAB12;

LAB11:    t18 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB12;

LAB13:    t23 = ((char*)((ng1)));
    goto LAB14;

LAB15:    t28 = ((char*)((ng2)));
    goto LAB16;

LAB17:    xsi_vlog_unsigned_bit_combine(t3, 32, t23, 32, t28, 32);
    goto LAB21;

LAB19:    memcpy(t3, t23, 8);
    goto LAB21;

}

static void Initial_41_4(char *t0)
{
    char t6[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(41, ng0);

LAB2:    xsi_set_current_line(42, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3248);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(44, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3408);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(45, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 3568);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(48, ng0);
    xsi_set_current_line(48, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 4368);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 4368);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 1016);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    xsi_vlog_signed_less(t6, 32, t3, 32, t5, 32);
    t4 = (t6 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(48, ng0);

LAB6:    xsi_set_current_line(49, ng0);
    t12 = ((char*)((ng2)));
    t13 = (t0 + 3728);
    t16 = (t0 + 3728);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 3728);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 4368);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 4368);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t3, 32, t4, 32);
    t5 = (t0 + 4368);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t13, t12, 0, *((unsigned int *)t15), t35);
    goto LAB8;

}

static void Always_53_5(char *t0)
{
    char t20[8];
    char t21[8];
    char t32[16];
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
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    int t26;
    char *t27;
    int t28;
    int t29;
    int t30;
    int t31;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;

LAB0:    t1 = (t0 + 6528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 6912);
    *((int *)t2) = 1;
    t3 = (t0 + 6560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(53, ng0);

LAB5:    xsi_set_current_line(54, ng0);
    t4 = (t0 + 1888U);
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
LAB8:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng3)));
    t3 = ((char*)((ng4)));
    xsi_vlog_unsigned_equal(t32, 40, t2, 40, t3, 40);
    t4 = (t32 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t32);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB17;

LAB18:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng3)));
    t3 = ((char*)((ng3)));
    xsi_vlog_unsigned_equal(t32, 40, t2, 40, t3, 40);
    t4 = (t32 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t32);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB30;

LAB31:
LAB32:
LAB19:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 1888U);
    t3 = *((char **)t2);
    t2 = (t0 + 2208U);
    t4 = *((char **)t2);
    t2 = (t0 + 2368U);
    t5 = *((char **)t2);
    t2 = (t0 + 2528U);
    t11 = *((char **)t2);
    xsi_vlogtype_concat(t20, 4, 4, 4U, t11, 1, t5, 1, t4, 1, t3, 1);

LAB43:    t2 = ((char*)((ng5)));
    t26 = xsi_vlog_unsigned_case_xcompare(t20, 4, t2, 4);
    if (t26 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng6)));
    t26 = xsi_vlog_unsigned_case_xcompare(t20, 4, t2, 4);
    if (t26 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng7)));
    t26 = xsi_vlog_unsigned_case_xcompare(t20, 4, t2, 4);
    if (t26 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng8)));
    t26 = xsi_vlog_unsigned_case_xcompare(t20, 4, t2, 4);
    if (t26 == 1)
        goto LAB50;

LAB51:    t2 = ((char*)((ng9)));
    t26 = xsi_vlog_unsigned_case_xcompare(t20, 4, t2, 4);
    if (t26 == 1)
        goto LAB52;

LAB53:
LAB55:
LAB54:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 4208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 5, 0LL);

LAB56:    goto LAB2;

LAB6:    xsi_set_current_line(54, ng0);

LAB9:    xsi_set_current_line(55, ng0);
    t11 = (t0 + 2368U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t13 = *((unsigned int *)t11);
    t14 = (~(t13));
    t15 = *((unsigned int *)t12);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(57, ng0);

LAB14:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_add(t20, 32, t4, 4, t5, 32);
    t11 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t11, t20, 0, 0, 4, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2048U);
    t3 = *((char **)t2);
    t2 = (t0 + 3728);
    t4 = (t0 + 3728);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 3728);
    t18 = (t12 + 64U);
    t19 = *((char **)t18);
    t22 = (t0 + 3888);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t20, t21, t11, t19, 2, 1, t24, 4, 2);
    t25 = (t20 + 4);
    t6 = *((unsigned int *)t25);
    t26 = (!(t6));
    t27 = (t21 + 4);
    t7 = *((unsigned int *)t27);
    t28 = (!(t7));
    t29 = (t26 && t28);
    if (t29 == 1)
        goto LAB15;

LAB16:
LAB12:    goto LAB8;

LAB10:    xsi_set_current_line(55, ng0);

LAB13:    xsi_set_current_line(56, ng0);
    t18 = ((char*)((ng1)));
    t19 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 1, 0LL);
    goto LAB12;

LAB15:    t8 = *((unsigned int *)t20);
    t9 = *((unsigned int *)t21);
    t30 = (t8 - t9);
    t31 = (t30 + 1);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, *((unsigned int *)t21), t31, 0LL);
    goto LAB16;

LAB17:    xsi_set_current_line(64, ng0);

LAB20:    xsi_set_current_line(65, ng0);
    t5 = (t0 + 3728);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t18 = (t0 + 3728);
    t19 = (t18 + 72U);
    t22 = *((char **)t19);
    t23 = (t0 + 3728);
    t24 = (t23 + 64U);
    t25 = *((char **)t24);
    t27 = (t0 + 4048);
    t33 = (t27 + 56U);
    t34 = *((char **)t33);
    xsi_vlog_generic_get_array_select_value(t20, 8, t12, t22, t25, 2, 1, t34, 4, 2);
    t35 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t35, t20, 0, 0, 8, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB21;

LAB22:
LAB23:    goto LAB19;

LAB21:    xsi_set_current_line(67, ng0);

LAB24:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 2528U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t13 = *((unsigned int *)t4);
    t14 = (~(t13));
    t15 = *((unsigned int *)t5);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB25;

LAB26:    xsi_set_current_line(70, ng0);

LAB29:    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 4048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_add(t20, 32, t4, 4, t5, 32);
    t11 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t11, t20, 0, 0, 4, 0LL);

LAB27:    goto LAB23;

LAB25:    xsi_set_current_line(68, ng0);

LAB28:    xsi_set_current_line(69, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    goto LAB27;

LAB30:    xsi_set_current_line(75, ng0);

LAB33:    xsi_set_current_line(76, ng0);
    t5 = (t0 + 2208U);
    t11 = *((char **)t5);
    t5 = (t11 + 4);
    t13 = *((unsigned int *)t5);
    t14 = (~(t13));
    t15 = *((unsigned int *)t11);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB34;

LAB35:
LAB36:    goto LAB32;

LAB34:    xsi_set_current_line(76, ng0);

LAB37:    xsi_set_current_line(77, ng0);
    t12 = (t0 + 2528U);
    t18 = *((char **)t12);
    t12 = (t18 + 4);
    t36 = *((unsigned int *)t12);
    t37 = (~(t36));
    t38 = *((unsigned int *)t18);
    t39 = (t38 & t37);
    t40 = (t39 != 0);
    if (t40 > 0)
        goto LAB38;

LAB39:    xsi_set_current_line(79, ng0);

LAB42:    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 4048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_add(t20, 32, t4, 4, t5, 32);
    t11 = (t0 + 4048);
    xsi_vlogvar_wait_assign_value(t11, t20, 0, 0, 4, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3728);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t18 = (t0 + 3728);
    t19 = (t18 + 64U);
    t22 = *((char **)t19);
    t23 = (t0 + 4048);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_get_array_select_value(t20, 8, t4, t12, t22, 2, 1, t25, 4, 2);
    t27 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t27, t20, 0, 0, 8, 0LL);

LAB40:    goto LAB36;

LAB38:    xsi_set_current_line(77, ng0);

LAB41:    xsi_set_current_line(78, ng0);
    t19 = ((char*)((ng1)));
    t22 = (t0 + 3568);
    xsi_vlogvar_wait_assign_value(t22, t19, 0, 0, 1, 0LL);
    goto LAB40;

LAB44:    xsi_set_current_line(88, ng0);
    t12 = (t0 + 4208);
    t18 = (t12 + 56U);
    t19 = *((char **)t18);
    t22 = ((char*)((ng1)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 32, t19, 5, t22, 32);
    t23 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t23, t21, 0, 0, 5, 0LL);
    goto LAB56;

LAB46:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 4208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng1)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_minus(t21, 32, t5, 5, t11, 32);
    t12 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t12, t21, 0, 0, 5, 0LL);
    goto LAB56;

LAB48:    xsi_set_current_line(90, ng0);
    t3 = (t0 + 4208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 5, 0LL);
    goto LAB56;

LAB50:    xsi_set_current_line(91, ng0);
    t3 = (t0 + 4208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng1)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_add(t21, 32, t5, 5, t11, 32);
    t12 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t12, t21, 0, 0, 5, 0LL);
    goto LAB56;

LAB52:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 4208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng1)));
    memset(t21, 0, 8);
    xsi_vlog_unsigned_minus(t21, 32, t5, 5, t11, 32);
    t12 = (t0 + 4208);
    xsi_vlogvar_wait_assign_value(t12, t21, 0, 0, 5, 0LL);
    goto LAB56;

}


extern void work_m_00000000003092227098_1552958983_init()
{
	static char *pe[] = {(void *)Cont_34_0,(void *)Cont_35_1,(void *)Cont_37_2,(void *)Cont_38_3,(void *)Initial_41_4,(void *)Always_53_5};
	xsi_register_didat("work_m_00000000003092227098_1552958983", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000003092227098_1552958983.didat");
	xsi_register_executes(pe);
}
