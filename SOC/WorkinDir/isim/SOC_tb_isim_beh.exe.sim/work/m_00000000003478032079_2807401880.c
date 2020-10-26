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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/UART/UartBusInterface.v";
static int ng1[] = {0, 0};
static unsigned int ng2[] = {0U, 0U};
static int ng3[] = {7, 0};
static int ng4[] = {15, 0};
static int ng5[] = {8, 0};
static int ng6[] = {1, 0};



static void Initial_26_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(26, ng0);

LAB2:    xsi_set_current_line(27, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(28, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 5216);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Cont_64_1(char *t0)
{
    char t3[8];
    char t4[8];
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
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
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

LAB0:    t1 = (t0 + 7824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 5856);
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

LAB9:    t20 = *((unsigned int *)t4);
    t21 = (~(t20));
    t22 = *((unsigned int *)t14);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t18, 8);

LAB16:    t24 = (t0 + 8752);
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
    t37 = (t0 + 8640);
    *((int *)t37) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 4336U);
    t19 = *((char **)t18);
    goto LAB9;

LAB10:    t18 = ((char*)((ng2)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 1, t19, 1, t18, 1);
    goto LAB16;

LAB14:    memcpy(t3, t19, 8);
    goto LAB16;

}

static void Always_66_2(char *t0)
{
    char t21[8];
    char t35[8];
    char t46[8];
    char t47[8];
    char t48[8];
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
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    int t56;
    char *t57;
    unsigned int t58;
    int t59;
    int t60;
    char *t61;
    unsigned int t62;
    int t63;
    int t64;
    unsigned int t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    int t69;
    int t70;
    char *t71;
    char *t72;
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
    char *t84;
    char *t85;
    char *t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;
    char *t97;

LAB0:    t1 = (t0 + 8072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(66, ng0);
    t2 = (t0 + 8656);
    *((int *)t2) = 1;
    t3 = (t0 + 8104);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(66, ng0);

LAB5:    xsi_set_current_line(67, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5216);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6336);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 6656);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1616U);
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

LAB6:    xsi_set_current_line(72, ng0);

LAB9:    xsi_set_current_line(74, ng0);
    t4 = (t0 + 2256U);
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
LAB12:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2096U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB40;

LAB41:
LAB42:    goto LAB8;

LAB10:    xsi_set_current_line(74, ng0);

LAB13:    xsi_set_current_line(75, ng0);
    t16 = (t0 + 1776U);
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

LAB18:
LAB19:    goto LAB12;

LAB15:    xsi_set_current_line(76, ng0);

LAB20:    xsi_set_current_line(77, ng0);
    t16 = (t0 + 1936U);
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
        goto LAB21;

LAB22:
LAB23:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1936U);
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
        goto LAB26;

LAB27:
LAB28:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1936U);
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
        goto LAB31;

LAB32:
LAB33:    goto LAB19;

LAB17:    xsi_set_current_line(85, ng0);

LAB35:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 1936U);
    t4 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t21) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t16 = (t21 + 4);
    t12 = *((unsigned int *)t16);
    t13 = (~(t12));
    t14 = *((unsigned int *)t21);
    t15 = (t14 & t13);
    t23 = (t15 != 0);
    if (t23 > 0)
        goto LAB36;

LAB37:
LAB38:    goto LAB19;

LAB21:    xsi_set_current_line(77, ng0);
    t36 = (t0 + 2416U);
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
    *((unsigned int *)t35) = (t43 & 255U);
    t44 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t44 & 255U);
    t45 = (t0 + 5376);
    t49 = (t0 + 5376);
    t50 = (t49 + 72U);
    t51 = *((char **)t50);
    t52 = ((char*)((ng3)));
    t53 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t46, t47, t48, ((int*)(t51)), 2, t52, 32, 1, t53, 32, 1);
    t54 = (t46 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (!(t55));
    t57 = (t47 + 4);
    t58 = *((unsigned int *)t57);
    t59 = (!(t58));
    t60 = (t56 && t59);
    t61 = (t48 + 4);
    t62 = *((unsigned int *)t61);
    t63 = (!(t62));
    t64 = (t60 && t63);
    if (t64 == 1)
        goto LAB24;

LAB25:    goto LAB23;

LAB24:    t65 = *((unsigned int *)t48);
    t66 = (t65 + 0);
    t67 = *((unsigned int *)t46);
    t68 = *((unsigned int *)t47);
    t69 = (t67 - t68);
    t70 = (t69 + 1);
    xsi_vlogvar_wait_assign_value(t45, t35, t66, *((unsigned int *)t47), t70, 0LL);
    goto LAB25;

LAB26:    xsi_set_current_line(78, ng0);
    t16 = (t0 + 2416U);
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
    *((unsigned int *)t35) = (t28 & 255U);
    t30 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t30 & 255U);
    t22 = (t0 + 5376);
    t29 = (t0 + 5376);
    t36 = (t29 + 72U);
    t37 = *((char **)t36);
    t38 = ((char*)((ng4)));
    t45 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t46, t47, t48, ((int*)(t37)), 2, t38, 32, 1, t45, 32, 1);
    t49 = (t46 + 4);
    t31 = *((unsigned int *)t49);
    t19 = (!(t31));
    t50 = (t47 + 4);
    t32 = *((unsigned int *)t50);
    t56 = (!(t32));
    t59 = (t19 && t56);
    t51 = (t48 + 4);
    t33 = *((unsigned int *)t51);
    t60 = (!(t33));
    t63 = (t59 && t60);
    if (t63 == 1)
        goto LAB29;

LAB30:    goto LAB28;

LAB29:    t34 = *((unsigned int *)t48);
    t64 = (t34 + 0);
    t39 = *((unsigned int *)t46);
    t40 = *((unsigned int *)t47);
    t66 = (t39 - t40);
    t69 = (t66 + 1);
    xsi_vlogvar_wait_assign_value(t22, t35, t64, *((unsigned int *)t47), t69, 0LL);
    goto LAB30;

LAB31:    xsi_set_current_line(79, ng0);

LAB34:    xsi_set_current_line(80, ng0);
    t16 = (t0 + 2416U);
    t18 = *((char **)t16);
    memset(t35, 0, 8);
    t16 = (t35 + 4);
    t20 = (t18 + 4);
    t24 = *((unsigned int *)t18);
    t25 = (t24 >> 16);
    t26 = (t25 & 1);
    *((unsigned int *)t35) = t26;
    t27 = *((unsigned int *)t20);
    t28 = (t27 >> 16);
    t30 = (t28 & 1);
    *((unsigned int *)t16) = t30;
    t22 = (t0 + 5536);
    xsi_vlogvar_wait_assign_value(t22, t35, 0, 0, 1, 0LL);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2416U);
    t3 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 17);
    t8 = (t7 & 1);
    *((unsigned int *)t21) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 17);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t0 + 5696);
    xsi_vlogvar_wait_assign_value(t5, t21, 0, 0, 1, 0LL);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2416U);
    t3 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 21);
    t8 = (t7 & 1);
    *((unsigned int *)t21) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 21);
    t11 = (t10 & 1);
    *((unsigned int *)t2) = t11;
    t5 = (t0 + 5856);
    xsi_vlogvar_wait_assign_value(t5, t21, 0, 0, 1, 0LL);
    goto LAB33;

LAB36:    xsi_set_current_line(86, ng0);

LAB39:    xsi_set_current_line(87, ng0);
    t18 = ((char*)((ng6)));
    t20 = (t0 + 6336);
    xsi_vlogvar_wait_assign_value(t20, t18, 0, 0, 1, 0LL);
    xsi_set_current_line(88, ng0);
    t2 = (t0 + 2416U);
    t3 = *((char **)t2);
    memset(t21, 0, 8);
    t2 = (t21 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t21) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t10 & 255U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 255U);
    t5 = (t0 + 6016);
    xsi_vlogvar_wait_assign_value(t5, t21, 0, 0, 8, 0LL);
    goto LAB38;

LAB40:    xsi_set_current_line(95, ng0);

LAB43:    xsi_set_current_line(96, ng0);
    t4 = (t0 + 1776U);
    t5 = *((char **)t4);

LAB44:    t4 = (t0 + 608);
    t16 = *((char **)t4);
    t19 = xsi_vlog_unsigned_case_compare(t5, 10, t16, 32);
    if (t19 == 1)
        goto LAB45;

LAB46:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t19 = xsi_vlog_unsigned_case_compare(t5, 10, t3, 32);
    if (t19 == 1)
        goto LAB47;

LAB48:
LAB50:
LAB49:    xsi_set_current_line(105, ng0);

LAB72:    xsi_set_current_line(106, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB51:    goto LAB42;

LAB45:    xsi_set_current_line(97, ng0);

LAB52:    xsi_set_current_line(98, ng0);
    t4 = (t0 + 5376);
    t18 = (t4 + 56U);
    t20 = *((char **)t18);
    t22 = (t0 + 5536);
    t29 = (t22 + 56U);
    t36 = *((char **)t29);
    t37 = (t0 + 5696);
    t38 = (t37 + 56U);
    t45 = *((char **)t38);
    t49 = (t0 + 3536U);
    t50 = *((char **)t49);
    memset(t35, 0, 8);
    t49 = (t50 + 4);
    t11 = *((unsigned int *)t49);
    t12 = (~(t11));
    t13 = *((unsigned int *)t50);
    t14 = (t13 & t12);
    t15 = (t14 & 1U);
    if (t15 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t49) != 0)
        goto LAB55;

LAB56:    t52 = (t35 + 4);
    t23 = *((unsigned int *)t35);
    t24 = *((unsigned int *)t52);
    t25 = (t23 || t24);
    if (t25 > 0)
        goto LAB57;

LAB58:    memcpy(t47, t35, 8);

LAB59:    t84 = (t0 + 3376U);
    t85 = *((char **)t84);
    t84 = (t0 + 4176U);
    t86 = *((char **)t84);
    memset(t48, 0, 8);
    t84 = (t86 + 4);
    t87 = *((unsigned int *)t84);
    t88 = (~(t87));
    t89 = *((unsigned int *)t86);
    t90 = (t89 & t88);
    t91 = (t90 & 1U);
    if (t91 != 0)
        goto LAB70;

LAB68:    if (*((unsigned int *)t84) == 0)
        goto LAB67;

LAB69:    t92 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t92) = 1;

LAB70:    t93 = (t0 + 5856);
    t94 = (t93 + 56U);
    t95 = *((char **)t94);
    t96 = ((char*)((ng2)));
    xsi_vlogtype_concat(t21, 32, 32, 8U, t96, 10, t95, 1, t48, 1, t85, 1, t47, 1, t45, 1, t36, 1, t20, 16);
    t97 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t97, t21, 0, 0, 32, 0LL);
    goto LAB51;

LAB47:    xsi_set_current_line(101, ng0);

LAB71:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng6)));
    t4 = (t0 + 6656);
    xsi_vlogvar_wait_assign_value(t4, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 3856U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    xsi_vlogtype_concat(t21, 32, 32, 2U, t2, 24, t3, 8);
    t4 = (t0 + 5056);
    xsi_vlogvar_wait_assign_value(t4, t21, 0, 0, 32, 0LL);
    goto LAB51;

LAB53:    *((unsigned int *)t35) = 1;
    goto LAB56;

LAB55:    t51 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB56;

LAB57:    t53 = (t0 + 3696U);
    t54 = *((char **)t53);
    memset(t46, 0, 8);
    t53 = (t54 + 4);
    t26 = *((unsigned int *)t53);
    t27 = (~(t26));
    t28 = *((unsigned int *)t54);
    t30 = (t28 & t27);
    t31 = (t30 & 1U);
    if (t31 != 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t53) != 0)
        goto LAB62;

LAB63:    t32 = *((unsigned int *)t35);
    t33 = *((unsigned int *)t46);
    t34 = (t32 & t33);
    *((unsigned int *)t47) = t34;
    t61 = (t35 + 4);
    t71 = (t46 + 4);
    t72 = (t47 + 4);
    t39 = *((unsigned int *)t61);
    t40 = *((unsigned int *)t71);
    t41 = (t39 | t40);
    *((unsigned int *)t72) = t41;
    t42 = *((unsigned int *)t72);
    t43 = (t42 != 0);
    if (t43 == 1)
        goto LAB64;

LAB65:
LAB66:    goto LAB59;

LAB60:    *((unsigned int *)t46) = 1;
    goto LAB63;

LAB62:    t57 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB63;

LAB64:    t44 = *((unsigned int *)t47);
    t55 = *((unsigned int *)t72);
    *((unsigned int *)t47) = (t44 | t55);
    t73 = (t35 + 4);
    t74 = (t46 + 4);
    t58 = *((unsigned int *)t35);
    t62 = (~(t58));
    t65 = *((unsigned int *)t73);
    t67 = (~(t65));
    t68 = *((unsigned int *)t46);
    t75 = (~(t68));
    t76 = *((unsigned int *)t74);
    t77 = (~(t76));
    t56 = (t62 & t67);
    t59 = (t75 & t77);
    t78 = (~(t56));
    t79 = (~(t59));
    t80 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t80 & t78);
    t81 = *((unsigned int *)t72);
    *((unsigned int *)t72) = (t81 & t79);
    t82 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t82 & t78);
    t83 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t83 & t79);
    goto LAB66;

LAB67:    *((unsigned int *)t48) = 1;
    goto LAB70;

}

static void Always_113_3(char *t0)
{
    char t6[8];
    char t12[8];
    char t25[8];
    char t32[8];
    char t64[8];
    char t76[8];
    char t87[8];
    char t95[8];
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
    char *t24;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    int t56;
    int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    char *t71;
    char *t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    char *t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t94;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    int t119;
    int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    char *t133;
    char *t134;

LAB0:    t1 = (t0 + 8320U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 8672);
    *((int *)t2) = 1;
    t3 = (t0 + 8352);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(113, ng0);

LAB5:    xsi_set_current_line(114, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 6496);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(118, ng0);
    t2 = (t0 + 3536U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t3 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t3);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t2) == 0)
        goto LAB6;

LAB8:    t4 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t4) = 1;

LAB9:    memset(t12, 0, 8);
    t5 = (t6 + 4);
    t13 = *((unsigned int *)t5);
    t14 = (~(t13));
    t15 = *((unsigned int *)t6);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t5) != 0)
        goto LAB12;

LAB13:    t19 = (t12 + 4);
    t20 = *((unsigned int *)t12);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB14;

LAB15:    memcpy(t32, t12, 8);

LAB16:    memset(t64, 0, 8);
    t65 = (t32 + 4);
    t66 = *((unsigned int *)t65);
    t67 = (~(t66));
    t68 = *((unsigned int *)t32);
    t69 = (t68 & t67);
    t70 = (t69 & 1U);
    if (t70 != 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t65) != 0)
        goto LAB26;

LAB27:    t72 = (t64 + 4);
    t73 = *((unsigned int *)t64);
    t74 = *((unsigned int *)t72);
    t75 = (t73 || t74);
    if (t75 > 0)
        goto LAB28;

LAB29:    memcpy(t95, t64, 8);

LAB30:    t127 = (t95 + 4);
    t128 = *((unsigned int *)t127);
    t129 = (~(t128));
    t130 = *((unsigned int *)t95);
    t131 = (t130 & t129);
    t132 = (t131 != 0);
    if (t132 > 0)
        goto LAB42;

LAB43:
LAB44:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB10:    *((unsigned int *)t12) = 1;
    goto LAB13;

LAB12:    t18 = (t12 + 4);
    *((unsigned int *)t12) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB13;

LAB14:    t23 = (t0 + 3696U);
    t24 = *((char **)t23);
    memset(t25, 0, 8);
    t23 = (t24 + 4);
    t26 = *((unsigned int *)t23);
    t27 = (~(t26));
    t28 = *((unsigned int *)t24);
    t29 = (t28 & t27);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t23) != 0)
        goto LAB19;

LAB20:    t33 = *((unsigned int *)t12);
    t34 = *((unsigned int *)t25);
    t35 = (t33 & t34);
    *((unsigned int *)t32) = t35;
    t36 = (t12 + 4);
    t37 = (t25 + 4);
    t38 = (t32 + 4);
    t39 = *((unsigned int *)t36);
    t40 = *((unsigned int *)t37);
    t41 = (t39 | t40);
    *((unsigned int *)t38) = t41;
    t42 = *((unsigned int *)t38);
    t43 = (t42 != 0);
    if (t43 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB16;

LAB17:    *((unsigned int *)t25) = 1;
    goto LAB20;

LAB19:    t31 = (t25 + 4);
    *((unsigned int *)t25) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB20;

LAB21:    t44 = *((unsigned int *)t32);
    t45 = *((unsigned int *)t38);
    *((unsigned int *)t32) = (t44 | t45);
    t46 = (t12 + 4);
    t47 = (t25 + 4);
    t48 = *((unsigned int *)t12);
    t49 = (~(t48));
    t50 = *((unsigned int *)t46);
    t51 = (~(t50));
    t52 = *((unsigned int *)t25);
    t53 = (~(t52));
    t54 = *((unsigned int *)t47);
    t55 = (~(t54));
    t56 = (t49 & t51);
    t57 = (t53 & t55);
    t58 = (~(t56));
    t59 = (~(t57));
    t60 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t60 & t58);
    t61 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t61 & t59);
    t62 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t62 & t58);
    t63 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t63 & t59);
    goto LAB23;

LAB24:    *((unsigned int *)t64) = 1;
    goto LAB27;

LAB26:    t71 = (t64 + 4);
    *((unsigned int *)t64) = 1;
    *((unsigned int *)t71) = 1;
    goto LAB27;

LAB28:    t77 = (t0 + 6496);
    t78 = (t77 + 56U);
    t79 = *((char **)t78);
    memset(t76, 0, 8);
    t80 = (t79 + 4);
    t81 = *((unsigned int *)t80);
    t82 = (~(t81));
    t83 = *((unsigned int *)t79);
    t84 = (t83 & t82);
    t85 = (t84 & 1U);
    if (t85 != 0)
        goto LAB34;

LAB32:    if (*((unsigned int *)t80) == 0)
        goto LAB31;

LAB33:    t86 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t86) = 1;

LAB34:    memset(t87, 0, 8);
    t88 = (t76 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t76);
    t92 = (t91 & t90);
    t93 = (t92 & 1U);
    if (t93 != 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t88) != 0)
        goto LAB37;

LAB38:    t96 = *((unsigned int *)t64);
    t97 = *((unsigned int *)t87);
    t98 = (t96 & t97);
    *((unsigned int *)t95) = t98;
    t99 = (t64 + 4);
    t100 = (t87 + 4);
    t101 = (t95 + 4);
    t102 = *((unsigned int *)t99);
    t103 = *((unsigned int *)t100);
    t104 = (t102 | t103);
    *((unsigned int *)t101) = t104;
    t105 = *((unsigned int *)t101);
    t106 = (t105 != 0);
    if (t106 == 1)
        goto LAB39;

LAB40:
LAB41:    goto LAB30;

LAB31:    *((unsigned int *)t76) = 1;
    goto LAB34;

LAB35:    *((unsigned int *)t87) = 1;
    goto LAB38;

LAB37:    t94 = (t87 + 4);
    *((unsigned int *)t87) = 1;
    *((unsigned int *)t94) = 1;
    goto LAB38;

LAB39:    t107 = *((unsigned int *)t95);
    t108 = *((unsigned int *)t101);
    *((unsigned int *)t95) = (t107 | t108);
    t109 = (t64 + 4);
    t110 = (t87 + 4);
    t111 = *((unsigned int *)t64);
    t112 = (~(t111));
    t113 = *((unsigned int *)t109);
    t114 = (~(t113));
    t115 = *((unsigned int *)t87);
    t116 = (~(t115));
    t117 = *((unsigned int *)t110);
    t118 = (~(t117));
    t119 = (t112 & t114);
    t120 = (t116 & t118);
    t121 = (~(t119));
    t122 = (~(t120));
    t123 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t123 & t121);
    t124 = *((unsigned int *)t101);
    *((unsigned int *)t101) = (t124 & t122);
    t125 = *((unsigned int *)t95);
    *((unsigned int *)t95) = (t125 & t121);
    t126 = *((unsigned int *)t95);
    *((unsigned int *)t95) = (t126 & t122);
    goto LAB41;

LAB42:    xsi_set_current_line(118, ng0);

LAB45:    xsi_set_current_line(119, ng0);
    t133 = ((char*)((ng6)));
    t134 = (t0 + 6496);
    xsi_vlogvar_wait_assign_value(t134, t133, 0, 0, 1, 0LL);
    goto LAB44;

}


extern void work_m_00000000003478032079_2807401880_init()
{
	static char *pe[] = {(void *)Initial_26_0,(void *)Cont_64_1,(void *)Always_66_2,(void *)Always_113_3};
	xsi_register_didat("work_m_00000000003478032079_2807401880", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000003478032079_2807401880.didat");
	xsi_register_executes(pe);
}
