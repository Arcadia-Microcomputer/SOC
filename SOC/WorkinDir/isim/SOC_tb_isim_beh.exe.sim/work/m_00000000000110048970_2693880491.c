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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/I2S/I2SBusInterface.v";
static int ng1[] = {0, 0};
static int ng2[] = {7, 0};
static int ng3[] = {15, 0};
static int ng4[] = {8, 0};
static int ng5[] = {23, 0};
static int ng6[] = {16, 0};
static int ng7[] = {31, 0};
static int ng8[] = {24, 0};
static int ng9[] = {39, 0};
static int ng10[] = {32, 0};
static int ng11[] = {47, 0};
static int ng12[] = {40, 0};
static int ng13[] = {1, 0};
static unsigned int ng14[] = {0U, 0U};
static int ng15[] = {0, 0, 0, 0};



static void Initial_27_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(27, ng0);

LAB2:    xsi_set_current_line(28, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4712);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(29, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 4872);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void NetDecl_51_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t20[8];
    char t34[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;

LAB0:    t1 = (t0 + 6840U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 5192);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t69 = *((unsigned int *)t4);
    t70 = (~(t69));
    t71 = *((unsigned int *)t14);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t74, 8);

LAB16:    t73 = (t0 + 7768);
    t75 = (t73 + 56U);
    t76 = *((char **)t75);
    t77 = (t76 + 56U);
    t78 = *((char **)t77);
    memset(t78, 0, 8);
    t79 = 1U;
    t80 = t79;
    t81 = (t3 + 4);
    t82 = *((unsigned int *)t3);
    t79 = (t79 & t82);
    t83 = *((unsigned int *)t81);
    t80 = (t80 & t83);
    t84 = (t78 + 4);
    t85 = *((unsigned int *)t78);
    *((unsigned int *)t78) = (t85 | t79);
    t86 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t86 | t80);
    xsi_driver_vfirst_trans(t73, 0, 0U);
    t87 = (t0 + 7656);
    *((int *)t87) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 3832U);
    t19 = *((char **)t18);
    memset(t20, 0, 8);
    t18 = (t19 + 4);
    t21 = *((unsigned int *)t18);
    t22 = (~(t21));
    t23 = *((unsigned int *)t19);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t18) != 0)
        goto LAB19;

LAB20:    t27 = (t20 + 4);
    t28 = *((unsigned int *)t20);
    t29 = (!(t28));
    t30 = *((unsigned int *)t27);
    t31 = (t29 || t30);
    if (t31 > 0)
        goto LAB21;

LAB22:    memcpy(t41, t20, 8);

LAB23:    goto LAB9;

LAB10:    t73 = (t0 + 3672U);
    t74 = *((char **)t73);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t41, 1, t74, 1);
    goto LAB16;

LAB14:    memcpy(t3, t41, 8);
    goto LAB16;

LAB17:    *((unsigned int *)t20) = 1;
    goto LAB20;

LAB19:    t26 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB20;

LAB21:    t32 = (t0 + 3672U);
    t33 = *((char **)t32);
    memset(t34, 0, 8);
    t32 = (t33 + 4);
    t35 = *((unsigned int *)t32);
    t36 = (~(t35));
    t37 = *((unsigned int *)t33);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t32) != 0)
        goto LAB26;

LAB27:    t42 = *((unsigned int *)t20);
    t43 = *((unsigned int *)t34);
    t44 = (t42 | t43);
    *((unsigned int *)t41) = t44;
    t45 = (t20 + 4);
    t46 = (t34 + 4);
    t47 = (t41 + 4);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    *((unsigned int *)t47) = t50;
    t51 = *((unsigned int *)t47);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB28;

LAB29:
LAB30:    goto LAB23;

LAB24:    *((unsigned int *)t34) = 1;
    goto LAB27;

LAB26:    t40 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB27;

LAB28:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t41) = (t53 | t54);
    t55 = (t20 + 4);
    t56 = (t34 + 4);
    t57 = *((unsigned int *)t55);
    t58 = (~(t57));
    t59 = *((unsigned int *)t20);
    t60 = (t59 & t58);
    t61 = *((unsigned int *)t56);
    t62 = (~(t61));
    t63 = *((unsigned int *)t34);
    t64 = (t63 & t62);
    t65 = (~(t60));
    t66 = (~(t64));
    t67 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t67 & t65);
    t68 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t68 & t66);
    goto LAB30;

}

static void Always_53_2(char *t0)
{
    char t20[8];
    char t22[8];
    char t32[8];
    char t33[8];
    char t34[8];
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
    unsigned int t21;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    int t42;
    char *t43;
    unsigned int t44;
    int t45;
    int t46;
    char *t47;
    unsigned int t48;
    int t49;
    int t50;
    unsigned int t51;
    int t52;
    unsigned int t53;
    unsigned int t54;
    int t55;
    int t56;

LAB0:    t1 = (t0 + 7088U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 7672);
    *((int *)t2) = 1;
    t3 = (t0 + 7120);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(53, ng0);

LAB5:    xsi_set_current_line(54, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 4712);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4872);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5192);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1752U);
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

LAB6:    xsi_set_current_line(58, ng0);

LAB9:    xsi_set_current_line(60, ng0);
    t4 = (t0 + 2392U);
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
LAB12:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2232U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB56;

LAB57:
LAB58:    goto LAB8;

LAB10:    xsi_set_current_line(60, ng0);

LAB13:    xsi_set_current_line(61, ng0);
    t16 = (t0 + 1912U);
    t17 = *((char **)t16);

LAB14:    t16 = (t0 + 608);
    t18 = *((char **)t16);
    t19 = xsi_vlog_unsigned_case_compare(t17, 10, t18, 32);
    if (t19 == 1)
        goto LAB15;

LAB16:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t19 = xsi_vlog_unsigned_case_compare(t17, 10, t3, 32);
    if (t19 == 1)
        goto LAB17;

LAB18:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t19 = xsi_vlog_unsigned_case_compare(t17, 10, t3, 32);
    if (t19 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB12;

LAB15:    xsi_set_current_line(62, ng0);

LAB22:    goto LAB21;

LAB17:    xsi_set_current_line(64, ng0);

LAB23:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2072U);
    t4 = *((char **)t2);
    memset(t20, 0, 8);
    t2 = (t20 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t20) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t16 = (t20 + 4);
    t12 = *((unsigned int *)t16);
    t13 = (~(t12));
    t14 = *((unsigned int *)t20);
    t15 = (t14 & t13);
    t21 = (t15 != 0);
    if (t21 > 0)
        goto LAB24;

LAB25:
LAB26:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    memset(t20, 0, 8);
    t2 = (t20 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t20) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t20 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t20);
    t15 = (t14 & t13);
    t21 = (t15 != 0);
    if (t21 > 0)
        goto LAB29;

LAB30:
LAB31:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    memset(t20, 0, 8);
    t2 = (t20 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t20) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 2);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t20 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t20);
    t15 = (t14 & t13);
    t21 = (t15 != 0);
    if (t21 > 0)
        goto LAB34;

LAB35:
LAB36:    goto LAB21;

LAB19:    xsi_set_current_line(69, ng0);

LAB39:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 2072U);
    t4 = *((char **)t2);
    memset(t20, 0, 8);
    t2 = (t20 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t20) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t16 = (t20 + 4);
    t12 = *((unsigned int *)t16);
    t13 = (~(t12));
    t14 = *((unsigned int *)t20);
    t15 = (t14 & t13);
    t21 = (t15 != 0);
    if (t21 > 0)
        goto LAB40;

LAB41:
LAB42:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    memset(t20, 0, 8);
    t2 = (t20 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t20) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 1);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t20 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t20);
    t15 = (t14 & t13);
    t21 = (t15 != 0);
    if (t21 > 0)
        goto LAB45;

LAB46:
LAB47:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 2072U);
    t3 = *((char **)t2);
    memset(t20, 0, 8);
    t2 = (t20 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t20) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 2);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t20 + 4);
    t12 = *((unsigned int *)t5);
    t13 = (~(t12));
    t14 = *((unsigned int *)t20);
    t15 = (t14 & t13);
    t21 = (t15 != 0);
    if (t21 > 0)
        goto LAB50;

LAB51:
LAB52:    goto LAB21;

LAB24:    xsi_set_current_line(65, ng0);
    t18 = (t0 + 2552U);
    t23 = *((char **)t18);
    memset(t22, 0, 8);
    t18 = (t22 + 4);
    t24 = (t23 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (t25 >> 0);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t24);
    t28 = (t27 >> 0);
    *((unsigned int *)t18) = t28;
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 255U);
    t30 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t30 & 255U);
    t31 = (t0 + 5032);
    t35 = (t0 + 5032);
    t36 = (t35 + 72U);
    t37 = *((char **)t36);
    t38 = ((char*)((ng2)));
    t39 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t32, t33, t34, ((int*)(t37)), 2, t38, 32, 1, t39, 32, 1);
    t40 = (t32 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (!(t41));
    t43 = (t33 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (!(t44));
    t46 = (t42 && t45);
    t47 = (t34 + 4);
    t48 = *((unsigned int *)t47);
    t49 = (!(t48));
    t50 = (t46 && t49);
    if (t50 == 1)
        goto LAB27;

LAB28:    goto LAB26;

LAB27:    t51 = *((unsigned int *)t34);
    t52 = (t51 + 0);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t33);
    t55 = (t53 - t54);
    t56 = (t55 + 1);
    xsi_vlogvar_wait_assign_value(t31, t22, t52, *((unsigned int *)t33), t56, 0LL);
    goto LAB28;

LAB29:    xsi_set_current_line(66, ng0);
    t16 = (t0 + 2552U);
    t18 = *((char **)t16);
    memset(t22, 0, 8);
    t16 = (t22 + 4);
    t23 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    t26 = (t25 >> 8);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 8);
    *((unsigned int *)t16) = t28;
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 255U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 255U);
    t24 = (t0 + 5032);
    t31 = (t0 + 5032);
    t35 = (t31 + 72U);
    t36 = *((char **)t35);
    t37 = ((char*)((ng3)));
    t38 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t32, t33, t34, ((int*)(t36)), 2, t37, 32, 1, t38, 32, 1);
    t39 = (t32 + 4);
    t41 = *((unsigned int *)t39);
    t19 = (!(t41));
    t40 = (t33 + 4);
    t44 = *((unsigned int *)t40);
    t42 = (!(t44));
    t45 = (t19 && t42);
    t43 = (t34 + 4);
    t48 = *((unsigned int *)t43);
    t46 = (!(t48));
    t49 = (t45 && t46);
    if (t49 == 1)
        goto LAB32;

LAB33:    goto LAB31;

LAB32:    t51 = *((unsigned int *)t34);
    t50 = (t51 + 0);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t33);
    t52 = (t53 - t54);
    t55 = (t52 + 1);
    xsi_vlogvar_wait_assign_value(t24, t22, t50, *((unsigned int *)t33), t55, 0LL);
    goto LAB33;

LAB34:    xsi_set_current_line(67, ng0);
    t16 = (t0 + 2552U);
    t18 = *((char **)t16);
    memset(t22, 0, 8);
    t16 = (t22 + 4);
    t23 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    t26 = (t25 >> 16);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 16);
    *((unsigned int *)t16) = t28;
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 255U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 255U);
    t24 = (t0 + 5032);
    t31 = (t0 + 5032);
    t35 = (t31 + 72U);
    t36 = *((char **)t35);
    t37 = ((char*)((ng5)));
    t38 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t32, t33, t34, ((int*)(t36)), 2, t37, 32, 1, t38, 32, 1);
    t39 = (t32 + 4);
    t41 = *((unsigned int *)t39);
    t19 = (!(t41));
    t40 = (t33 + 4);
    t44 = *((unsigned int *)t40);
    t42 = (!(t44));
    t45 = (t19 && t42);
    t43 = (t34 + 4);
    t48 = *((unsigned int *)t43);
    t46 = (!(t48));
    t49 = (t45 && t46);
    if (t49 == 1)
        goto LAB37;

LAB38:    goto LAB36;

LAB37:    t51 = *((unsigned int *)t34);
    t50 = (t51 + 0);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t33);
    t52 = (t53 - t54);
    t55 = (t52 + 1);
    xsi_vlogvar_wait_assign_value(t24, t22, t50, *((unsigned int *)t33), t55, 0LL);
    goto LAB38;

LAB40:    xsi_set_current_line(70, ng0);
    t18 = (t0 + 2552U);
    t23 = *((char **)t18);
    memset(t22, 0, 8);
    t18 = (t22 + 4);
    t24 = (t23 + 4);
    t25 = *((unsigned int *)t23);
    t26 = (t25 >> 0);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t24);
    t28 = (t27 >> 0);
    *((unsigned int *)t18) = t28;
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 255U);
    t30 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t30 & 255U);
    t31 = (t0 + 5032);
    t35 = (t0 + 5032);
    t36 = (t35 + 72U);
    t37 = *((char **)t36);
    t38 = ((char*)((ng7)));
    t39 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t32, t33, t34, ((int*)(t37)), 2, t38, 32, 1, t39, 32, 1);
    t40 = (t32 + 4);
    t41 = *((unsigned int *)t40);
    t42 = (!(t41));
    t43 = (t33 + 4);
    t44 = *((unsigned int *)t43);
    t45 = (!(t44));
    t46 = (t42 && t45);
    t47 = (t34 + 4);
    t48 = *((unsigned int *)t47);
    t49 = (!(t48));
    t50 = (t46 && t49);
    if (t50 == 1)
        goto LAB43;

LAB44:    goto LAB42;

LAB43:    t51 = *((unsigned int *)t34);
    t52 = (t51 + 0);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t33);
    t55 = (t53 - t54);
    t56 = (t55 + 1);
    xsi_vlogvar_wait_assign_value(t31, t22, t52, *((unsigned int *)t33), t56, 0LL);
    goto LAB44;

LAB45:    xsi_set_current_line(71, ng0);
    t16 = (t0 + 2552U);
    t18 = *((char **)t16);
    memset(t22, 0, 8);
    t16 = (t22 + 4);
    t23 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    t26 = (t25 >> 8);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 8);
    *((unsigned int *)t16) = t28;
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 255U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 255U);
    t24 = (t0 + 5032);
    t31 = (t0 + 5032);
    t35 = (t31 + 72U);
    t36 = *((char **)t35);
    t37 = ((char*)((ng9)));
    t38 = ((char*)((ng10)));
    xsi_vlog_convert_partindices(t32, t33, t34, ((int*)(t36)), 2, t37, 32, 1, t38, 32, 1);
    t39 = (t32 + 4);
    t41 = *((unsigned int *)t39);
    t19 = (!(t41));
    t40 = (t33 + 4);
    t44 = *((unsigned int *)t40);
    t42 = (!(t44));
    t45 = (t19 && t42);
    t43 = (t34 + 4);
    t48 = *((unsigned int *)t43);
    t46 = (!(t48));
    t49 = (t45 && t46);
    if (t49 == 1)
        goto LAB48;

LAB49:    goto LAB47;

LAB48:    t51 = *((unsigned int *)t34);
    t50 = (t51 + 0);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t33);
    t52 = (t53 - t54);
    t55 = (t52 + 1);
    xsi_vlogvar_wait_assign_value(t24, t22, t50, *((unsigned int *)t33), t55, 0LL);
    goto LAB49;

LAB50:    xsi_set_current_line(72, ng0);

LAB53:    xsi_set_current_line(73, ng0);
    t16 = (t0 + 2552U);
    t18 = *((char **)t16);
    memset(t22, 0, 8);
    t16 = (t22 + 4);
    t23 = (t18 + 4);
    t25 = *((unsigned int *)t18);
    t26 = (t25 >> 16);
    *((unsigned int *)t22) = t26;
    t27 = *((unsigned int *)t23);
    t28 = (t27 >> 16);
    *((unsigned int *)t16) = t28;
    t29 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t29 & 255U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 255U);
    t24 = (t0 + 5032);
    t31 = (t0 + 5032);
    t35 = (t31 + 72U);
    t36 = *((char **)t35);
    t37 = ((char*)((ng11)));
    t38 = ((char*)((ng12)));
    xsi_vlog_convert_partindices(t32, t33, t34, ((int*)(t36)), 2, t37, 32, 1, t38, 32, 1);
    t39 = (t32 + 4);
    t41 = *((unsigned int *)t39);
    t19 = (!(t41));
    t40 = (t33 + 4);
    t44 = *((unsigned int *)t40);
    t42 = (!(t44));
    t45 = (t19 && t42);
    t43 = (t34 + 4);
    t48 = *((unsigned int *)t43);
    t46 = (!(t48));
    t49 = (t45 && t46);
    if (t49 == 1)
        goto LAB54;

LAB55:    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 5192);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB52;

LAB54:    t51 = *((unsigned int *)t34);
    t50 = (t51 + 0);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t33);
    t52 = (t53 - t54);
    t55 = (t52 + 1);
    xsi_vlogvar_wait_assign_value(t24, t22, t50, *((unsigned int *)t33), t55, 0LL);
    goto LAB55;

LAB56:    xsi_set_current_line(81, ng0);

LAB59:    xsi_set_current_line(82, ng0);
    t4 = (t0 + 1912U);
    t5 = *((char **)t4);

LAB60:    t4 = (t0 + 608);
    t16 = *((char **)t4);
    t19 = xsi_vlog_unsigned_case_compare(t5, 10, t16, 32);
    if (t19 == 1)
        goto LAB61;

LAB62:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t19 = xsi_vlog_unsigned_case_compare(t5, 10, t3, 32);
    if (t19 == 1)
        goto LAB63;

LAB64:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t19 = xsi_vlog_unsigned_case_compare(t5, 10, t3, 32);
    if (t19 == 1)
        goto LAB65;

LAB66:
LAB68:
LAB67:    xsi_set_current_line(92, ng0);

LAB73:    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4712);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB69:    goto LAB58;

LAB61:    xsi_set_current_line(83, ng0);

LAB70:    xsi_set_current_line(84, ng0);
    t4 = (t0 + 4312U);
    t18 = *((char **)t4);
    t4 = ((char*)((ng14)));
    xsi_vlogtype_concat(t20, 32, 32, 2U, t4, 31, t18, 1);
    t23 = (t0 + 4712);
    xsi_vlogvar_wait_assign_value(t23, t20, 0, 0, 32, 0LL);
    goto LAB69;

LAB63:    xsi_set_current_line(86, ng0);

LAB71:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 5032);
    t4 = (t2 + 56U);
    t16 = *((char **)t4);
    memset(t22, 0, 8);
    t18 = (t22 + 4);
    t23 = (t16 + 4);
    t6 = *((unsigned int *)t16);
    t7 = (t6 >> 0);
    *((unsigned int *)t22) = t7;
    t8 = *((unsigned int *)t23);
    t9 = (t8 >> 0);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t10 & 16777215U);
    t11 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t11 & 16777215U);
    t24 = ((char*)((ng14)));
    xsi_vlogtype_concat(t20, 32, 32, 2U, t24, 8, t22, 24);
    t31 = (t0 + 4712);
    xsi_vlogvar_wait_assign_value(t31, t20, 0, 0, 32, 0LL);
    goto LAB69;

LAB65:    xsi_set_current_line(89, ng0);

LAB72:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 5032);
    t4 = (t2 + 56U);
    t16 = *((char **)t4);
    memset(t22, 0, 8);
    t18 = (t22 + 4);
    t23 = (t16 + 4);
    t6 = *((unsigned int *)t16);
    t7 = (t6 >> 24);
    *((unsigned int *)t22) = t7;
    t8 = *((unsigned int *)t23);
    t9 = (t8 >> 24);
    *((unsigned int *)t18) = t9;
    t24 = (t16 + 8);
    t31 = (t16 + 12);
    t10 = *((unsigned int *)t24);
    t11 = (t10 << 8);
    t12 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t12 | t11);
    t13 = *((unsigned int *)t31);
    t14 = (t13 << 8);
    t15 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t15 | t14);
    t21 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t21 & 16777215U);
    t25 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t25 & 16777215U);
    t35 = ((char*)((ng14)));
    xsi_vlogtype_concat(t20, 32, 32, 2U, t35, 8, t22, 24);
    t36 = (t0 + 4712);
    xsi_vlogvar_wait_assign_value(t36, t20, 0, 0, 32, 0LL);
    goto LAB69;

}

static void Always_101_3(char *t0)
{
    char t6[8];
    char t20[8];
    char t36[8];
    char t52[8];
    char t60[8];
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
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
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
    char *t51;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    char *t59;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    int t84;
    int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;

LAB0:    t1 = (t0 + 7336U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 7688);
    *((int *)t2) = 1;
    t3 = (t0 + 7368);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(101, ng0);

LAB5:    xsi_set_current_line(102, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 5352);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 4152U);
    t3 = *((char **)t2);
    t2 = (t0 + 5672);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 4152U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng13)));
    memset(t6, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t4);
    t11 = *((unsigned int *)t5);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t4);
    t15 = *((unsigned int *)t5);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB9;

LAB6:    if (t16 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    memset(t20, 0, 8);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t6);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t21) != 0)
        goto LAB12;

LAB13:    t28 = (t20 + 4);
    t29 = *((unsigned int *)t20);
    t30 = *((unsigned int *)t28);
    t31 = (t29 || t30);
    if (t31 > 0)
        goto LAB14;

LAB15:    memcpy(t60, t20, 8);

LAB16:    t92 = (t60 + 4);
    t93 = *((unsigned int *)t92);
    t94 = (~(t93));
    t95 = *((unsigned int *)t60);
    t96 = (t95 & t94);
    t97 = (t96 != 0);
    if (t97 > 0)
        goto LAB28;

LAB29:
LAB30:    goto LAB2;

LAB8:    t19 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB9;

LAB10:    *((unsigned int *)t20) = 1;
    goto LAB13;

LAB12:    t27 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB13;

LAB14:    t32 = (t0 + 5672);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = ((char*)((ng1)));
    memset(t36, 0, 8);
    t37 = (t34 + 4);
    t38 = (t35 + 4);
    t39 = *((unsigned int *)t34);
    t40 = *((unsigned int *)t35);
    t41 = (t39 ^ t40);
    t42 = *((unsigned int *)t37);
    t43 = *((unsigned int *)t38);
    t44 = (t42 ^ t43);
    t45 = (t41 | t44);
    t46 = *((unsigned int *)t37);
    t47 = *((unsigned int *)t38);
    t48 = (t46 | t47);
    t49 = (~(t48));
    t50 = (t45 & t49);
    if (t50 != 0)
        goto LAB20;

LAB17:    if (t48 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t36) = 1;

LAB20:    memset(t52, 0, 8);
    t53 = (t36 + 4);
    t54 = *((unsigned int *)t53);
    t55 = (~(t54));
    t56 = *((unsigned int *)t36);
    t57 = (t56 & t55);
    t58 = (t57 & 1U);
    if (t58 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t53) != 0)
        goto LAB23;

LAB24:    t61 = *((unsigned int *)t20);
    t62 = *((unsigned int *)t52);
    t63 = (t61 & t62);
    *((unsigned int *)t60) = t63;
    t64 = (t20 + 4);
    t65 = (t52 + 4);
    t66 = (t60 + 4);
    t67 = *((unsigned int *)t64);
    t68 = *((unsigned int *)t65);
    t69 = (t67 | t68);
    *((unsigned int *)t66) = t69;
    t70 = *((unsigned int *)t66);
    t71 = (t70 != 0);
    if (t71 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB16;

LAB19:    t51 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB20;

LAB21:    *((unsigned int *)t52) = 1;
    goto LAB24;

LAB23:    t59 = (t52 + 4);
    *((unsigned int *)t52) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB24;

LAB25:    t72 = *((unsigned int *)t60);
    t73 = *((unsigned int *)t66);
    *((unsigned int *)t60) = (t72 | t73);
    t74 = (t20 + 4);
    t75 = (t52 + 4);
    t76 = *((unsigned int *)t20);
    t77 = (~(t76));
    t78 = *((unsigned int *)t74);
    t79 = (~(t78));
    t80 = *((unsigned int *)t52);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (~(t82));
    t84 = (t77 & t79);
    t85 = (t81 & t83);
    t86 = (~(t84));
    t87 = (~(t85));
    t88 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t88 & t86);
    t89 = *((unsigned int *)t66);
    *((unsigned int *)t66) = (t89 & t87);
    t90 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t90 & t86);
    t91 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t91 & t87);
    goto LAB27;

LAB28:    xsi_set_current_line(105, ng0);

LAB31:    xsi_set_current_line(106, ng0);
    t98 = (t0 + 3992U);
    t99 = *((char **)t98);
    t98 = (t99 + 4);
    t100 = *((unsigned int *)t98);
    t101 = (~(t100));
    t102 = *((unsigned int *)t99);
    t103 = (t102 & t101);
    t104 = (t103 != 0);
    if (t104 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(108, ng0);

LAB36:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 3512U);
    t3 = *((char **)t2);
    t2 = (t0 + 5512);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 48, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 5352);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB34:    goto LAB30;

LAB32:    xsi_set_current_line(106, ng0);

LAB35:    xsi_set_current_line(107, ng0);
    t105 = ((char*)((ng15)));
    t106 = (t0 + 5512);
    xsi_vlogvar_wait_assign_value(t106, t105, 0, 0, 48, 0LL);
    goto LAB34;

}


extern void work_m_00000000000110048970_2693880491_init()
{
	static char *pe[] = {(void *)Initial_27_0,(void *)NetDecl_51_1,(void *)Always_53_2,(void *)Always_101_3};
	xsi_register_didat("work_m_00000000000110048970_2693880491", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000000110048970_2693880491.didat");
	xsi_register_executes(pe);
}
