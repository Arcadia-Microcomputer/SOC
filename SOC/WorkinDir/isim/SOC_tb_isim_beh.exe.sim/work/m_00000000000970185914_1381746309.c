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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/Flash/FlashControler.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static unsigned int ng3[] = {0U, 1U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {6U, 0U};
static int ng6[] = {2, 0};
static unsigned int ng7[] = {80U, 0U};
static unsigned int ng8[] = {32U, 0U};
static unsigned int ng9[] = {216U, 0U};
static unsigned int ng10[] = {199U, 0U};
static unsigned int ng11[] = {2U, 0U};
static unsigned int ng12[] = {3U, 0U};
static unsigned int ng13[] = {5U, 0U};
static unsigned int ng14[] = {53U, 0U};
static int ng15[] = {3, 0};
static unsigned int ng16[] = {21U, 0U};
static unsigned int ng17[] = {49U, 0U};
static unsigned int ng18[] = {17U, 0U};
static int ng19[] = {7, 0};
static int ng20[] = {6, 0};
static unsigned int ng21[] = {0U, 0U};



static void Initial_23_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(23, ng0);

LAB2:    xsi_set_current_line(24, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7016);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(25, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7336);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(26, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7176);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);
    xsi_set_current_line(27, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 7496);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Cont_60_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
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
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;

LAB0:    t1 = (t0 + 10744U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 7656);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 3);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 3);
    t15 = (t14 & 1);
    *((unsigned int *)t8) = t15;
    memset(t4, 0, 8);
    t16 = (t7 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t7);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t16) != 0)
        goto LAB6;

LAB7:    t23 = (t4 + 4);
    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t23);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB8;

LAB9:    t39 = *((unsigned int *)t4);
    t40 = (~(t39));
    t41 = *((unsigned int *)t23);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t43, 8);

LAB16:    t44 = (t0 + 13224);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 1U;
    t50 = t49;
    t51 = (t3 + 4);
    t52 = *((unsigned int *)t3);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 3, 3);
    t57 = (t0 + 13048);
    *((int *)t57) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t22 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 7816);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t30, 0, 8);
    t31 = (t30 + 4);
    t32 = (t29 + 4);
    t33 = *((unsigned int *)t29);
    t34 = (t33 >> 3);
    t35 = (t34 & 1);
    *((unsigned int *)t30) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 >> 3);
    t38 = (t37 & 1);
    *((unsigned int *)t31) = t38;
    goto LAB9;

LAB10:    t43 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t30, 1, t43, 1);
    goto LAB16;

LAB14:    memcpy(t3, t30, 8);
    goto LAB16;

}

static void Cont_61_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
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
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;

LAB0:    t1 = (t0 + 10992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 7656);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 2);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 2);
    t15 = (t14 & 1);
    *((unsigned int *)t8) = t15;
    memset(t4, 0, 8);
    t16 = (t7 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t7);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t16) != 0)
        goto LAB6;

LAB7:    t23 = (t4 + 4);
    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t23);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB8;

LAB9:    t39 = *((unsigned int *)t4);
    t40 = (~(t39));
    t41 = *((unsigned int *)t23);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t43, 8);

LAB16:    t44 = (t0 + 13288);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 1U;
    t50 = t49;
    t51 = (t3 + 4);
    t52 = *((unsigned int *)t3);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 2, 2);
    t57 = (t0 + 13064);
    *((int *)t57) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t22 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 7816);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t30, 0, 8);
    t31 = (t30 + 4);
    t32 = (t29 + 4);
    t33 = *((unsigned int *)t29);
    t34 = (t33 >> 2);
    t35 = (t34 & 1);
    *((unsigned int *)t30) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 >> 2);
    t38 = (t37 & 1);
    *((unsigned int *)t31) = t38;
    goto LAB9;

LAB10:    t43 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t30, 1, t43, 1);
    goto LAB16;

LAB14:    memcpy(t3, t30, 8);
    goto LAB16;

}

static void Cont_62_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
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
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;

LAB0:    t1 = (t0 + 11240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 7656);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 1);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 1);
    t15 = (t14 & 1);
    *((unsigned int *)t8) = t15;
    memset(t4, 0, 8);
    t16 = (t7 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t7);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t16) != 0)
        goto LAB6;

LAB7:    t23 = (t4 + 4);
    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t23);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB8;

LAB9:    t39 = *((unsigned int *)t4);
    t40 = (~(t39));
    t41 = *((unsigned int *)t23);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t43, 8);

LAB16:    t44 = (t0 + 13352);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 1U;
    t50 = t49;
    t51 = (t3 + 4);
    t52 = *((unsigned int *)t3);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 1, 1);
    t57 = (t0 + 13080);
    *((int *)t57) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t22 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 7816);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t30, 0, 8);
    t31 = (t30 + 4);
    t32 = (t29 + 4);
    t33 = *((unsigned int *)t29);
    t34 = (t33 >> 1);
    t35 = (t34 & 1);
    *((unsigned int *)t30) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 >> 1);
    t38 = (t37 & 1);
    *((unsigned int *)t31) = t38;
    goto LAB9;

LAB10:    t43 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t30, 1, t43, 1);
    goto LAB16;

LAB14:    memcpy(t3, t30, 8);
    goto LAB16;

}

static void Cont_63_4(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
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
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;

LAB0:    t1 = (t0 + 11488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 7656);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t8 = (t7 + 4);
    t9 = (t6 + 4);
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    t12 = (t11 & 1);
    *((unsigned int *)t7) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 0);
    t15 = (t14 & 1);
    *((unsigned int *)t8) = t15;
    memset(t4, 0, 8);
    t16 = (t7 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t7);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t16) != 0)
        goto LAB6;

LAB7:    t23 = (t4 + 4);
    t24 = *((unsigned int *)t4);
    t25 = *((unsigned int *)t23);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB8;

LAB9:    t39 = *((unsigned int *)t4);
    t40 = (~(t39));
    t41 = *((unsigned int *)t23);
    t42 = (t40 || t41);
    if (t42 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t23) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t43, 8);

LAB16:    t44 = (t0 + 13416);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memset(t48, 0, 8);
    t49 = 1U;
    t50 = t49;
    t51 = (t3 + 4);
    t52 = *((unsigned int *)t3);
    t49 = (t49 & t52);
    t53 = *((unsigned int *)t51);
    t50 = (t50 & t53);
    t54 = (t48 + 4);
    t55 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t55 | t49);
    t56 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t56 | t50);
    xsi_driver_vfirst_trans(t44, 0, 0);
    t57 = (t0 + 13096);
    *((int *)t57) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t22 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB7;

LAB8:    t27 = (t0 + 7816);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t30, 0, 8);
    t31 = (t30 + 4);
    t32 = (t29 + 4);
    t33 = *((unsigned int *)t29);
    t34 = (t33 >> 0);
    t35 = (t34 & 1);
    *((unsigned int *)t30) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 >> 0);
    t38 = (t37 & 1);
    *((unsigned int *)t31) = t38;
    goto LAB9;

LAB10:    t43 = ((char*)((ng3)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t30, 1, t43, 1);
    goto LAB16;

LAB14:    memcpy(t3, t30, 8);
    goto LAB16;

}

static void Cont_96_5(char *t0)
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

LAB0:    t1 = (t0 + 11736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 5016U);
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

LAB9:    t17 = *((unsigned int *)t4);
    t18 = (~(t17));
    t19 = *((unsigned int *)t12);
    t20 = (t18 || t19);
    if (t20 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t12) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t23, 8);

LAB16:    t24 = (t0 + 13480);
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
    t37 = (t0 + 13112);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t11 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB7;

LAB8:    t16 = ((char*)((ng4)));
    goto LAB9;

LAB10:    t21 = (t0 + 9576);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t16, 1, t23, 1);
    goto LAB16;

LAB14:    memcpy(t3, t16, 8);
    goto LAB16;

}

static void Always_98_6(char *t0)
{
    char t16[8];
    char t24[8];
    char t26[8];
    char t52[8];
    char t59[8];
    char t89[8];
    char t101[8];
    char t112[8];
    char t120[8];
    char t152[8];
    char t167[8];
    char t175[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    char *t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t102;
    char *t103;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    char *t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    char *t119;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    char *t124;
    char *t125;
    char *t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t134;
    char *t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    int t144;
    int t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    char *t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    char *t159;
    char *t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    char *t164;
    char *t165;
    char *t166;
    char *t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    unsigned int t173;
    char *t174;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    char *t179;
    char *t180;
    char *t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    char *t189;
    char *t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    int t199;
    int t200;
    unsigned int t201;
    unsigned int t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    char *t207;
    unsigned int t208;
    unsigned int t209;
    unsigned int t210;
    unsigned int t211;
    unsigned int t212;
    char *t213;
    char *t214;

LAB0:    t1 = (t0 + 11984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 13128);
    *((int *)t2) = 1;
    t3 = (t0 + 12016);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(98, ng0);

LAB5:    xsi_set_current_line(99, ng0);
    t4 = (t0 + 7976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = (t0 + 3872);
    t8 = *((char **)t7);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t8, 32);
    if (t9 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 4008);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t4, 32);
    if (t9 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 4144);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t6, 2, t4, 32);
    if (t9 == 1)
        goto LAB11;

LAB12:
LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(100, ng0);

LAB14:    xsi_set_current_line(101, ng0);
    t7 = ((char*)((ng2)));
    t10 = (t0 + 7496);
    xsi_vlogvar_wait_assign_value(t10, t7, 0, 0, 1, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8936);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(104, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7336);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 5016U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t3);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB15;

LAB16:
LAB17:    goto LAB13;

LAB9:    xsi_set_current_line(185, ng0);

LAB72:    xsi_set_current_line(186, ng0);
    t2 = ((char*)((ng2)));
    t8 = (t0 + 8936);
    xsi_vlogvar_wait_assign_value(t8, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 7176);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(190, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 7656);
    t8 = (t0 + 7656);
    t10 = (t8 + 72U);
    t17 = *((char **)t10);
    t19 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t16, t17, 2, t19, 32, 1);
    t20 = (t16 + 4);
    t11 = *((unsigned int *)t20);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB73;

LAB74:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 8296);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t10 = (t0 + 8296);
    t17 = (t10 + 72U);
    t19 = *((char **)t17);
    t20 = ((char*)((ng19)));
    t21 = (t0 + 8456);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memset(t24, 0, 8);
    xsi_vlog_unsigned_minus(t24, 32, t20, 32, t23, 3);
    xsi_vlog_generic_get_index_select_value(t16, 1, t8, t19, 2, t24, 32, 2);
    t25 = (t0 + 7816);
    t27 = (t0 + 7816);
    t28 = (t27 + 72U);
    t29 = *((char **)t28);
    t30 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t26, t29, 2, t30, 32, 1);
    t31 = (t26 + 4);
    t11 = *((unsigned int *)t31);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB75;

LAB76:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t10 = ((char*)((ng2)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_add(t16, 32, t8, 3, t10, 32);
    t17 = (t0 + 8456);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 3, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t10 = ((char*)((ng2)));
    memset(t16, 0, 8);
    t17 = (t8 + 4);
    t19 = (t10 + 4);
    t11 = *((unsigned int *)t8);
    t12 = *((unsigned int *)t10);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t17);
    t15 = *((unsigned int *)t19);
    t32 = (t14 ^ t15);
    t33 = (t13 | t32);
    t34 = *((unsigned int *)t17);
    t35 = *((unsigned int *)t19);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB80;

LAB77:    if (t36 != 0)
        goto LAB79;

LAB78:    *((unsigned int *)t16) = 1;

LAB80:    memset(t24, 0, 8);
    t21 = (t16 + 4);
    t39 = *((unsigned int *)t21);
    t40 = (~(t39));
    t41 = *((unsigned int *)t16);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t21) != 0)
        goto LAB83;

LAB84:    t23 = (t24 + 4);
    t44 = *((unsigned int *)t24);
    t45 = *((unsigned int *)t23);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB85;

LAB86:    memcpy(t59, t24, 8);

LAB87:    memset(t89, 0, 8);
    t90 = (t59 + 4);
    t91 = *((unsigned int *)t90);
    t92 = (~(t91));
    t93 = *((unsigned int *)t59);
    t94 = (t93 & t92);
    t95 = (t94 & 1U);
    if (t95 != 0)
        goto LAB99;

LAB100:    if (*((unsigned int *)t90) != 0)
        goto LAB101;

LAB102:    t97 = (t89 + 4);
    t98 = *((unsigned int *)t89);
    t99 = *((unsigned int *)t97);
    t100 = (t98 || t99);
    if (t100 > 0)
        goto LAB103;

LAB104:    memcpy(t120, t89, 8);

LAB105:    memset(t152, 0, 8);
    t153 = (t120 + 4);
    t154 = *((unsigned int *)t153);
    t155 = (~(t154));
    t156 = *((unsigned int *)t120);
    t157 = (t156 & t155);
    t158 = (t157 & 1U);
    if (t158 != 0)
        goto LAB117;

LAB118:    if (*((unsigned int *)t153) != 0)
        goto LAB119;

LAB120:    t160 = (t152 + 4);
    t161 = *((unsigned int *)t152);
    t162 = *((unsigned int *)t160);
    t163 = (t161 || t162);
    if (t163 > 0)
        goto LAB121;

LAB122:    memcpy(t175, t152, 8);

LAB123:    t207 = (t175 + 4);
    t208 = *((unsigned int *)t207);
    t209 = (~(t208));
    t210 = *((unsigned int *)t175);
    t211 = (t210 & t209);
    t212 = (t211 != 0);
    if (t212 > 0)
        goto LAB131;

LAB132:
LAB133:    xsi_set_current_line(203, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t10 = ((char*)((ng19)));
    memset(t16, 0, 8);
    t17 = (t8 + 4);
    t19 = (t10 + 4);
    t11 = *((unsigned int *)t8);
    t12 = *((unsigned int *)t10);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t17);
    t15 = *((unsigned int *)t19);
    t32 = (t14 ^ t15);
    t33 = (t13 | t32);
    t34 = *((unsigned int *)t17);
    t35 = *((unsigned int *)t19);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB138;

LAB135:    if (t36 != 0)
        goto LAB137;

LAB136:    *((unsigned int *)t16) = 1;

LAB138:    t21 = (t16 + 4);
    t39 = *((unsigned int *)t21);
    t40 = (~(t39));
    t41 = *((unsigned int *)t16);
    t42 = (t41 & t40);
    t43 = (t42 != 0);
    if (t43 > 0)
        goto LAB139;

LAB140:
LAB141:    goto LAB13;

LAB11:    xsi_set_current_line(247, ng0);

LAB247:    xsi_set_current_line(248, ng0);
    t2 = ((char*)((ng2)));
    t10 = (t0 + 8936);
    xsi_vlogvar_wait_assign_value(t10, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(249, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 7336);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(250, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 7656);
    t10 = (t0 + 7656);
    t17 = (t10 + 72U);
    t19 = *((char **)t17);
    t20 = ((char*)((ng1)));
    xsi_vlog_generic_convert_bit_index(t16, t19, 2, t20, 32, 1);
    t21 = (t16 + 4);
    t11 = *((unsigned int *)t21);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB248;

LAB249:    xsi_set_current_line(253, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = ((char*)((ng20)));
    memset(t16, 0, 8);
    t19 = (t10 + 4);
    t20 = (t17 + 4);
    t11 = *((unsigned int *)t10);
    t12 = *((unsigned int *)t17);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t19);
    t15 = *((unsigned int *)t20);
    t32 = (t14 ^ t15);
    t33 = (t13 | t32);
    t34 = *((unsigned int *)t19);
    t35 = *((unsigned int *)t20);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB253;

LAB250:    if (t36 != 0)
        goto LAB252;

LAB251:    *((unsigned int *)t16) = 1;

LAB253:    memset(t24, 0, 8);
    t22 = (t16 + 4);
    t39 = *((unsigned int *)t22);
    t40 = (~(t39));
    t41 = *((unsigned int *)t16);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB254;

LAB255:    if (*((unsigned int *)t22) != 0)
        goto LAB256;

LAB257:    t25 = (t24 + 4);
    t44 = *((unsigned int *)t24);
    t45 = *((unsigned int *)t25);
    t46 = (t44 || t45);
    if (t46 > 0)
        goto LAB258;

LAB259:    memcpy(t52, t24, 8);

LAB260:    t74 = (t52 + 4);
    t84 = *((unsigned int *)t74);
    t85 = (~(t84));
    t86 = *((unsigned int *)t52);
    t87 = (t86 & t85);
    t88 = (t87 != 0);
    if (t88 > 0)
        goto LAB268;

LAB269:
LAB270:    xsi_set_current_line(258, ng0);
    t2 = (t0 + 9256);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = ((char*)((ng1)));
    memset(t16, 0, 8);
    t19 = (t10 + 4);
    t20 = (t17 + 4);
    t11 = *((unsigned int *)t10);
    t12 = *((unsigned int *)t17);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t19);
    t15 = *((unsigned int *)t20);
    t32 = (t14 ^ t15);
    t33 = (t13 | t32);
    t34 = *((unsigned int *)t19);
    t35 = *((unsigned int *)t20);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB273;

LAB272:    if (t36 != 0)
        goto LAB274;

LAB275:    t22 = (t16 + 4);
    t39 = *((unsigned int *)t22);
    t40 = (~(t39));
    t41 = *((unsigned int *)t16);
    t42 = (t41 & t40);
    t43 = (t42 != 0);
    if (t43 > 0)
        goto LAB276;

LAB277:    xsi_set_current_line(260, ng0);

LAB280:    xsi_set_current_line(262, ng0);
    t2 = (t0 + 6136U);
    t4 = *((char **)t2);
    memset(t16, 0, 8);
    t2 = (t16 + 4);
    t10 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t16) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 1);
    t32 = (t15 & 1);
    *((unsigned int *)t2) = t32;
    t17 = (t0 + 8296);
    t19 = (t0 + 8296);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng19)));
    t23 = (t0 + 8456);
    t25 = (t23 + 56U);
    t27 = *((char **)t25);
    memset(t26, 0, 8);
    xsi_vlog_unsigned_minus(t26, 32, t22, 32, t27, 3);
    xsi_vlog_generic_convert_bit_index(t24, t21, 2, t26, 32, 2);
    t28 = (t24 + 4);
    t33 = *((unsigned int *)t28);
    t9 = (!(t33));
    if (t9 == 1)
        goto LAB281;

LAB282:    xsi_set_current_line(263, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = ((char*)((ng2)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_add(t16, 32, t10, 3, t17, 32);
    t19 = (t0 + 8456);
    xsi_vlogvar_wait_assign_value(t19, t16, 0, 0, 3, 0LL);
    xsi_set_current_line(266, ng0);
    t2 = (t0 + 8456);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = ((char*)((ng19)));
    memset(t16, 0, 8);
    t19 = (t10 + 4);
    t20 = (t17 + 4);
    t11 = *((unsigned int *)t10);
    t12 = *((unsigned int *)t17);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t19);
    t15 = *((unsigned int *)t20);
    t32 = (t14 ^ t15);
    t33 = (t13 | t32);
    t34 = *((unsigned int *)t19);
    t35 = *((unsigned int *)t20);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB286;

LAB283:    if (t36 != 0)
        goto LAB285;

LAB284:    *((unsigned int *)t16) = 1;

LAB286:    t22 = (t16 + 4);
    t39 = *((unsigned int *)t22);
    t40 = (~(t39));
    t41 = *((unsigned int *)t16);
    t42 = (t41 & t40);
    t43 = (t42 != 0);
    if (t43 > 0)
        goto LAB287;

LAB288:
LAB289:
LAB278:    goto LAB13;

LAB15:    xsi_set_current_line(108, ng0);

LAB18:    xsi_set_current_line(109, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 7496);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4008);
    t3 = *((char **)t2);
    t2 = (t0 + 7976);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8776);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9096);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 9576);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 5176U);
    t3 = *((char **)t2);

LAB19:    t2 = (t0 + 472);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB20;

LAB21:    t2 = (t0 + 608);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB22;

LAB23:    t2 = (t0 + 744);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB24;

LAB25:    t2 = (t0 + 880);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB26;

LAB27:    t2 = (t0 + 1016);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB28;

LAB29:    t2 = (t0 + 1152);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB30;

LAB31:    t2 = (t0 + 1288);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB32;

LAB33:    t2 = (t0 + 1424);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB34;

LAB35:    t2 = (t0 + 1560);
    t4 = *((char **)t2);
    t9 = xsi_vlog_unsigned_case_compare(t3, 3, t4, 32);
    if (t9 == 1)
        goto LAB36;

LAB37:
LAB38:    goto LAB17;

LAB20:    xsi_set_current_line(116, ng0);

LAB39:    xsi_set_current_line(117, ng0);
    t2 = ((char*)((ng5)));
    t5 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(120, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 7656);
    t5 = (t0 + 7656);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t10 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t16, t8, 2, t10, 32, 1);
    t17 = (t16 + 4);
    t11 = *((unsigned int *)t17);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB40;

LAB41:    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 7816);
    t5 = (t0 + 7816);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t10 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t16, t8, 2, t10, 32, 1);
    t17 = (t16 + 4);
    t11 = *((unsigned int *)t17);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB42;

LAB43:    goto LAB38;

LAB22:    xsi_set_current_line(123, ng0);

LAB44:    xsi_set_current_line(124, ng0);
    t2 = ((char*)((ng7)));
    t5 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 7656);
    t5 = (t0 + 7656);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t10 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t16, t8, 2, t10, 32, 1);
    t17 = (t16 + 4);
    t11 = *((unsigned int *)t17);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB45;

LAB46:    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 7816);
    t5 = (t0 + 7816);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t10 = ((char*)((ng6)));
    xsi_vlog_generic_convert_bit_index(t16, t8, 2, t10, 32, 1);
    t17 = (t16 + 4);
    t11 = *((unsigned int *)t17);
    t9 = (!(t11));
    if (t9 == 1)
        goto LAB47;

LAB48:    goto LAB38;

LAB24:    xsi_set_current_line(130, ng0);

LAB49:    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng8)));
    t5 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 8136);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    goto LAB38;

LAB26:    xsi_set_current_line(136, ng0);

LAB50:    xsi_set_current_line(137, ng0);
    t2 = ((char*)((ng9)));
    t5 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 8136);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    goto LAB38;

LAB28:    xsi_set_current_line(142, ng0);

LAB51:    xsi_set_current_line(143, ng0);
    t2 = ((char*)((ng10)));
    t5 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 8, 0LL);
    goto LAB38;

LAB30:    xsi_set_current_line(145, ng0);

LAB52:    xsi_set_current_line(147, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 8776);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(150, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 8136);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(151, ng0);
    t2 = ((char*)((ng11)));
    t4 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 8, 0LL);
    goto LAB38;

LAB32:    xsi_set_current_line(153, ng0);

LAB53:    xsi_set_current_line(155, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 8776);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(158, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 8136);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(159, ng0);
    t2 = ((char*)((ng12)));
    t4 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 9096);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 9256);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 3, 0LL);
    goto LAB38;

LAB34:    xsi_set_current_line(164, ng0);

LAB54:    xsi_set_current_line(165, ng0);
    t2 = (t0 + 5336U);
    t5 = *((char **)t2);

LAB55:    t2 = ((char*)((ng2)));
    t18 = xsi_vlog_unsigned_case_compare(t5, 24, t2, 32);
    if (t18 == 1)
        goto LAB56;

LAB57:    t2 = ((char*)((ng6)));
    t9 = xsi_vlog_unsigned_case_compare(t5, 24, t2, 32);
    if (t9 == 1)
        goto LAB58;

LAB59:    t2 = ((char*)((ng15)));
    t9 = xsi_vlog_unsigned_case_compare(t5, 24, t2, 32);
    if (t9 == 1)
        goto LAB60;

LAB61:
LAB62:    xsi_set_current_line(170, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 9096);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(171, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 9256);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 3, 0LL);
    goto LAB38;

LAB36:    xsi_set_current_line(173, ng0);

LAB63:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 5336U);
    t7 = *((char **)t2);

LAB64:    t2 = ((char*)((ng2)));
    t18 = xsi_vlog_unsigned_case_compare(t7, 24, t2, 32);
    if (t18 == 1)
        goto LAB65;

LAB66:    t2 = ((char*)((ng6)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 24, t2, 32);
    if (t9 == 1)
        goto LAB67;

LAB68:    t2 = ((char*)((ng15)));
    t9 = xsi_vlog_unsigned_case_compare(t7, 24, t2, 32);
    if (t9 == 1)
        goto LAB69;

LAB70:
LAB71:    xsi_set_current_line(180, ng0);
    t2 = ((char*)((ng2)));
    t4 = (t0 + 8776);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    goto LAB38;

LAB40:    xsi_vlogvar_wait_assign_value(t4, t2, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB41;

LAB42:    xsi_vlogvar_wait_assign_value(t4, t2, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB43;

LAB45:    xsi_vlogvar_wait_assign_value(t4, t2, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB46;

LAB47:    xsi_vlogvar_wait_assign_value(t4, t2, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB48;

LAB56:    xsi_set_current_line(166, ng0);
    t7 = ((char*)((ng13)));
    t8 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 8, 0LL);
    goto LAB62;

LAB58:    xsi_set_current_line(167, ng0);
    t4 = ((char*)((ng14)));
    t7 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t7, t4, 0, 0, 8, 0LL);
    goto LAB62;

LAB60:    xsi_set_current_line(168, ng0);
    t4 = ((char*)((ng16)));
    t7 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t7, t4, 0, 0, 8, 0LL);
    goto LAB62;

LAB65:    xsi_set_current_line(175, ng0);
    t8 = ((char*)((ng4)));
    t10 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t10, t8, 0, 0, 8, 0LL);
    goto LAB71;

LAB67:    xsi_set_current_line(176, ng0);
    t4 = ((char*)((ng17)));
    t8 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t8, t4, 0, 0, 8, 0LL);
    goto LAB71;

LAB69:    xsi_set_current_line(177, ng0);
    t4 = ((char*)((ng18)));
    t8 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t8, t4, 0, 0, 8, 0LL);
    goto LAB71;

LAB73:    xsi_vlogvar_wait_assign_value(t4, t2, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB74;

LAB75:    xsi_vlogvar_wait_assign_value(t25, t16, 0, *((unsigned int *)t26), 1, 0LL);
    goto LAB76;

LAB79:    t20 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB80;

LAB81:    *((unsigned int *)t24) = 1;
    goto LAB84;

LAB83:    t22 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB84;

LAB85:    t25 = (t0 + 8136);
    t27 = (t25 + 56U);
    t28 = *((char **)t27);
    memset(t26, 0, 8);
    t29 = (t28 + 4);
    t47 = *((unsigned int *)t29);
    t48 = (~(t47));
    t49 = *((unsigned int *)t28);
    t50 = (t49 & t48);
    t51 = (t50 & 1U);
    if (t51 != 0)
        goto LAB91;

LAB89:    if (*((unsigned int *)t29) == 0)
        goto LAB88;

LAB90:    t30 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t30) = 1;

LAB91:    memset(t52, 0, 8);
    t31 = (t26 + 4);
    t53 = *((unsigned int *)t31);
    t54 = (~(t53));
    t55 = *((unsigned int *)t26);
    t56 = (t55 & t54);
    t57 = (t56 & 1U);
    if (t57 != 0)
        goto LAB92;

LAB93:    if (*((unsigned int *)t31) != 0)
        goto LAB94;

LAB95:    t60 = *((unsigned int *)t24);
    t61 = *((unsigned int *)t52);
    t62 = (t60 & t61);
    *((unsigned int *)t59) = t62;
    t63 = (t24 + 4);
    t64 = (t52 + 4);
    t65 = (t59 + 4);
    t66 = *((unsigned int *)t63);
    t67 = *((unsigned int *)t64);
    t68 = (t66 | t67);
    *((unsigned int *)t65) = t68;
    t69 = *((unsigned int *)t65);
    t70 = (t69 != 0);
    if (t70 == 1)
        goto LAB96;

LAB97:
LAB98:    goto LAB87;

LAB88:    *((unsigned int *)t26) = 1;
    goto LAB91;

LAB92:    *((unsigned int *)t52) = 1;
    goto LAB95;

LAB94:    t58 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB95;

LAB96:    t71 = *((unsigned int *)t59);
    t72 = *((unsigned int *)t65);
    *((unsigned int *)t59) = (t71 | t72);
    t73 = (t24 + 4);
    t74 = (t52 + 4);
    t75 = *((unsigned int *)t24);
    t76 = (~(t75));
    t77 = *((unsigned int *)t73);
    t78 = (~(t77));
    t79 = *((unsigned int *)t52);
    t80 = (~(t79));
    t81 = *((unsigned int *)t74);
    t82 = (~(t81));
    t9 = (t76 & t78);
    t18 = (t80 & t82);
    t83 = (~(t9));
    t84 = (~(t18));
    t85 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t85 & t83);
    t86 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t86 & t84);
    t87 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t87 & t83);
    t88 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t88 & t84);
    goto LAB98;

LAB99:    *((unsigned int *)t89) = 1;
    goto LAB102;

LAB101:    t96 = (t89 + 4);
    *((unsigned int *)t89) = 1;
    *((unsigned int *)t96) = 1;
    goto LAB102;

LAB103:    t102 = (t0 + 9096);
    t103 = (t102 + 56U);
    t104 = *((char **)t103);
    memset(t101, 0, 8);
    t105 = (t104 + 4);
    t106 = *((unsigned int *)t105);
    t107 = (~(t106));
    t108 = *((unsigned int *)t104);
    t109 = (t108 & t107);
    t110 = (t109 & 1U);
    if (t110 != 0)
        goto LAB109;

LAB107:    if (*((unsigned int *)t105) == 0)
        goto LAB106;

LAB108:    t111 = (t101 + 4);
    *((unsigned int *)t101) = 1;
    *((unsigned int *)t111) = 1;

LAB109:    memset(t112, 0, 8);
    t113 = (t101 + 4);
    t114 = *((unsigned int *)t113);
    t115 = (~(t114));
    t116 = *((unsigned int *)t101);
    t117 = (t116 & t115);
    t118 = (t117 & 1U);
    if (t118 != 0)
        goto LAB110;

LAB111:    if (*((unsigned int *)t113) != 0)
        goto LAB112;

LAB113:    t121 = *((unsigned int *)t89);
    t122 = *((unsigned int *)t112);
    t123 = (t121 & t122);
    *((unsigned int *)t120) = t123;
    t124 = (t89 + 4);
    t125 = (t112 + 4);
    t126 = (t120 + 4);
    t127 = *((unsigned int *)t124);
    t128 = *((unsigned int *)t125);
    t129 = (t127 | t128);
    *((unsigned int *)t126) = t129;
    t130 = *((unsigned int *)t126);
    t131 = (t130 != 0);
    if (t131 == 1)
        goto LAB114;

LAB115:
LAB116:    goto LAB105;

LAB106:    *((unsigned int *)t101) = 1;
    goto LAB109;

LAB110:    *((unsigned int *)t112) = 1;
    goto LAB113;

LAB112:    t119 = (t112 + 4);
    *((unsigned int *)t112) = 1;
    *((unsigned int *)t119) = 1;
    goto LAB113;

LAB114:    t132 = *((unsigned int *)t120);
    t133 = *((unsigned int *)t126);
    *((unsigned int *)t120) = (t132 | t133);
    t134 = (t89 + 4);
    t135 = (t112 + 4);
    t136 = *((unsigned int *)t89);
    t137 = (~(t136));
    t138 = *((unsigned int *)t134);
    t139 = (~(t138));
    t140 = *((unsigned int *)t112);
    t141 = (~(t140));
    t142 = *((unsigned int *)t135);
    t143 = (~(t142));
    t144 = (t137 & t139);
    t145 = (t141 & t143);
    t146 = (~(t144));
    t147 = (~(t145));
    t148 = *((unsigned int *)t126);
    *((unsigned int *)t126) = (t148 & t146);
    t149 = *((unsigned int *)t126);
    *((unsigned int *)t126) = (t149 & t147);
    t150 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t150 & t146);
    t151 = *((unsigned int *)t120);
    *((unsigned int *)t120) = (t151 & t147);
    goto LAB116;

LAB117:    *((unsigned int *)t152) = 1;
    goto LAB120;

LAB119:    t159 = (t152 + 4);
    *((unsigned int *)t152) = 1;
    *((unsigned int *)t159) = 1;
    goto LAB120;

LAB121:    t164 = (t0 + 8776);
    t165 = (t164 + 56U);
    t166 = *((char **)t165);
    memset(t167, 0, 8);
    t168 = (t166 + 4);
    t169 = *((unsigned int *)t168);
    t170 = (~(t169));
    t171 = *((unsigned int *)t166);
    t172 = (t171 & t170);
    t173 = (t172 & 1U);
    if (t173 != 0)
        goto LAB124;

LAB125:    if (*((unsigned int *)t168) != 0)
        goto LAB126;

LAB127:    t176 = *((unsigned int *)t152);
    t177 = *((unsigned int *)t167);
    t178 = (t176 & t177);
    *((unsigned int *)t175) = t178;
    t179 = (t152 + 4);
    t180 = (t167 + 4);
    t181 = (t175 + 4);
    t182 = *((unsigned int *)t179);
    t183 = *((unsigned int *)t180);
    t184 = (t182 | t183);
    *((unsigned int *)t181) = t184;
    t185 = *((unsigned int *)t181);
    t186 = (t185 != 0);
    if (t186 == 1)
        goto LAB128;

LAB129:
LAB130:    goto LAB123;

LAB124:    *((unsigned int *)t167) = 1;
    goto LAB127;

LAB126:    t174 = (t167 + 4);
    *((unsigned int *)t167) = 1;
    *((unsigned int *)t174) = 1;
    goto LAB127;

LAB128:    t187 = *((unsigned int *)t175);
    t188 = *((unsigned int *)t181);
    *((unsigned int *)t175) = (t187 | t188);
    t189 = (t152 + 4);
    t190 = (t167 + 4);
    t191 = *((unsigned int *)t152);
    t192 = (~(t191));
    t193 = *((unsigned int *)t189);
    t194 = (~(t193));
    t195 = *((unsigned int *)t167);
    t196 = (~(t195));
    t197 = *((unsigned int *)t190);
    t198 = (~(t197));
    t199 = (t192 & t194);
    t200 = (t196 & t198);
    t201 = (~(t199));
    t202 = (~(t200));
    t203 = *((unsigned int *)t181);
    *((unsigned int *)t181) = (t203 & t201);
    t204 = *((unsigned int *)t181);
    *((unsigned int *)t181) = (t204 & t202);
    t205 = *((unsigned int *)t175);
    *((unsigned int *)t175) = (t205 & t201);
    t206 = *((unsigned int *)t175);
    *((unsigned int *)t175) = (t206 & t202);
    goto LAB130;

LAB131:    xsi_set_current_line(198, ng0);

LAB134:    xsi_set_current_line(199, ng0);
    t213 = ((char*)((ng2)));
    t214 = (t0 + 7176);
    xsi_vlogvar_wait_assign_value(t214, t213, 0, 0, 1, 0LL);
    goto LAB133;

LAB137:    t20 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB138;

LAB139:    xsi_set_current_line(203, ng0);

LAB142:    xsi_set_current_line(204, ng0);
    t22 = ((char*)((ng1)));
    t23 = (t0 + 8456);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 3, 0LL);
    xsi_set_current_line(207, ng0);
    t2 = (t0 + 8136);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (~(t11));
    t13 = *((unsigned int *)t8);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB143;

LAB144:    xsi_set_current_line(234, ng0);
    t2 = (t0 + 8776);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    memset(t16, 0, 8);
    t17 = (t10 + 4);
    t11 = *((unsigned int *)t17);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB205;

LAB206:    if (*((unsigned int *)t17) != 0)
        goto LAB207;

LAB208:    t20 = (t16 + 4);
    t32 = *((unsigned int *)t16);
    t33 = *((unsigned int *)t20);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB209;

LAB210:    memcpy(t26, t16, 8);

LAB211:    memset(t52, 0, 8);
    t31 = (t26 + 4);
    t70 = *((unsigned int *)t31);
    t71 = (~(t70));
    t72 = *((unsigned int *)t26);
    t75 = (t72 & t71);
    t76 = (t75 & 1U);
    if (t76 != 0)
        goto LAB219;

LAB220:    if (*((unsigned int *)t31) != 0)
        goto LAB221;

LAB222:    t63 = (t52 + 4);
    t77 = *((unsigned int *)t52);
    t78 = *((unsigned int *)t63);
    t79 = (t77 || t78);
    if (t79 > 0)
        goto LAB223;

LAB224:    memcpy(t101, t52, 8);

LAB225:    t113 = (t101 + 4);
    t131 = *((unsigned int *)t113);
    t132 = (~(t131));
    t133 = *((unsigned int *)t101);
    t136 = (t133 & t132);
    t137 = (t136 != 0);
    if (t137 > 0)
        goto LAB237;

LAB238:    xsi_set_current_line(237, ng0);

LAB241:    xsi_set_current_line(239, ng0);
    t2 = (t0 + 9096);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = (t10 + 4);
    t11 = *((unsigned int *)t17);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB242;

LAB243:    xsi_set_current_line(241, ng0);

LAB246:    xsi_set_current_line(242, ng0);
    t2 = (t0 + 3872);
    t4 = *((char **)t2);
    t2 = (t0 + 7976);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 2, 0LL);

LAB244:
LAB239:
LAB145:    goto LAB141;

LAB143:    xsi_set_current_line(207, ng0);

LAB146:    xsi_set_current_line(209, ng0);
    t17 = (t0 + 8616);
    t19 = (t17 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng2)));
    memset(t16, 0, 8);
    xsi_vlog_unsigned_add(t16, 32, t20, 2, t21, 32);
    t22 = (t0 + 8616);
    xsi_vlogvar_wait_assign_value(t22, t16, 0, 0, 2, 0LL);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 8616);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);

LAB147:    t10 = ((char*)((ng1)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 2, t10, 32);
    if (t9 == 1)
        goto LAB148;

LAB149:    t2 = ((char*)((ng2)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 2, t2, 32);
    if (t9 == 1)
        goto LAB150;

LAB151:    t2 = ((char*)((ng6)));
    t9 = xsi_vlog_unsigned_case_compare(t8, 2, t2, 32);
    if (t9 == 1)
        goto LAB152;

LAB153:
LAB154:    xsi_set_current_line(218, ng0);
    t2 = (t0 + 8616);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = ((char*)((ng15)));
    memset(t16, 0, 8);
    t19 = (t10 + 4);
    t20 = (t17 + 4);
    t11 = *((unsigned int *)t10);
    t12 = *((unsigned int *)t17);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t19);
    t15 = *((unsigned int *)t20);
    t32 = (t14 ^ t15);
    t33 = (t13 | t32);
    t34 = *((unsigned int *)t19);
    t35 = *((unsigned int *)t20);
    t36 = (t34 | t35);
    t37 = (~(t36));
    t38 = (t33 & t37);
    if (t38 != 0)
        goto LAB158;

LAB155:    if (t36 != 0)
        goto LAB157;

LAB156:    *((unsigned int *)t16) = 1;

LAB158:    t22 = (t16 + 4);
    t39 = *((unsigned int *)t22);
    t40 = (~(t39));
    t41 = *((unsigned int *)t16);
    t42 = (t41 & t40);
    t43 = (t42 != 0);
    if (t43 > 0)
        goto LAB159;

LAB160:
LAB161:    goto LAB145;

LAB148:    xsi_set_current_line(212, ng0);
    t17 = (t0 + 5336U);
    t19 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t20 = (t19 + 4);
    t11 = *((unsigned int *)t19);
    t12 = (t11 >> 16);
    *((unsigned int *)t16) = t12;
    t13 = *((unsigned int *)t20);
    t14 = (t13 >> 16);
    *((unsigned int *)t17) = t14;
    t15 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t15 & 255U);
    t32 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t32 & 255U);
    t21 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t21, t16, 0, 0, 8, 0LL);
    goto LAB154;

LAB150:    xsi_set_current_line(213, ng0);
    t4 = (t0 + 5336U);
    t10 = *((char **)t4);
    memset(t16, 0, 8);
    t4 = (t16 + 4);
    t17 = (t10 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (t11 >> 8);
    *((unsigned int *)t16) = t12;
    t13 = *((unsigned int *)t17);
    t14 = (t13 >> 8);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t15 & 255U);
    t32 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t32 & 255U);
    t19 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t19, t16, 0, 0, 8, 0LL);
    goto LAB154;

LAB152:    xsi_set_current_line(214, ng0);
    t4 = (t0 + 5336U);
    t10 = *((char **)t4);
    memset(t16, 0, 8);
    t4 = (t16 + 4);
    t17 = (t10 + 4);
    t11 = *((unsigned int *)t10);
    t12 = (t11 >> 0);
    *((unsigned int *)t16) = t12;
    t13 = *((unsigned int *)t17);
    t14 = (t13 >> 0);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t15 & 255U);
    t32 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t32 & 255U);
    t19 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t19, t16, 0, 0, 8, 0LL);
    goto LAB154;

LAB157:    t21 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB158;

LAB159:    xsi_set_current_line(218, ng0);

LAB162:    xsi_set_current_line(219, ng0);
    t23 = ((char*)((ng1)));
    t25 = (t0 + 8136);
    xsi_vlogvar_wait_assign_value(t25, t23, 0, 0, 1, 0LL);
    xsi_set_current_line(220, ng0);
    t2 = ((char*)((ng1)));
    t4 = (t0 + 8616);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 2, 0LL);
    xsi_set_current_line(223, ng0);
    t2 = (t0 + 8776);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    memset(t16, 0, 8);
    t17 = (t10 + 4);
    t11 = *((unsigned int *)t17);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB163;

LAB164:    if (*((unsigned int *)t17) != 0)
        goto LAB165;

LAB166:    t20 = (t16 + 4);
    t32 = *((unsigned int *)t16);
    t33 = *((unsigned int *)t20);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB167;

LAB168:    memcpy(t26, t16, 8);

LAB169:    memset(t52, 0, 8);
    t31 = (t26 + 4);
    t70 = *((unsigned int *)t31);
    t71 = (~(t70));
    t72 = *((unsigned int *)t26);
    t75 = (t72 & t71);
    t76 = (t75 & 1U);
    if (t76 != 0)
        goto LAB177;

LAB178:    if (*((unsigned int *)t31) != 0)
        goto LAB179;

LAB180:    t63 = (t52 + 4);
    t77 = *((unsigned int *)t52);
    t78 = *((unsigned int *)t63);
    t79 = (t77 || t78);
    if (t79 > 0)
        goto LAB181;

LAB182:    memcpy(t101, t52, 8);

LAB183:    t113 = (t101 + 4);
    t131 = *((unsigned int *)t113);
    t132 = (~(t131));
    t133 = *((unsigned int *)t101);
    t136 = (t133 & t132);
    t137 = (t136 != 0);
    if (t137 > 0)
        goto LAB195;

LAB196:    xsi_set_current_line(225, ng0);

LAB199:    xsi_set_current_line(227, ng0);
    t2 = (t0 + 9096);
    t4 = (t2 + 56U);
    t10 = *((char **)t4);
    t17 = (t10 + 4);
    t11 = *((unsigned int *)t17);
    t12 = (~(t11));
    t13 = *((unsigned int *)t10);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB200;

LAB201:    xsi_set_current_line(229, ng0);

LAB204:    xsi_set_current_line(230, ng0);
    t2 = (t0 + 3872);
    t4 = *((char **)t2);
    t2 = (t0 + 7976);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 2, 0LL);

LAB202:
LAB197:    goto LAB161;

LAB163:    *((unsigned int *)t16) = 1;
    goto LAB166;

LAB165:    t19 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB166;

LAB167:    t21 = (t0 + 5656U);
    t22 = *((char **)t21);
    memset(t24, 0, 8);
    t21 = (t22 + 4);
    t35 = *((unsigned int *)t21);
    t36 = (~(t35));
    t37 = *((unsigned int *)t22);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB170;

LAB171:    if (*((unsigned int *)t21) != 0)
        goto LAB172;

LAB173:    t40 = *((unsigned int *)t16);
    t41 = *((unsigned int *)t24);
    t42 = (t40 & t41);
    *((unsigned int *)t26) = t42;
    t25 = (t16 + 4);
    t27 = (t24 + 4);
    t28 = (t26 + 4);
    t43 = *((unsigned int *)t25);
    t44 = *((unsigned int *)t27);
    t45 = (t43 | t44);
    *((unsigned int *)t28) = t45;
    t46 = *((unsigned int *)t28);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB174;

LAB175:
LAB176:    goto LAB169;

LAB170:    *((unsigned int *)t24) = 1;
    goto LAB173;

LAB172:    t23 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB173;

LAB174:    t48 = *((unsigned int *)t26);
    t49 = *((unsigned int *)t28);
    *((unsigned int *)t26) = (t48 | t49);
    t29 = (t16 + 4);
    t30 = (t24 + 4);
    t50 = *((unsigned int *)t16);
    t51 = (~(t50));
    t53 = *((unsigned int *)t29);
    t54 = (~(t53));
    t55 = *((unsigned int *)t24);
    t56 = (~(t55));
    t57 = *((unsigned int *)t30);
    t60 = (~(t57));
    t9 = (t51 & t54);
    t18 = (t56 & t60);
    t61 = (~(t9));
    t62 = (~(t18));
    t66 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t66 & t61);
    t67 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t67 & t62);
    t68 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t68 & t61);
    t69 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t69 & t62);
    goto LAB176;

LAB177:    *((unsigned int *)t52) = 1;
    goto LAB180;

LAB179:    t58 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB180;

LAB181:    t64 = (t0 + 9096);
    t65 = (t64 + 56U);
    t73 = *((char **)t65);
    memset(t59, 0, 8);
    t74 = (t73 + 4);
    t80 = *((unsigned int *)t74);
    t81 = (~(t80));
    t82 = *((unsigned int *)t73);
    t83 = (t82 & t81);
    t84 = (t83 & 1U);
    if (t84 != 0)
        goto LAB187;

LAB185:    if (*((unsigned int *)t74) == 0)
        goto LAB184;

LAB186:    t90 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t90) = 1;

LAB187:    memset(t89, 0, 8);
    t96 = (t59 + 4);
    t85 = *((unsigned int *)t96);
    t86 = (~(t85));
    t87 = *((unsigned int *)t59);
    t88 = (t87 & t86);
    t91 = (t88 & 1U);
    if (t91 != 0)
        goto LAB188;

LAB189:    if (*((unsigned int *)t96) != 0)
        goto LAB190;

LAB191:    t92 = *((unsigned int *)t52);
    t93 = *((unsigned int *)t89);
    t94 = (t92 & t93);
    *((unsigned int *)t101) = t94;
    t102 = (t52 + 4);
    t103 = (t89 + 4);
    t104 = (t101 + 4);
    t95 = *((unsigned int *)t102);
    t98 = *((unsigned int *)t103);
    t99 = (t95 | t98);
    *((unsigned int *)t104) = t99;
    t100 = *((unsigned int *)t104);
    t106 = (t100 != 0);
    if (t106 == 1)
        goto LAB192;

LAB193:
LAB194:    goto LAB183;

LAB184:    *((unsigned int *)t59) = 1;
    goto LAB187;

LAB188:    *((unsigned int *)t89) = 1;
    goto LAB191;

LAB190:    t97 = (t89 + 4);
    *((unsigned int *)t89) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB191;

LAB192:    t107 = *((unsigned int *)t101);
    t108 = *((unsigned int *)t104);
    *((unsigned int *)t101) = (t107 | t108);
    t105 = (t52 + 4);
    t111 = (t89 + 4);
    t109 = *((unsigned int *)t52);
    t110 = (~(t109));
    t114 = *((unsigned int *)t105);
    t115 = (~(t114));
    t116 = *((unsigned int *)t89);
    t117 = (~(t116));
    t118 = *((unsigned int *)t111);
    t121 = (~(t118));
    t144 = (t110 & t115);
    t145 = (t117 & t121);
    t122 = (~(t144));
    t123 = (~(t145));
    t127 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t127 & t122);
    t128 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t128 & t123);
    t129 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t129 & t122);
    t130 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t130 & t123);
    goto LAB194;

LAB195:    xsi_set_current_line(223, ng0);

LAB198:    xsi_set_current_line(224, ng0);
    t119 = (t0 + 5496U);
    t124 = *((char **)t119);
    t119 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t119, t124, 0, 0, 8, 0LL);
    goto LAB197;

LAB200:    xsi_set_current_line(227, ng0);

LAB203:    xsi_set_current_line(228, ng0);
    t19 = (t0 + 4144);
    t20 = *((char **)t19);
    t19 = (t0 + 7976);
    xsi_vlogvar_wait_assign_value(t19, t20, 0, 0, 2, 0LL);
    goto LAB202;

LAB205:    *((unsigned int *)t16) = 1;
    goto LAB208;

LAB207:    t19 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB208;

LAB209:    t21 = (t0 + 5656U);
    t22 = *((char **)t21);
    memset(t24, 0, 8);
    t21 = (t22 + 4);
    t35 = *((unsigned int *)t21);
    t36 = (~(t35));
    t37 = *((unsigned int *)t22);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB212;

LAB213:    if (*((unsigned int *)t21) != 0)
        goto LAB214;

LAB215:    t40 = *((unsigned int *)t16);
    t41 = *((unsigned int *)t24);
    t42 = (t40 & t41);
    *((unsigned int *)t26) = t42;
    t25 = (t16 + 4);
    t27 = (t24 + 4);
    t28 = (t26 + 4);
    t43 = *((unsigned int *)t25);
    t44 = *((unsigned int *)t27);
    t45 = (t43 | t44);
    *((unsigned int *)t28) = t45;
    t46 = *((unsigned int *)t28);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB216;

LAB217:
LAB218:    goto LAB211;

LAB212:    *((unsigned int *)t24) = 1;
    goto LAB215;

LAB214:    t23 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB215;

LAB216:    t48 = *((unsigned int *)t26);
    t49 = *((unsigned int *)t28);
    *((unsigned int *)t26) = (t48 | t49);
    t29 = (t16 + 4);
    t30 = (t24 + 4);
    t50 = *((unsigned int *)t16);
    t51 = (~(t50));
    t53 = *((unsigned int *)t29);
    t54 = (~(t53));
    t55 = *((unsigned int *)t24);
    t56 = (~(t55));
    t57 = *((unsigned int *)t30);
    t60 = (~(t57));
    t9 = (t51 & t54);
    t18 = (t56 & t60);
    t61 = (~(t9));
    t62 = (~(t18));
    t66 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t66 & t61);
    t67 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t67 & t62);
    t68 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t68 & t61);
    t69 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t69 & t62);
    goto LAB218;

LAB219:    *((unsigned int *)t52) = 1;
    goto LAB222;

LAB221:    t58 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t58) = 1;
    goto LAB222;

LAB223:    t64 = (t0 + 9096);
    t65 = (t64 + 56U);
    t73 = *((char **)t65);
    memset(t59, 0, 8);
    t74 = (t73 + 4);
    t80 = *((unsigned int *)t74);
    t81 = (~(t80));
    t82 = *((unsigned int *)t73);
    t83 = (t82 & t81);
    t84 = (t83 & 1U);
    if (t84 != 0)
        goto LAB229;

LAB227:    if (*((unsigned int *)t74) == 0)
        goto LAB226;

LAB228:    t90 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t90) = 1;

LAB229:    memset(t89, 0, 8);
    t96 = (t59 + 4);
    t85 = *((unsigned int *)t96);
    t86 = (~(t85));
    t87 = *((unsigned int *)t59);
    t88 = (t87 & t86);
    t91 = (t88 & 1U);
    if (t91 != 0)
        goto LAB230;

LAB231:    if (*((unsigned int *)t96) != 0)
        goto LAB232;

LAB233:    t92 = *((unsigned int *)t52);
    t93 = *((unsigned int *)t89);
    t94 = (t92 & t93);
    *((unsigned int *)t101) = t94;
    t102 = (t52 + 4);
    t103 = (t89 + 4);
    t104 = (t101 + 4);
    t95 = *((unsigned int *)t102);
    t98 = *((unsigned int *)t103);
    t99 = (t95 | t98);
    *((unsigned int *)t104) = t99;
    t100 = *((unsigned int *)t104);
    t106 = (t100 != 0);
    if (t106 == 1)
        goto LAB234;

LAB235:
LAB236:    goto LAB225;

LAB226:    *((unsigned int *)t59) = 1;
    goto LAB229;

LAB230:    *((unsigned int *)t89) = 1;
    goto LAB233;

LAB232:    t97 = (t89 + 4);
    *((unsigned int *)t89) = 1;
    *((unsigned int *)t97) = 1;
    goto LAB233;

LAB234:    t107 = *((unsigned int *)t101);
    t108 = *((unsigned int *)t104);
    *((unsigned int *)t101) = (t107 | t108);
    t105 = (t52 + 4);
    t111 = (t89 + 4);
    t109 = *((unsigned int *)t52);
    t110 = (~(t109));
    t114 = *((unsigned int *)t105);
    t115 = (~(t114));
    t116 = *((unsigned int *)t89);
    t117 = (~(t116));
    t118 = *((unsigned int *)t111);
    t121 = (~(t118));
    t144 = (t110 & t115);
    t145 = (t117 & t121);
    t122 = (~(t144));
    t123 = (~(t145));
    t127 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t127 & t122);
    t128 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t128 & t123);
    t129 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t129 & t122);
    t130 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t130 & t123);
    goto LAB236;

LAB237:    xsi_set_current_line(234, ng0);

LAB240:    xsi_set_current_line(236, ng0);
    t119 = (t0 + 5496U);
    t124 = *((char **)t119);
    t119 = (t0 + 8296);
    xsi_vlogvar_wait_assign_value(t119, t124, 0, 0, 8, 0LL);
    goto LAB239;

LAB242:    xsi_set_current_line(239, ng0);

LAB245:    xsi_set_current_line(240, ng0);
    t19 = (t0 + 4144);
    t20 = *((char **)t19);
    t19 = (t0 + 7976);
    xsi_vlogvar_wait_assign_value(t19, t20, 0, 0, 2, 0LL);
    goto LAB244;

LAB248:    xsi_vlogvar_wait_assign_value(t4, t2, 0, *((unsigned int *)t16), 1, 0LL);
    goto LAB249;

LAB252:    t21 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB253;

LAB254:    *((unsigned int *)t24) = 1;
    goto LAB257;

LAB256:    t23 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB257;

LAB258:    t27 = (t0 + 8776);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t26, 0, 8);
    t30 = (t29 + 4);
    t47 = *((unsigned int *)t30);
    t48 = (~(t47));
    t49 = *((unsigned int *)t29);
    t50 = (t49 & t48);
    t51 = (t50 & 1U);
    if (t51 != 0)
        goto LAB261;

LAB262:    if (*((unsigned int *)t30) != 0)
        goto LAB263;

LAB264:    t53 = *((unsigned int *)t24);
    t54 = *((unsigned int *)t26);
    t55 = (t53 & t54);
    *((unsigned int *)t52) = t55;
    t58 = (t24 + 4);
    t63 = (t26 + 4);
    t64 = (t52 + 4);
    t56 = *((unsigned int *)t58);
    t57 = *((unsigned int *)t63);
    t60 = (t56 | t57);
    *((unsigned int *)t64) = t60;
    t61 = *((unsigned int *)t64);
    t62 = (t61 != 0);
    if (t62 == 1)
        goto LAB265;

LAB266:
LAB267:    goto LAB260;

LAB261:    *((unsigned int *)t26) = 1;
    goto LAB264;

LAB263:    t31 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB264;

LAB265:    t66 = *((unsigned int *)t52);
    t67 = *((unsigned int *)t64);
    *((unsigned int *)t52) = (t66 | t67);
    t65 = (t24 + 4);
    t73 = (t26 + 4);
    t68 = *((unsigned int *)t24);
    t69 = (~(t68));
    t70 = *((unsigned int *)t65);
    t71 = (~(t70));
    t72 = *((unsigned int *)t26);
    t75 = (~(t72));
    t76 = *((unsigned int *)t73);
    t77 = (~(t76));
    t9 = (t69 & t71);
    t18 = (t75 & t77);
    t78 = (~(t9));
    t79 = (~(t18));
    t80 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t80 & t78);
    t81 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t81 & t79);
    t82 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t82 & t78);
    t83 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t83 & t79);
    goto LAB267;

LAB268:    xsi_set_current_line(253, ng0);

LAB271:    xsi_set_current_line(254, ng0);
    t90 = ((char*)((ng2)));
    t96 = (t0 + 7336);
    xsi_vlogvar_wait_assign_value(t96, t90, 0, 0, 1, 0LL);
    goto LAB270;

LAB273:    *((unsigned int *)t16) = 1;
    goto LAB275;

LAB274:    t21 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB275;

LAB276:    xsi_set_current_line(258, ng0);

LAB279:    xsi_set_current_line(259, ng0);
    t23 = (t0 + 9256);
    t25 = (t23 + 56U);
    t27 = *((char **)t25);
    t28 = ((char*)((ng2)));
    memset(t24, 0, 8);
    xsi_vlog_unsigned_minus(t24, 32, t27, 3, t28, 32);
    t29 = (t0 + 9256);
    xsi_vlogvar_wait_assign_value(t29, t24, 0, 0, 3, 0LL);
    goto LAB278;

LAB281:    xsi_vlogvar_wait_assign_value(t17, t16, 0, *((unsigned int *)t24), 1, 0LL);
    goto LAB282;

LAB285:    t21 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB286;

LAB287:    xsi_set_current_line(266, ng0);

LAB290:    xsi_set_current_line(267, ng0);
    t23 = ((char*)((ng1)));
    t25 = (t0 + 8456);
    xsi_vlogvar_wait_assign_value(t25, t23, 0, 0, 3, 0LL);
    xsi_set_current_line(269, ng0);
    t2 = (t0 + 6136U);
    t4 = *((char **)t2);
    memset(t24, 0, 8);
    t2 = (t24 + 4);
    t10 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 1);
    t13 = (t12 & 1);
    *((unsigned int *)t24) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 1);
    t32 = (t15 & 1);
    *((unsigned int *)t2) = t32;
    t17 = (t0 + 8296);
    t19 = (t17 + 56U);
    t20 = *((char **)t19);
    memset(t26, 0, 8);
    t21 = (t26 + 4);
    t22 = (t20 + 4);
    t33 = *((unsigned int *)t20);
    t34 = (t33 >> 1);
    *((unsigned int *)t26) = t34;
    t35 = *((unsigned int *)t22);
    t36 = (t35 >> 1);
    *((unsigned int *)t21) = t36;
    t37 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t37 & 127U);
    t38 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t38 & 127U);
    xsi_vlogtype_concat(t16, 8, 8, 2U, t26, 7, t24, 1);
    t23 = (t0 + 7016);
    xsi_vlogvar_wait_assign_value(t23, t16, 0, 0, 8, 0LL);
    xsi_set_current_line(272, ng0);
    t2 = (t0 + 5656U);
    t4 = *((char **)t2);
    memset(t24, 0, 8);
    t2 = (t4 + 4);
    t11 = *((unsigned int *)t2);
    t12 = (~(t11));
    t13 = *((unsigned int *)t4);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB291;

LAB292:    if (*((unsigned int *)t2) != 0)
        goto LAB293;

LAB294:    t17 = (t24 + 4);
    t32 = *((unsigned int *)t24);
    t33 = *((unsigned int *)t17);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB295;

LAB296:    memcpy(t52, t24, 8);

LAB297:    memset(t16, 0, 8);
    t31 = (t52 + 4);
    t70 = *((unsigned int *)t31);
    t71 = (~(t70));
    t72 = *((unsigned int *)t52);
    t75 = (t72 & t71);
    t76 = (t75 & 1U);
    if (t76 != 0)
        goto LAB308;

LAB306:    if (*((unsigned int *)t31) == 0)
        goto LAB305;

LAB307:    t58 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t58) = 1;

LAB308:    t63 = (t16 + 4);
    t77 = *((unsigned int *)t63);
    t78 = (~(t77));
    t79 = *((unsigned int *)t16);
    t80 = (t79 & t78);
    t81 = (t80 != 0);
    if (t81 > 0)
        goto LAB309;

LAB310:
LAB311:    goto LAB289;

LAB291:    *((unsigned int *)t24) = 1;
    goto LAB294;

LAB293:    t10 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB294;

LAB295:    t19 = (t0 + 8776);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memset(t26, 0, 8);
    t22 = (t21 + 4);
    t35 = *((unsigned int *)t22);
    t36 = (~(t35));
    t37 = *((unsigned int *)t21);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB298;

LAB299:    if (*((unsigned int *)t22) != 0)
        goto LAB300;

LAB301:    t40 = *((unsigned int *)t24);
    t41 = *((unsigned int *)t26);
    t42 = (t40 & t41);
    *((unsigned int *)t52) = t42;
    t25 = (t24 + 4);
    t27 = (t26 + 4);
    t28 = (t52 + 4);
    t43 = *((unsigned int *)t25);
    t44 = *((unsigned int *)t27);
    t45 = (t43 | t44);
    *((unsigned int *)t28) = t45;
    t46 = *((unsigned int *)t28);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB302;

LAB303:
LAB304:    goto LAB297;

LAB298:    *((unsigned int *)t26) = 1;
    goto LAB301;

LAB300:    t23 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB301;

LAB302:    t48 = *((unsigned int *)t52);
    t49 = *((unsigned int *)t28);
    *((unsigned int *)t52) = (t48 | t49);
    t29 = (t24 + 4);
    t30 = (t26 + 4);
    t50 = *((unsigned int *)t24);
    t51 = (~(t50));
    t53 = *((unsigned int *)t29);
    t54 = (~(t53));
    t55 = *((unsigned int *)t26);
    t56 = (~(t55));
    t57 = *((unsigned int *)t30);
    t60 = (~(t57));
    t9 = (t51 & t54);
    t18 = (t56 & t60);
    t61 = (~(t9));
    t62 = (~(t18));
    t66 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t66 & t61);
    t67 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t67 & t62);
    t68 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t68 & t61);
    t69 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t69 & t62);
    goto LAB304;

LAB305:    *((unsigned int *)t16) = 1;
    goto LAB308;

LAB309:    xsi_set_current_line(272, ng0);

LAB312:    xsi_set_current_line(273, ng0);
    t64 = ((char*)((ng1)));
    t65 = (t0 + 8936);
    xsi_vlogvar_wait_assign_value(t65, t64, 0, 0, 1, 0LL);
    xsi_set_current_line(274, ng0);
    t2 = (t0 + 3872);
    t4 = *((char **)t2);
    t2 = (t0 + 7976);
    xsi_vlogvar_wait_assign_value(t2, t4, 0, 0, 2, 0LL);
    goto LAB311;

}

static void implSig1_execute(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 12232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 4856U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t4 + 4);
    t5 = *((unsigned int *)t2);
    t6 = (~(t5));
    t7 = *((unsigned int *)t4);
    t8 = (t7 & t6);
    t9 = (t8 & 1U);
    if (t9 != 0)
        goto LAB7;

LAB5:    if (*((unsigned int *)t2) == 0)
        goto LAB4;

LAB6:    t10 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t10) = 1;

LAB7:    t11 = (t0 + 13544);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t15, 0, 8);
    t16 = 1U;
    t17 = t16;
    t18 = (t3 + 4);
    t19 = *((unsigned int *)t3);
    t16 = (t16 & t19);
    t20 = *((unsigned int *)t18);
    t17 = (t17 & t20);
    t21 = (t15 + 4);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t22 | t16);
    t23 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t23 | t17);
    xsi_driver_vfirst_trans(t11, 0, 0);
    t24 = (t0 + 13144);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t3) = 1;
    goto LAB7;

}

static void implSig2_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 12480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng21)));
    t3 = (t0 + 13608);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}

static void implSig3_execute(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;

LAB0:    t1 = (t0 + 12728U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = ((char*)((ng4)));
    t3 = (t0 + 13672);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t7, 0, 8);
    t8 = 1U;
    t9 = t8;
    t10 = (t2 + 4);
    t11 = *((unsigned int *)t2);
    t8 = (t8 & t11);
    t12 = *((unsigned int *)t10);
    t9 = (t9 & t12);
    t13 = (t7 + 4);
    t14 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t14 | t8);
    t15 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t15 | t9);
    xsi_driver_vfirst_trans(t3, 0, 0);

LAB1:    return;
}


extern void work_m_00000000000970185914_1381746309_init()
{
	static char *pe[] = {(void *)Initial_23_0,(void *)Cont_60_1,(void *)Cont_61_2,(void *)Cont_62_3,(void *)Cont_63_4,(void *)Cont_96_5,(void *)Always_98_6,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute};
	xsi_register_didat("work_m_00000000000970185914_1381746309", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000000970185914_1381746309.didat");
	xsi_register_executes(pe);
}
