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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/RAM.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {7, 0};
static int ng4[] = {15, 0};
static int ng5[] = {8, 0};
static int ng6[] = {23, 0};
static int ng7[] = {16, 0};
static int ng8[] = {31, 0};
static int ng9[] = {24, 0};



static void Initial_28_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(28, ng0);

LAB2:    xsi_set_current_line(29, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);

LAB1:    return;
}

static void Cont_31_1(char *t0)
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

LAB0:    t1 = (t0 + 5128U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6272);
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

static void Cont_32_2(char *t0)
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

LAB0:    t1 = (t0 + 5376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6336);
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

static void Initial_38_3(char *t0)
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

LAB0:    xsi_set_current_line(38, ng0);

LAB2:    xsi_set_current_line(39, ng0);
    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3960);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 3960);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t0 + 608);
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
LAB4:    xsi_set_current_line(39, ng0);

LAB6:    xsi_set_current_line(40, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 3800);
    t16 = (t0 + 3800);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 3800);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 3960);
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

LAB8:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 3960);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t6, 0, 8);
    xsi_vlog_signed_add(t6, 32, t3, 32, t4, 32);
    t5 = (t0 + 3960);
    xsi_vlogvar_assign_value(t5, t6, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_assign_value(t13, t12, 0, *((unsigned int *)t15), t35);
    goto LAB8;

}

static void Always_44_4(char *t0)
{
    char t19[8];
    char t26[8];
    char t48[8];
    char t49[8];
    char t53[8];
    char t54[8];
    char t55[8];
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
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
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
    char *t50;
    char *t51;
    char *t52;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    int t62;
    char *t63;
    unsigned int t64;
    int t65;
    int t66;
    char *t67;
    unsigned int t68;
    int t69;
    int t70;
    char *t71;
    unsigned int t72;
    int t73;
    int t74;
    char *t75;
    unsigned int t76;
    int t77;
    int t78;
    unsigned int t79;
    int t80;
    unsigned int t81;
    unsigned int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    int t86;
    int t87;

LAB0:    t1 = (t0 + 5872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 6192);
    *((int *)t2) = 1;
    t3 = (t0 + 5904);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);

LAB5:    xsi_set_current_line(45, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3480);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1480U);
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
LAB8:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 2120U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB14;

LAB15:
LAB16:    goto LAB2;

LAB6:    xsi_set_current_line(48, ng0);

LAB9:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 1800U);
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
LAB12:    goto LAB8;

LAB10:    xsi_set_current_line(49, ng0);

LAB13:    xsi_set_current_line(50, ng0);
    t16 = (t0 + 3800);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t20 = (t0 + 3800);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t23 = (t0 + 3800);
    t24 = (t23 + 64U);
    t25 = *((char **)t24);
    t27 = (t0 + 1640U);
    t28 = *((char **)t27);
    memset(t26, 0, 8);
    t27 = (t26 + 4);
    t29 = (t28 + 4);
    t30 = *((unsigned int *)t28);
    t31 = (t30 >> 0);
    *((unsigned int *)t26) = t31;
    t32 = *((unsigned int *)t29);
    t33 = (t32 >> 0);
    *((unsigned int *)t27) = t33;
    t34 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t34 & 1023U);
    t35 = *((unsigned int *)t27);
    *((unsigned int *)t27) = (t35 & 1023U);
    xsi_vlog_generic_get_array_select_value(t19, 32, t18, t22, t25, 2, 1, t26, 10, 2);
    t36 = (t0 + 3480);
    xsi_vlogvar_wait_assign_value(t36, t19, 0, 0, 32, 0LL);
    goto LAB12;

LAB14:    xsi_set_current_line(54, ng0);

LAB17:    xsi_set_current_line(55, ng0);
    t4 = (t0 + 2760U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (~(t11));
    t13 = *((unsigned int *)t5);
    t14 = (t13 & t12);
    t15 = (t14 != 0);
    if (t15 > 0)
        goto LAB18;

LAB19:
LAB20:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2600U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB42;

LAB43:
LAB44:    goto LAB16;

LAB18:    xsi_set_current_line(55, ng0);

LAB21:    xsi_set_current_line(56, ng0);
    t16 = (t0 + 2440U);
    t17 = *((char **)t16);
    memset(t19, 0, 8);
    t16 = (t19 + 4);
    t18 = (t17 + 4);
    t30 = *((unsigned int *)t17);
    t31 = (t30 >> 0);
    t32 = (t31 & 1);
    *((unsigned int *)t19) = t32;
    t33 = *((unsigned int *)t18);
    t34 = (t33 >> 0);
    t35 = (t34 & 1);
    *((unsigned int *)t16) = t35;
    t20 = (t19 + 4);
    t37 = *((unsigned int *)t20);
    t38 = (~(t37));
    t39 = *((unsigned int *)t19);
    t40 = (t39 & t38);
    t41 = (t40 != 0);
    if (t41 > 0)
        goto LAB22;

LAB23:
LAB24:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2440U);
    t3 = *((char **)t2);
    memset(t19, 0, 8);
    t2 = (t19 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t19) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t19 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t19);
    t15 = (t14 & t13);
    t30 = (t15 != 0);
    if (t30 > 0)
        goto LAB27;

LAB28:
LAB29:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2440U);
    t3 = *((char **)t2);
    memset(t19, 0, 8);
    t2 = (t19 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t19) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 2);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t19 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t19);
    t15 = (t14 & t13);
    t30 = (t15 != 0);
    if (t30 > 0)
        goto LAB32;

LAB33:
LAB34:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2440U);
    t3 = *((char **)t2);
    memset(t19, 0, 8);
    t2 = (t19 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 3);
    t8 = (t7 & 1);
    *((unsigned int *)t19) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 3);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t19 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t19);
    t15 = (t14 & t13);
    t30 = (t15 != 0);
    if (t30 > 0)
        goto LAB37;

LAB38:
LAB39:    goto LAB20;

LAB22:    xsi_set_current_line(56, ng0);
    t21 = (t0 + 2920U);
    t22 = *((char **)t21);
    memset(t26, 0, 8);
    t21 = (t26 + 4);
    t23 = (t22 + 4);
    t42 = *((unsigned int *)t22);
    t43 = (t42 >> 0);
    *((unsigned int *)t26) = t43;
    t44 = *((unsigned int *)t23);
    t45 = (t44 >> 0);
    *((unsigned int *)t21) = t45;
    t46 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t46 & 255U);
    t47 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t47 & 255U);
    t24 = (t0 + 3800);
    t25 = (t0 + 3800);
    t27 = (t25 + 72U);
    t28 = *((char **)t27);
    t29 = (t0 + 3800);
    t36 = (t29 + 64U);
    t50 = *((char **)t36);
    t51 = (t0 + 2280U);
    t52 = *((char **)t51);
    xsi_vlog_generic_convert_array_indices(t48, t49, t28, t50, 2, 1, t52, 20, 2);
    t51 = (t0 + 3800);
    t56 = (t51 + 72U);
    t57 = *((char **)t56);
    t58 = ((char*)((ng3)));
    t59 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t53, t54, t55, ((int*)(t57)), 2, t58, 32, 1, t59, 32, 1);
    t60 = (t48 + 4);
    t61 = *((unsigned int *)t60);
    t62 = (!(t61));
    t63 = (t49 + 4);
    t64 = *((unsigned int *)t63);
    t65 = (!(t64));
    t66 = (t62 && t65);
    t67 = (t53 + 4);
    t68 = *((unsigned int *)t67);
    t69 = (!(t68));
    t70 = (t66 && t69);
    t71 = (t54 + 4);
    t72 = *((unsigned int *)t71);
    t73 = (!(t72));
    t74 = (t70 && t73);
    t75 = (t55 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (!(t76));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB25;

LAB26:    goto LAB24;

LAB25:    t79 = *((unsigned int *)t55);
    t80 = (t79 + 0);
    t81 = *((unsigned int *)t49);
    t82 = *((unsigned int *)t54);
    t83 = (t81 + t82);
    t84 = *((unsigned int *)t53);
    t85 = *((unsigned int *)t54);
    t86 = (t84 - t85);
    t87 = (t86 + 1);
    xsi_vlogvar_wait_assign_value(t24, t26, t80, t83, t87, 0LL);
    goto LAB26;

LAB27:    xsi_set_current_line(57, ng0);
    t16 = (t0 + 2920U);
    t17 = *((char **)t16);
    memset(t26, 0, 8);
    t16 = (t26 + 4);
    t18 = (t17 + 4);
    t31 = *((unsigned int *)t17);
    t32 = (t31 >> 8);
    *((unsigned int *)t26) = t32;
    t33 = *((unsigned int *)t18);
    t34 = (t33 >> 8);
    *((unsigned int *)t16) = t34;
    t35 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t35 & 255U);
    t37 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t37 & 255U);
    t20 = (t0 + 3800);
    t21 = (t0 + 3800);
    t22 = (t21 + 72U);
    t23 = *((char **)t22);
    t24 = (t0 + 3800);
    t25 = (t24 + 64U);
    t27 = *((char **)t25);
    t28 = (t0 + 2280U);
    t29 = *((char **)t28);
    xsi_vlog_generic_convert_array_indices(t48, t49, t23, t27, 2, 1, t29, 20, 2);
    t28 = (t0 + 3800);
    t36 = (t28 + 72U);
    t50 = *((char **)t36);
    t51 = ((char*)((ng4)));
    t52 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t53, t54, t55, ((int*)(t50)), 2, t51, 32, 1, t52, 32, 1);
    t56 = (t48 + 4);
    t38 = *((unsigned int *)t56);
    t62 = (!(t38));
    t57 = (t49 + 4);
    t39 = *((unsigned int *)t57);
    t65 = (!(t39));
    t66 = (t62 && t65);
    t58 = (t53 + 4);
    t40 = *((unsigned int *)t58);
    t69 = (!(t40));
    t70 = (t66 && t69);
    t59 = (t54 + 4);
    t41 = *((unsigned int *)t59);
    t73 = (!(t41));
    t74 = (t70 && t73);
    t60 = (t55 + 4);
    t42 = *((unsigned int *)t60);
    t77 = (!(t42));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB30;

LAB31:    goto LAB29;

LAB30:    t43 = *((unsigned int *)t55);
    t80 = (t43 + 0);
    t44 = *((unsigned int *)t49);
    t45 = *((unsigned int *)t54);
    t83 = (t44 + t45);
    t46 = *((unsigned int *)t53);
    t47 = *((unsigned int *)t54);
    t86 = (t46 - t47);
    t87 = (t86 + 1);
    xsi_vlogvar_wait_assign_value(t20, t26, t80, t83, t87, 0LL);
    goto LAB31;

LAB32:    xsi_set_current_line(58, ng0);
    t16 = (t0 + 2920U);
    t17 = *((char **)t16);
    memset(t26, 0, 8);
    t16 = (t26 + 4);
    t18 = (t17 + 4);
    t31 = *((unsigned int *)t17);
    t32 = (t31 >> 16);
    *((unsigned int *)t26) = t32;
    t33 = *((unsigned int *)t18);
    t34 = (t33 >> 16);
    *((unsigned int *)t16) = t34;
    t35 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t35 & 255U);
    t37 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t37 & 255U);
    t20 = (t0 + 3800);
    t21 = (t0 + 3800);
    t22 = (t21 + 72U);
    t23 = *((char **)t22);
    t24 = (t0 + 3800);
    t25 = (t24 + 64U);
    t27 = *((char **)t25);
    t28 = (t0 + 2280U);
    t29 = *((char **)t28);
    xsi_vlog_generic_convert_array_indices(t48, t49, t23, t27, 2, 1, t29, 20, 2);
    t28 = (t0 + 3800);
    t36 = (t28 + 72U);
    t50 = *((char **)t36);
    t51 = ((char*)((ng6)));
    t52 = ((char*)((ng7)));
    xsi_vlog_convert_partindices(t53, t54, t55, ((int*)(t50)), 2, t51, 32, 1, t52, 32, 1);
    t56 = (t48 + 4);
    t38 = *((unsigned int *)t56);
    t62 = (!(t38));
    t57 = (t49 + 4);
    t39 = *((unsigned int *)t57);
    t65 = (!(t39));
    t66 = (t62 && t65);
    t58 = (t53 + 4);
    t40 = *((unsigned int *)t58);
    t69 = (!(t40));
    t70 = (t66 && t69);
    t59 = (t54 + 4);
    t41 = *((unsigned int *)t59);
    t73 = (!(t41));
    t74 = (t70 && t73);
    t60 = (t55 + 4);
    t42 = *((unsigned int *)t60);
    t77 = (!(t42));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB35;

LAB36:    goto LAB34;

LAB35:    t43 = *((unsigned int *)t55);
    t80 = (t43 + 0);
    t44 = *((unsigned int *)t49);
    t45 = *((unsigned int *)t54);
    t83 = (t44 + t45);
    t46 = *((unsigned int *)t53);
    t47 = *((unsigned int *)t54);
    t86 = (t46 - t47);
    t87 = (t86 + 1);
    xsi_vlogvar_wait_assign_value(t20, t26, t80, t83, t87, 0LL);
    goto LAB36;

LAB37:    xsi_set_current_line(59, ng0);
    t16 = (t0 + 2920U);
    t17 = *((char **)t16);
    memset(t26, 0, 8);
    t16 = (t26 + 4);
    t18 = (t17 + 4);
    t31 = *((unsigned int *)t17);
    t32 = (t31 >> 24);
    *((unsigned int *)t26) = t32;
    t33 = *((unsigned int *)t18);
    t34 = (t33 >> 24);
    *((unsigned int *)t16) = t34;
    t35 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t35 & 255U);
    t37 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t37 & 255U);
    t20 = (t0 + 3800);
    t21 = (t0 + 3800);
    t22 = (t21 + 72U);
    t23 = *((char **)t22);
    t24 = (t0 + 3800);
    t25 = (t24 + 64U);
    t27 = *((char **)t25);
    t28 = (t0 + 2280U);
    t29 = *((char **)t28);
    xsi_vlog_generic_convert_array_indices(t48, t49, t23, t27, 2, 1, t29, 20, 2);
    t28 = (t0 + 3800);
    t36 = (t28 + 72U);
    t50 = *((char **)t36);
    t51 = ((char*)((ng8)));
    t52 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t53, t54, t55, ((int*)(t50)), 2, t51, 32, 1, t52, 32, 1);
    t56 = (t48 + 4);
    t38 = *((unsigned int *)t56);
    t62 = (!(t38));
    t57 = (t49 + 4);
    t39 = *((unsigned int *)t57);
    t65 = (!(t39));
    t66 = (t62 && t65);
    t58 = (t53 + 4);
    t40 = *((unsigned int *)t58);
    t69 = (!(t40));
    t70 = (t66 && t69);
    t59 = (t54 + 4);
    t41 = *((unsigned int *)t59);
    t73 = (!(t41));
    t74 = (t70 && t73);
    t60 = (t55 + 4);
    t42 = *((unsigned int *)t60);
    t77 = (!(t42));
    t78 = (t74 && t77);
    if (t78 == 1)
        goto LAB40;

LAB41:    goto LAB39;

LAB40:    t43 = *((unsigned int *)t55);
    t80 = (t43 + 0);
    t44 = *((unsigned int *)t49);
    t45 = *((unsigned int *)t54);
    t83 = (t44 + t45);
    t46 = *((unsigned int *)t53);
    t47 = *((unsigned int *)t54);
    t86 = (t46 - t47);
    t87 = (t86 + 1);
    xsi_vlogvar_wait_assign_value(t20, t26, t80, t83, t87, 0LL);
    goto LAB41;

LAB42:    xsi_set_current_line(61, ng0);

LAB45:    xsi_set_current_line(62, ng0);
    t4 = (t0 + 3800);
    t5 = (t4 + 56U);
    t16 = *((char **)t5);
    t17 = (t0 + 3800);
    t18 = (t17 + 72U);
    t20 = *((char **)t18);
    t21 = (t0 + 3800);
    t22 = (t21 + 64U);
    t23 = *((char **)t22);
    t24 = (t0 + 2280U);
    t25 = *((char **)t24);
    memset(t26, 0, 8);
    t24 = (t26 + 4);
    t27 = (t25 + 4);
    t11 = *((unsigned int *)t25);
    t12 = (t11 >> 0);
    *((unsigned int *)t26) = t12;
    t13 = *((unsigned int *)t27);
    t14 = (t13 >> 0);
    *((unsigned int *)t24) = t14;
    t15 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t15 & 1023U);
    t30 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t30 & 1023U);
    xsi_vlog_generic_get_array_select_value(t19, 32, t16, t20, t23, 2, 1, t26, 10, 2);
    t28 = (t0 + 3640);
    xsi_vlogvar_wait_assign_value(t28, t19, 0, 0, 32, 0LL);
    goto LAB44;

}


extern void work_m_00000000002004589193_2419749778_init()
{
	static char *pe[] = {(void *)Initial_28_0,(void *)Cont_31_1,(void *)Cont_32_2,(void *)Initial_38_3,(void *)Always_44_4};
	xsi_register_didat("work_m_00000000002004589193_2419749778", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000002004589193_2419749778.didat");
	xsi_register_executes(pe);
}
