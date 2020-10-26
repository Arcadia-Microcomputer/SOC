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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/Flash/FlashBusInterface.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {23, 0};
static int ng4[] = {3, 0};
static int ng5[] = {7, 0};
static int ng6[] = {2, 0};
static int ng7[] = {15, 0};
static int ng8[] = {8, 0};
static int ng9[] = {16, 0};
static int ng10[] = {31, 0};
static int ng11[] = {24, 0};
static int ng12[] = {4, 0};
static unsigned int ng13[] = {0U, 0U};



static void Initial_28_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(28, ng0);

LAB2:    xsi_set_current_line(29, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 32, 0LL);
    xsi_set_current_line(30, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Always_87_1(char *t0)
{
    char t18[8];
    char t33[8];
    char t34[8];
    char t43[8];
    char t59[8];
    char t64[8];
    char t79[8];
    char t87[8];
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
    int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    int t35;
    int t36;
    char *t37;
    int t38;
    int t39;
    int t40;
    int t41;
    int t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
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
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t91;
    char *t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    char *t101;
    char *t102;
    unsigned int t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    char *t123;
    char *t124;

LAB0:    t1 = (t0 + 11008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 12072);
    *((int *)t2) = 1;
    t3 = (t0 + 11040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);

LAB5:    xsi_set_current_line(88, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7920);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8080);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 8720);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(93, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 24, 0LL);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 9040);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 3520U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB58;

LAB59:
LAB60:
LAB8:    xsi_set_current_line(139, ng0);
    t2 = (t0 + 3840U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB66;

LAB67:
LAB68:    xsi_set_current_line(204, ng0);
    t2 = (t0 + 9840);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t12);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB183;

LAB184:
LAB185:    goto LAB2;

LAB6:    xsi_set_current_line(95, ng0);

LAB9:    xsi_set_current_line(96, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 8880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = (t0 + 2512);
    t11 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t4, 1, t11, 32);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 2648);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t4, 1, t3, 32);
    if (t13 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB8;

LAB11:    xsi_set_current_line(99, ng0);

LAB16:    xsi_set_current_line(100, ng0);
    t5 = (t0 + 5600U);
    t12 = *((char **)t5);
    t5 = (t12 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t12);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB17;

LAB18:
LAB19:    goto LAB15;

LAB13:    xsi_set_current_line(105, ng0);

LAB21:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 9200);
    t5 = (t2 + 56U);
    t11 = *((char **)t5);
    t12 = ((char*)((ng2)));
    memset(t18, 0, 8);
    t14 = (t11 + 4);
    t15 = (t12 + 4);
    t6 = *((unsigned int *)t11);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t14);
    t10 = *((unsigned int *)t15);
    t20 = (t9 ^ t10);
    t21 = (t8 | t20);
    t22 = *((unsigned int *)t14);
    t23 = *((unsigned int *)t15);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB25;

LAB22:    if (t24 != 0)
        goto LAB24;

LAB23:    *((unsigned int *)t18) = 1;

LAB25:    t17 = (t18 + 4);
    t27 = *((unsigned int *)t17);
    t28 = (~(t27));
    t29 = *((unsigned int *)t18);
    t30 = (t29 & t28);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB26;

LAB27:
LAB28:    xsi_set_current_line(110, ng0);
    t2 = (t0 + 9200);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng1)));
    memset(t18, 0, 8);
    t12 = (t5 + 4);
    t14 = (t11 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t12);
    t10 = *((unsigned int *)t14);
    t20 = (t9 ^ t10);
    t21 = (t8 | t20);
    t22 = *((unsigned int *)t12);
    t23 = *((unsigned int *)t14);
    t24 = (t22 | t23);
    t25 = (~(t24));
    t26 = (t21 & t25);
    if (t26 != 0)
        goto LAB33;

LAB30:    if (t24 != 0)
        goto LAB32;

LAB31:    *((unsigned int *)t18) = 1;

LAB33:    t16 = (t18 + 4);
    t27 = *((unsigned int *)t16);
    t28 = (~(t27));
    t29 = *((unsigned int *)t18);
    t30 = (t29 & t28);
    t31 = (t30 != 0);
    if (t31 > 0)
        goto LAB34;

LAB35:
LAB36:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 9200);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t11 = (t18 + 4);
    t12 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    *((unsigned int *)t18) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 0);
    *((unsigned int *)t11) = t9;
    t10 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t10 & 3U);
    t20 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t20 & 3U);

LAB40:    t14 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t18, 32, t14, 32);
    if (t13 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t18, 32, t2, 32);
    if (t13 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t18, 32, t2, 32);
    if (t13 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t18, 32, t2, 32);
    if (t13 == 1)
        goto LAB47;

LAB48:
LAB49:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 2512);
    t3 = *((char **)t2);
    t2 = (t0 + 8880);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB15;

LAB17:    xsi_set_current_line(100, ng0);

LAB20:    xsi_set_current_line(101, ng0);
    t14 = (t0 + 9200);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng2)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_minus(t18, 32, t16, 4, t17, 32);
    t19 = (t0 + 9200);
    xsi_vlogvar_wait_assign_value(t19, t18, 0, 0, 4, 0LL);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2648);
    t3 = *((char **)t2);
    t2 = (t0 + 8880);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 1, 0LL);
    goto LAB19;

LAB24:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB25;

LAB26:    xsi_set_current_line(106, ng0);

LAB29:    xsi_set_current_line(107, ng0);
    t19 = ((char*)((ng1)));
    t32 = (t0 + 7600);
    xsi_vlogvar_wait_assign_value(t32, t19, 0, 0, 1, 0LL);
    goto LAB28;

LAB32:    t15 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB33;

LAB34:    xsi_set_current_line(110, ng0);

LAB37:    xsi_set_current_line(111, ng0);
    t17 = ((char*)((ng1)));
    t19 = (t0 + 9040);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 1, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 9360);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 7120);
    t12 = (t0 + 7120);
    t14 = (t12 + 72U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng3)));
    t17 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t18, t33, t34, ((int*)(t15)), 2, t16, 32, 1, t17, 32, 1);
    t19 = (t18 + 4);
    t6 = *((unsigned int *)t19);
    t13 = (!(t6));
    t32 = (t33 + 4);
    t7 = *((unsigned int *)t32);
    t35 = (!(t7));
    t36 = (t13 && t35);
    t37 = (t34 + 4);
    t8 = *((unsigned int *)t37);
    t38 = (!(t8));
    t39 = (t36 && t38);
    if (t39 == 1)
        goto LAB38;

LAB39:    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB36;

LAB38:    t9 = *((unsigned int *)t34);
    t40 = (t9 + 0);
    t10 = *((unsigned int *)t18);
    t20 = *((unsigned int *)t33);
    t41 = (t10 - t20);
    t42 = (t41 + 1);
    xsi_vlogvar_wait_assign_value(t11, t5, t40, *((unsigned int *)t33), t42, 0LL);
    goto LAB39;

LAB41:    xsi_set_current_line(117, ng0);
    t15 = (t0 + 5280U);
    t16 = *((char **)t15);
    t15 = (t0 + 9360);
    t17 = (t0 + 9360);
    t19 = (t17 + 72U);
    t32 = *((char **)t19);
    t37 = ((char*)((ng5)));
    t44 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t33, t34, t43, ((int*)(t32)), 2, t37, 32, 1, t44, 32, 1);
    t45 = (t33 + 4);
    t21 = *((unsigned int *)t45);
    t35 = (!(t21));
    t46 = (t34 + 4);
    t22 = *((unsigned int *)t46);
    t36 = (!(t22));
    t38 = (t35 && t36);
    t47 = (t43 + 4);
    t23 = *((unsigned int *)t47);
    t39 = (!(t23));
    t40 = (t38 && t39);
    if (t40 == 1)
        goto LAB50;

LAB51:    goto LAB49;

LAB43:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 5280U);
    t5 = *((char **)t3);
    t3 = (t0 + 9360);
    t11 = (t0 + 9360);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t15 = ((char*)((ng7)));
    t16 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t33, t34, t43, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t33 + 4);
    t6 = *((unsigned int *)t17);
    t35 = (!(t6));
    t19 = (t34 + 4);
    t7 = *((unsigned int *)t19);
    t36 = (!(t7));
    t38 = (t35 && t36);
    t32 = (t43 + 4);
    t8 = *((unsigned int *)t32);
    t39 = (!(t8));
    t40 = (t38 && t39);
    if (t40 == 1)
        goto LAB52;

LAB53:    goto LAB49;

LAB45:    xsi_set_current_line(119, ng0);
    t3 = (t0 + 5280U);
    t5 = *((char **)t3);
    t3 = (t0 + 9360);
    t11 = (t0 + 9360);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t15 = ((char*)((ng3)));
    t16 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t33, t34, t43, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t33 + 4);
    t6 = *((unsigned int *)t17);
    t35 = (!(t6));
    t19 = (t34 + 4);
    t7 = *((unsigned int *)t19);
    t36 = (!(t7));
    t38 = (t35 && t36);
    t32 = (t43 + 4);
    t8 = *((unsigned int *)t32);
    t39 = (!(t8));
    t40 = (t38 && t39);
    if (t40 == 1)
        goto LAB54;

LAB55:    goto LAB49;

LAB47:    xsi_set_current_line(120, ng0);
    t3 = (t0 + 5280U);
    t5 = *((char **)t3);
    t3 = (t0 + 7120);
    t11 = (t0 + 7120);
    t12 = (t11 + 72U);
    t14 = *((char **)t12);
    t15 = ((char*)((ng10)));
    t16 = ((char*)((ng11)));
    xsi_vlog_convert_partindices(t33, t34, t43, ((int*)(t14)), 2, t15, 32, 1, t16, 32, 1);
    t17 = (t33 + 4);
    t6 = *((unsigned int *)t17);
    t35 = (!(t6));
    t19 = (t34 + 4);
    t7 = *((unsigned int *)t19);
    t36 = (!(t7));
    t38 = (t35 && t36);
    t32 = (t43 + 4);
    t8 = *((unsigned int *)t32);
    t39 = (!(t8));
    t40 = (t38 && t39);
    if (t40 == 1)
        goto LAB56;

LAB57:    goto LAB49;

LAB50:    t24 = *((unsigned int *)t43);
    t41 = (t24 + 0);
    t25 = *((unsigned int *)t33);
    t26 = *((unsigned int *)t34);
    t42 = (t25 - t26);
    t48 = (t42 + 1);
    xsi_vlogvar_wait_assign_value(t15, t16, t41, *((unsigned int *)t34), t48, 0LL);
    goto LAB51;

LAB52:    t9 = *((unsigned int *)t43);
    t41 = (t9 + 0);
    t10 = *((unsigned int *)t33);
    t20 = *((unsigned int *)t34);
    t42 = (t10 - t20);
    t48 = (t42 + 1);
    xsi_vlogvar_wait_assign_value(t3, t5, t41, *((unsigned int *)t34), t48, 0LL);
    goto LAB53;

LAB54:    t9 = *((unsigned int *)t43);
    t41 = (t9 + 0);
    t10 = *((unsigned int *)t33);
    t20 = *((unsigned int *)t34);
    t42 = (t10 - t20);
    t48 = (t42 + 1);
    xsi_vlogvar_wait_assign_value(t3, t5, t41, *((unsigned int *)t34), t48, 0LL);
    goto LAB55;

LAB56:    t9 = *((unsigned int *)t43);
    t41 = (t9 + 0);
    t10 = *((unsigned int *)t33);
    t20 = *((unsigned int *)t34);
    t42 = (t10 - t20);
    t48 = (t42 + 1);
    xsi_vlogvar_wait_assign_value(t3, t5, t41, *((unsigned int *)t34), t48, 0LL);
    goto LAB57;

LAB58:    xsi_set_current_line(126, ng0);

LAB61:    xsi_set_current_line(128, ng0);
    t5 = (t0 + 4320U);
    t11 = *((char **)t5);
    t5 = (t11 + 4);
    t20 = *((unsigned int *)t5);
    t21 = (~(t20));
    t22 = *((unsigned int *)t11);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB62;

LAB63:
LAB64:    goto LAB60;

LAB62:    xsi_set_current_line(128, ng0);

LAB65:    xsi_set_current_line(129, ng0);
    t12 = ((char*)((ng2)));
    t14 = (t0 + 9040);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, 0, 1, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 9200);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 9360);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 24, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 3680U);
    t5 = *((char **)t3);
    memset(t34, 0, 8);
    t3 = (t34 + 4);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    *((unsigned int *)t34) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t3) = t9;
    t10 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t10 & 4194303U);
    t20 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t20 & 4194303U);
    xsi_vlogtype_concat(t33, 24, 24, 2U, t34, 22, t2, 2);
    t12 = (t0 + 9520);
    xsi_vlogvar_wait_assign_value(t12, t33, 0, 0, 24, 0LL);
    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 9680);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 24, 0LL);
    xsi_set_current_line(134, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7600);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(135, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 7280);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB64;

LAB66:    xsi_set_current_line(139, ng0);

LAB69:    xsi_set_current_line(141, ng0);
    t5 = (t0 + 4480U);
    t11 = *((char **)t5);
    t5 = (t11 + 4);
    t20 = *((unsigned int *)t5);
    t21 = (~(t20));
    t22 = *((unsigned int *)t11);
    t23 = (t22 & t21);
    t24 = (t23 != 0);
    if (t24 > 0)
        goto LAB70;

LAB71:
LAB72:    xsi_set_current_line(186, ng0);
    t2 = (t0 + 4320U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB165;

LAB166:
LAB167:    goto LAB68;

LAB70:    xsi_set_current_line(141, ng0);

LAB73:    xsi_set_current_line(142, ng0);
    t12 = (t0 + 4000U);
    t14 = *((char **)t12);

LAB74:    t12 = (t0 + 744);
    t15 = *((char **)t12);
    t13 = xsi_vlog_unsigned_case_compare(t14, 10, t15, 32);
    if (t13 == 1)
        goto LAB75;

LAB76:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t14, 10, t3, 32);
    if (t13 == 1)
        goto LAB77;

LAB78:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t14, 10, t3, 32);
    if (t13 == 1)
        goto LAB79;

LAB80:
LAB81:    goto LAB72;

LAB75:    xsi_set_current_line(143, ng0);

LAB82:    xsi_set_current_line(144, ng0);
    t12 = (t0 + 4160U);
    t16 = *((char **)t12);
    memset(t33, 0, 8);
    t12 = (t33 + 4);
    t17 = (t16 + 4);
    t25 = *((unsigned int *)t16);
    t26 = (t25 >> 0);
    t27 = (t26 & 1);
    *((unsigned int *)t33) = t27;
    t28 = *((unsigned int *)t17);
    t29 = (t28 >> 0);
    t30 = (t29 & 1);
    *((unsigned int *)t12) = t30;
    t19 = (t33 + 4);
    t31 = *((unsigned int *)t19);
    t49 = (~(t31));
    t50 = *((unsigned int *)t33);
    t51 = (t50 & t49);
    t52 = (t51 != 0);
    if (t52 > 0)
        goto LAB83;

LAB84:
LAB85:    xsi_set_current_line(147, ng0);
    t2 = (t0 + 4160U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 1);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t11 = (t33 + 4);
    t21 = *((unsigned int *)t11);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB87;

LAB88:
LAB89:    xsi_set_current_line(167, ng0);
    t2 = (t0 + 4160U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t11 = (t33 + 4);
    t21 = *((unsigned int *)t11);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB140;

LAB141:
LAB142:    goto LAB81;

LAB77:    xsi_set_current_line(171, ng0);

LAB144:    xsi_set_current_line(172, ng0);
    t2 = (t0 + 4160U);
    t5 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 0);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t12 = (t33 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB145;

LAB146:
LAB147:    xsi_set_current_line(173, ng0);
    t2 = (t0 + 4160U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 1);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 1);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t11 = (t33 + 4);
    t21 = *((unsigned int *)t11);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB150;

LAB151:
LAB152:    xsi_set_current_line(174, ng0);
    t2 = (t0 + 4160U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 2);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 2);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t11 = (t33 + 4);
    t21 = *((unsigned int *)t11);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB155;

LAB156:
LAB157:    goto LAB81;

LAB79:    xsi_set_current_line(176, ng0);

LAB160:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 4160U);
    t5 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t11 = (t5 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 0);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t12 = (t33 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB161;

LAB162:
LAB163:    goto LAB81;

LAB83:    xsi_set_current_line(144, ng0);

LAB86:    xsi_set_current_line(145, ng0);
    t32 = (t0 + 4640U);
    t37 = *((char **)t32);
    memset(t34, 0, 8);
    t32 = (t34 + 4);
    t44 = (t37 + 4);
    t53 = *((unsigned int *)t37);
    t54 = (t53 >> 0);
    *((unsigned int *)t34) = t54;
    t55 = *((unsigned int *)t44);
    t56 = (t55 >> 0);
    *((unsigned int *)t32) = t56;
    t57 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t57 & 15U);
    t58 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t58 & 15U);
    t45 = (t0 + 8400);
    xsi_vlogvar_wait_assign_value(t45, t34, 0, 0, 4, 0LL);
    goto LAB85;

LAB87:    xsi_set_current_line(147, ng0);

LAB90:    xsi_set_current_line(148, ng0);
    t12 = (t0 + 4640U);
    t15 = *((char **)t12);
    memset(t34, 0, 8);
    t12 = (t34 + 4);
    t16 = (t15 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (t26 >> 8);
    t28 = (t27 & 1);
    *((unsigned int *)t34) = t28;
    t29 = *((unsigned int *)t16);
    t30 = (t29 >> 8);
    t31 = (t30 & 1);
    *((unsigned int *)t12) = t31;
    t17 = (t0 + 8720);
    xsi_vlogvar_wait_assign_value(t17, t34, 0, 0, 1, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 8240);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = (t0 + 7440);
    xsi_vlogvar_wait_assign_value(t11, t5, 0, 0, 24, 0LL);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 4160U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    t11 = (t33 + 4);
    t21 = *((unsigned int *)t11);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB91;

LAB92:    xsi_set_current_line(158, ng0);

LAB117:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 4640U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 8);
    t8 = (t7 & 1);
    *((unsigned int *)t33) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 8);
    t20 = (t10 & 1);
    *((unsigned int *)t2) = t20;
    memset(t34, 0, 8);
    t11 = (t33 + 4);
    t21 = *((unsigned int *)t11);
    t22 = (~(t21));
    t23 = *((unsigned int *)t33);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB118;

LAB119:    if (*((unsigned int *)t11) != 0)
        goto LAB120;

LAB121:    t15 = (t34 + 4);
    t26 = *((unsigned int *)t34);
    t27 = *((unsigned int *)t15);
    t28 = (t26 || t27);
    if (t28 > 0)
        goto LAB122;

LAB123:    memcpy(t64, t34, 8);

LAB124:    t92 = (t64 + 4);
    t98 = *((unsigned int *)t92);
    t99 = (~(t98));
    t100 = *((unsigned int *)t64);
    t103 = (t100 & t99);
    t104 = (t103 != 0);
    if (t104 > 0)
        goto LAB136;

LAB137:
LAB138:
LAB93:    goto LAB89;

LAB91:    xsi_set_current_line(152, ng0);

LAB94:    xsi_set_current_line(154, ng0);
    t12 = (t0 + 4640U);
    t15 = *((char **)t12);
    memset(t34, 0, 8);
    t12 = (t34 + 4);
    t16 = (t15 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (t26 >> 8);
    t28 = (t27 & 1);
    *((unsigned int *)t34) = t28;
    t29 = *((unsigned int *)t16);
    t30 = (t29 >> 8);
    t31 = (t30 & 1);
    *((unsigned int *)t12) = t31;
    memset(t43, 0, 8);
    t17 = (t34 + 4);
    t49 = *((unsigned int *)t17);
    t50 = (~(t49));
    t51 = *((unsigned int *)t34);
    t52 = (t51 & t50);
    t53 = (t52 & 1U);
    if (t53 != 0)
        goto LAB95;

LAB96:    if (*((unsigned int *)t17) != 0)
        goto LAB97;

LAB98:    t32 = (t43 + 4);
    t54 = *((unsigned int *)t43);
    t55 = *((unsigned int *)t32);
    t56 = (t54 || t55);
    if (t56 > 0)
        goto LAB99;

LAB100:    memcpy(t87, t43, 8);

LAB101:    t117 = (t87 + 4);
    t118 = *((unsigned int *)t117);
    t119 = (~(t118));
    t120 = *((unsigned int *)t87);
    t121 = (t120 & t119);
    t122 = (t121 != 0);
    if (t122 > 0)
        goto LAB113;

LAB114:
LAB115:    goto LAB93;

LAB95:    *((unsigned int *)t43) = 1;
    goto LAB98;

LAB97:    t19 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB98;

LAB99:    t37 = (t0 + 4640U);
    t44 = *((char **)t37);
    memset(t59, 0, 8);
    t37 = (t59 + 4);
    t45 = (t44 + 4);
    t57 = *((unsigned int *)t44);
    t58 = (t57 >> 0);
    *((unsigned int *)t59) = t58;
    t60 = *((unsigned int *)t45);
    t61 = (t60 >> 0);
    *((unsigned int *)t37) = t61;
    t62 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t62 & 15U);
    t63 = *((unsigned int *)t37);
    *((unsigned int *)t37) = (t63 & 15U);
    t46 = (t0 + 1832);
    t47 = *((char **)t46);
    memset(t64, 0, 8);
    t46 = (t59 + 4);
    t65 = (t47 + 4);
    t66 = *((unsigned int *)t59);
    t67 = *((unsigned int *)t47);
    t68 = (t66 ^ t67);
    t69 = *((unsigned int *)t46);
    t70 = *((unsigned int *)t65);
    t71 = (t69 ^ t70);
    t72 = (t68 | t71);
    t73 = *((unsigned int *)t46);
    t74 = *((unsigned int *)t65);
    t75 = (t73 | t74);
    t76 = (~(t75));
    t77 = (t72 & t76);
    if (t77 != 0)
        goto LAB105;

LAB102:    if (t75 != 0)
        goto LAB104;

LAB103:    *((unsigned int *)t64) = 1;

LAB105:    memset(t79, 0, 8);
    t80 = (t64 + 4);
    t81 = *((unsigned int *)t80);
    t82 = (~(t81));
    t83 = *((unsigned int *)t64);
    t84 = (t83 & t82);
    t85 = (t84 & 1U);
    if (t85 != 0)
        goto LAB106;

LAB107:    if (*((unsigned int *)t80) != 0)
        goto LAB108;

LAB109:    t88 = *((unsigned int *)t43);
    t89 = *((unsigned int *)t79);
    t90 = (t88 & t89);
    *((unsigned int *)t87) = t90;
    t91 = (t43 + 4);
    t92 = (t79 + 4);
    t93 = (t87 + 4);
    t94 = *((unsigned int *)t91);
    t95 = *((unsigned int *)t92);
    t96 = (t94 | t95);
    *((unsigned int *)t93) = t96;
    t97 = *((unsigned int *)t93);
    t98 = (t97 != 0);
    if (t98 == 1)
        goto LAB110;

LAB111:
LAB112:    goto LAB101;

LAB104:    t78 = (t64 + 4);
    *((unsigned int *)t64) = 1;
    *((unsigned int *)t78) = 1;
    goto LAB105;

LAB106:    *((unsigned int *)t79) = 1;
    goto LAB109;

LAB108:    t86 = (t79 + 4);
    *((unsigned int *)t79) = 1;
    *((unsigned int *)t86) = 1;
    goto LAB109;

LAB110:    t99 = *((unsigned int *)t87);
    t100 = *((unsigned int *)t93);
    *((unsigned int *)t87) = (t99 | t100);
    t101 = (t43 + 4);
    t102 = (t79 + 4);
    t103 = *((unsigned int *)t43);
    t104 = (~(t103));
    t105 = *((unsigned int *)t101);
    t106 = (~(t105));
    t107 = *((unsigned int *)t79);
    t108 = (~(t107));
    t109 = *((unsigned int *)t102);
    t110 = (~(t109));
    t13 = (t104 & t106);
    t35 = (t108 & t110);
    t111 = (~(t13));
    t112 = (~(t35));
    t113 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t113 & t111);
    t114 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t114 & t112);
    t115 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t115 & t111);
    t116 = *((unsigned int *)t87);
    *((unsigned int *)t87) = (t116 & t112);
    goto LAB112;

LAB113:    xsi_set_current_line(154, ng0);

LAB116:    xsi_set_current_line(155, ng0);
    t123 = ((char*)((ng2)));
    t124 = (t0 + 9840);
    xsi_vlogvar_wait_assign_value(t124, t123, 0, 0, 1, 0LL);
    xsi_set_current_line(156, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8080);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB115;

LAB118:    *((unsigned int *)t34) = 1;
    goto LAB121;

LAB120:    t12 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB121;

LAB122:    t16 = (t0 + 8400);
    t17 = (t16 + 56U);
    t19 = *((char **)t17);
    t32 = (t0 + 1832);
    t37 = *((char **)t32);
    memset(t43, 0, 8);
    t32 = (t19 + 4);
    t44 = (t37 + 4);
    t29 = *((unsigned int *)t19);
    t30 = *((unsigned int *)t37);
    t31 = (t29 ^ t30);
    t49 = *((unsigned int *)t32);
    t50 = *((unsigned int *)t44);
    t51 = (t49 ^ t50);
    t52 = (t31 | t51);
    t53 = *((unsigned int *)t32);
    t54 = *((unsigned int *)t44);
    t55 = (t53 | t54);
    t56 = (~(t55));
    t57 = (t52 & t56);
    if (t57 != 0)
        goto LAB128;

LAB125:    if (t55 != 0)
        goto LAB127;

LAB126:    *((unsigned int *)t43) = 1;

LAB128:    memset(t59, 0, 8);
    t46 = (t43 + 4);
    t58 = *((unsigned int *)t46);
    t60 = (~(t58));
    t61 = *((unsigned int *)t43);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB129;

LAB130:    if (*((unsigned int *)t46) != 0)
        goto LAB131;

LAB132:    t66 = *((unsigned int *)t34);
    t67 = *((unsigned int *)t59);
    t68 = (t66 & t67);
    *((unsigned int *)t64) = t68;
    t65 = (t34 + 4);
    t78 = (t59 + 4);
    t80 = (t64 + 4);
    t69 = *((unsigned int *)t65);
    t70 = *((unsigned int *)t78);
    t71 = (t69 | t70);
    *((unsigned int *)t80) = t71;
    t72 = *((unsigned int *)t80);
    t73 = (t72 != 0);
    if (t73 == 1)
        goto LAB133;

LAB134:
LAB135:    goto LAB124;

LAB127:    t45 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB128;

LAB129:    *((unsigned int *)t59) = 1;
    goto LAB132;

LAB131:    t47 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB132;

LAB133:    t74 = *((unsigned int *)t64);
    t75 = *((unsigned int *)t80);
    *((unsigned int *)t64) = (t74 | t75);
    t86 = (t34 + 4);
    t91 = (t59 + 4);
    t76 = *((unsigned int *)t34);
    t77 = (~(t76));
    t81 = *((unsigned int *)t86);
    t82 = (~(t81));
    t83 = *((unsigned int *)t59);
    t84 = (~(t83));
    t85 = *((unsigned int *)t91);
    t88 = (~(t85));
    t13 = (t77 & t82);
    t35 = (t84 & t88);
    t89 = (~(t13));
    t90 = (~(t35));
    t94 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t94 & t89);
    t95 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t95 & t90);
    t96 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t96 & t89);
    t97 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t97 & t90);
    goto LAB135;

LAB136:    xsi_set_current_line(160, ng0);

LAB139:    xsi_set_current_line(161, ng0);
    t93 = ((char*)((ng2)));
    t101 = (t0 + 9840);
    xsi_vlogvar_wait_assign_value(t101, t93, 0, 0, 1, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8080);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB138;

LAB140:    xsi_set_current_line(167, ng0);

LAB143:    xsi_set_current_line(168, ng0);
    t12 = (t0 + 4640U);
    t15 = *((char **)t12);
    memset(t34, 0, 8);
    t12 = (t34 + 4);
    t16 = (t15 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (t26 >> 16);
    *((unsigned int *)t34) = t27;
    t28 = *((unsigned int *)t16);
    t29 = (t28 >> 16);
    *((unsigned int *)t12) = t29;
    t30 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t30 & 127U);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t31 & 127U);
    t17 = (t0 + 8560);
    xsi_vlogvar_wait_assign_value(t17, t34, 0, 0, 7, 0LL);
    goto LAB142;

LAB145:    xsi_set_current_line(172, ng0);
    t15 = (t0 + 4640U);
    t16 = *((char **)t15);
    memset(t34, 0, 8);
    t15 = (t34 + 4);
    t17 = (t16 + 4);
    t26 = *((unsigned int *)t16);
    t27 = (t26 >> 0);
    *((unsigned int *)t34) = t27;
    t28 = *((unsigned int *)t17);
    t29 = (t28 >> 0);
    *((unsigned int *)t15) = t29;
    t30 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t30 & 255U);
    t31 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t31 & 255U);
    t19 = (t0 + 8240);
    t32 = (t0 + 8240);
    t37 = (t32 + 72U);
    t44 = *((char **)t37);
    t45 = ((char*)((ng5)));
    t46 = ((char*)((ng1)));
    xsi_vlog_convert_partindices(t43, t59, t64, ((int*)(t44)), 2, t45, 32, 1, t46, 32, 1);
    t47 = (t43 + 4);
    t49 = *((unsigned int *)t47);
    t35 = (!(t49));
    t65 = (t59 + 4);
    t50 = *((unsigned int *)t65);
    t36 = (!(t50));
    t38 = (t35 && t36);
    t78 = (t64 + 4);
    t51 = *((unsigned int *)t78);
    t39 = (!(t51));
    t40 = (t38 && t39);
    if (t40 == 1)
        goto LAB148;

LAB149:    goto LAB147;

LAB148:    t52 = *((unsigned int *)t64);
    t41 = (t52 + 0);
    t53 = *((unsigned int *)t43);
    t54 = *((unsigned int *)t59);
    t42 = (t53 - t54);
    t48 = (t42 + 1);
    xsi_vlogvar_wait_assign_value(t19, t34, t41, *((unsigned int *)t59), t48, 0LL);
    goto LAB149;

LAB150:    xsi_set_current_line(173, ng0);
    t12 = (t0 + 4640U);
    t15 = *((char **)t12);
    memset(t34, 0, 8);
    t12 = (t34 + 4);
    t16 = (t15 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (t26 >> 8);
    *((unsigned int *)t34) = t27;
    t28 = *((unsigned int *)t16);
    t29 = (t28 >> 8);
    *((unsigned int *)t12) = t29;
    t30 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t30 & 255U);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t31 & 255U);
    t17 = (t0 + 8240);
    t19 = (t0 + 8240);
    t32 = (t19 + 72U);
    t37 = *((char **)t32);
    t44 = ((char*)((ng7)));
    t45 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t43, t59, t64, ((int*)(t37)), 2, t44, 32, 1, t45, 32, 1);
    t46 = (t43 + 4);
    t49 = *((unsigned int *)t46);
    t13 = (!(t49));
    t47 = (t59 + 4);
    t50 = *((unsigned int *)t47);
    t35 = (!(t50));
    t36 = (t13 && t35);
    t65 = (t64 + 4);
    t51 = *((unsigned int *)t65);
    t38 = (!(t51));
    t39 = (t36 && t38);
    if (t39 == 1)
        goto LAB153;

LAB154:    goto LAB152;

LAB153:    t52 = *((unsigned int *)t64);
    t40 = (t52 + 0);
    t53 = *((unsigned int *)t43);
    t54 = *((unsigned int *)t59);
    t41 = (t53 - t54);
    t42 = (t41 + 1);
    xsi_vlogvar_wait_assign_value(t17, t34, t40, *((unsigned int *)t59), t42, 0LL);
    goto LAB154;

LAB155:    xsi_set_current_line(174, ng0);
    t12 = (t0 + 4640U);
    t15 = *((char **)t12);
    memset(t34, 0, 8);
    t12 = (t34 + 4);
    t16 = (t15 + 4);
    t26 = *((unsigned int *)t15);
    t27 = (t26 >> 16);
    *((unsigned int *)t34) = t27;
    t28 = *((unsigned int *)t16);
    t29 = (t28 >> 16);
    *((unsigned int *)t12) = t29;
    t30 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t30 & 255U);
    t31 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t31 & 255U);
    t17 = (t0 + 8240);
    t19 = (t0 + 8240);
    t32 = (t19 + 72U);
    t37 = *((char **)t32);
    t44 = ((char*)((ng3)));
    t45 = ((char*)((ng9)));
    xsi_vlog_convert_partindices(t43, t59, t64, ((int*)(t37)), 2, t44, 32, 1, t45, 32, 1);
    t46 = (t43 + 4);
    t49 = *((unsigned int *)t46);
    t13 = (!(t49));
    t47 = (t59 + 4);
    t50 = *((unsigned int *)t47);
    t35 = (!(t50));
    t36 = (t13 && t35);
    t65 = (t64 + 4);
    t51 = *((unsigned int *)t65);
    t38 = (!(t51));
    t39 = (t36 && t38);
    if (t39 == 1)
        goto LAB158;

LAB159:    goto LAB157;

LAB158:    t52 = *((unsigned int *)t64);
    t40 = (t52 + 0);
    t53 = *((unsigned int *)t43);
    t54 = *((unsigned int *)t59);
    t41 = (t53 - t54);
    t42 = (t41 + 1);
    xsi_vlogvar_wait_assign_value(t17, t34, t40, *((unsigned int *)t59), t42, 0LL);
    goto LAB159;

LAB161:    xsi_set_current_line(177, ng0);

LAB164:    xsi_set_current_line(178, ng0);
    t15 = ((char*)((ng2)));
    t16 = (t0 + 7920);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 1, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 4640U);
    t3 = *((char **)t2);
    memset(t33, 0, 8);
    t2 = (t33 + 4);
    t5 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t33) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t33);
    *((unsigned int *)t33) = (t10 & 255U);
    t20 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t20 & 255U);
    t11 = (t0 + 7760);
    xsi_vlogvar_wait_assign_value(t11, t33, 0, 0, 8, 0LL);
    goto LAB163;

LAB165:    xsi_set_current_line(186, ng0);

LAB168:    xsi_set_current_line(187, ng0);
    t5 = (t0 + 4000U);
    t11 = *((char **)t5);

LAB169:    t5 = (t0 + 744);
    t12 = *((char **)t5);
    t13 = xsi_vlog_unsigned_case_compare(t11, 10, t12, 32);
    if (t13 == 1)
        goto LAB170;

LAB171:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t11, 10, t3, 32);
    if (t13 == 1)
        goto LAB172;

LAB173:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t13 = xsi_vlog_unsigned_case_compare(t11, 10, t3, 32);
    if (t13 == 1)
        goto LAB174;

LAB175:
LAB177:
LAB176:    xsi_set_current_line(197, ng0);

LAB182:    xsi_set_current_line(198, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);

LAB178:    goto LAB167;

LAB170:    xsi_set_current_line(188, ng0);

LAB179:    xsi_set_current_line(189, ng0);
    t5 = (t0 + 8400);
    t15 = (t5 + 56U);
    t16 = *((char **)t15);
    t17 = ((char*)((ng13)));
    t19 = (t0 + 8720);
    t32 = (t19 + 56U);
    t37 = *((char **)t32);
    t44 = (t0 + 5760U);
    t45 = *((char **)t44);
    t44 = (t0 + 6080U);
    t46 = *((char **)t44);
    t44 = (t0 + 6240U);
    t47 = *((char **)t44);
    t44 = ((char*)((ng13)));
    t65 = (t0 + 8560);
    t78 = (t65 + 56U);
    t80 = *((char **)t78);
    t86 = ((char*)((ng13)));
    xsi_vlogtype_concat(t33, 32, 32, 9U, t86, 9, t80, 7, t44, 4, t47, 1, t46, 1, t45, 1, t37, 1, t17, 4, t16, 4);
    t91 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t91, t33, 0, 0, 32, 0LL);
    goto LAB178;

LAB172:    xsi_set_current_line(191, ng0);

LAB180:    xsi_set_current_line(192, ng0);
    t2 = (t0 + 8240);
    t5 = (t2 + 56U);
    t12 = *((char **)t5);
    t15 = ((char*)((ng13)));
    xsi_vlogtype_concat(t33, 32, 32, 2U, t15, 8, t12, 24);
    t16 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t16, t33, 0, 0, 32, 0LL);
    goto LAB178;

LAB174:    xsi_set_current_line(194, ng0);

LAB181:    xsi_set_current_line(195, ng0);
    t2 = (t0 + 5280U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng13)));
    xsi_vlogtype_concat(t33, 32, 32, 2U, t2, 24, t5, 8);
    t12 = (t0 + 7120);
    xsi_vlogvar_wait_assign_value(t12, t33, 0, 0, 32, 0LL);
    goto LAB178;

LAB183:    xsi_set_current_line(204, ng0);

LAB186:    xsi_set_current_line(205, ng0);
    t15 = ((char*)((ng2)));
    t16 = (t0 + 7600);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 1, 0LL);
    xsi_set_current_line(209, ng0);
    t2 = (t0 + 5440U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB187;

LAB188:
LAB189:    goto LAB185;

LAB187:    xsi_set_current_line(209, ng0);

LAB190:    xsi_set_current_line(210, ng0);
    t5 = (t0 + 8560);
    t12 = (t5 + 56U);
    t15 = *((char **)t12);
    t16 = ((char*)((ng2)));
    memset(t33, 0, 8);
    t17 = (t15 + 4);
    t19 = (t16 + 4);
    t20 = *((unsigned int *)t15);
    t21 = *((unsigned int *)t16);
    t22 = (t20 ^ t21);
    t23 = *((unsigned int *)t17);
    t24 = *((unsigned int *)t19);
    t25 = (t23 ^ t24);
    t26 = (t22 | t25);
    t27 = *((unsigned int *)t17);
    t28 = *((unsigned int *)t19);
    t29 = (t27 | t28);
    t30 = (~(t29));
    t31 = (t26 & t30);
    if (t31 != 0)
        goto LAB194;

LAB191:    if (t29 != 0)
        goto LAB193;

LAB192:    *((unsigned int *)t33) = 1;

LAB194:    memset(t34, 0, 8);
    t37 = (t33 + 4);
    t49 = *((unsigned int *)t37);
    t50 = (~(t49));
    t51 = *((unsigned int *)t33);
    t52 = (t51 & t50);
    t53 = (t52 & 1U);
    if (t53 != 0)
        goto LAB195;

LAB196:    if (*((unsigned int *)t37) != 0)
        goto LAB197;

LAB198:    t45 = (t34 + 4);
    t54 = *((unsigned int *)t34);
    t55 = (!(t54));
    t56 = *((unsigned int *)t45);
    t57 = (t55 || t56);
    if (t57 > 0)
        goto LAB199;

LAB200:    memcpy(t59, t34, 8);

LAB201:    t93 = (t59 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (~(t94));
    t96 = *((unsigned int *)t59);
    t97 = (t96 & t95);
    t98 = (t97 != 0);
    if (t98 > 0)
        goto LAB209;

LAB210:    xsi_set_current_line(214, ng0);

LAB213:    xsi_set_current_line(215, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 8080);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 8560);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t12 = ((char*)((ng2)));
    memset(t33, 0, 8);
    xsi_vlog_unsigned_minus(t33, 32, t5, 7, t12, 32);
    t15 = (t0 + 8560);
    xsi_vlogvar_wait_assign_value(t15, t33, 0, 0, 7, 0LL);

LAB211:    goto LAB189;

LAB193:    t32 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB194;

LAB195:    *((unsigned int *)t34) = 1;
    goto LAB198;

LAB197:    t44 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t44) = 1;
    goto LAB198;

LAB199:    t46 = (t0 + 6240U);
    t47 = *((char **)t46);
    memset(t43, 0, 8);
    t46 = (t47 + 4);
    t58 = *((unsigned int *)t46);
    t60 = (~(t58));
    t61 = *((unsigned int *)t47);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB202;

LAB203:    if (*((unsigned int *)t46) != 0)
        goto LAB204;

LAB205:    t66 = *((unsigned int *)t34);
    t67 = *((unsigned int *)t43);
    t68 = (t66 | t67);
    *((unsigned int *)t59) = t68;
    t78 = (t34 + 4);
    t80 = (t43 + 4);
    t86 = (t59 + 4);
    t69 = *((unsigned int *)t78);
    t70 = *((unsigned int *)t80);
    t71 = (t69 | t70);
    *((unsigned int *)t86) = t71;
    t72 = *((unsigned int *)t86);
    t73 = (t72 != 0);
    if (t73 == 1)
        goto LAB206;

LAB207:
LAB208:    goto LAB201;

LAB202:    *((unsigned int *)t43) = 1;
    goto LAB205;

LAB204:    t65 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t65) = 1;
    goto LAB205;

LAB206:    t74 = *((unsigned int *)t59);
    t75 = *((unsigned int *)t86);
    *((unsigned int *)t59) = (t74 | t75);
    t91 = (t34 + 4);
    t92 = (t43 + 4);
    t76 = *((unsigned int *)t91);
    t77 = (~(t76));
    t81 = *((unsigned int *)t34);
    t13 = (t81 & t77);
    t82 = *((unsigned int *)t92);
    t83 = (~(t82));
    t84 = *((unsigned int *)t43);
    t35 = (t84 & t83);
    t85 = (~(t13));
    t88 = (~(t35));
    t89 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t89 & t85);
    t90 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t90 & t88);
    goto LAB208;

LAB209:    xsi_set_current_line(210, ng0);

LAB212:    xsi_set_current_line(212, ng0);
    t101 = ((char*)((ng1)));
    t102 = (t0 + 9840);
    xsi_vlogvar_wait_assign_value(t102, t101, 0, 0, 1, 0LL);
    xsi_set_current_line(213, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 7600);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB211;

}

static void implSig1_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t28[8];
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
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
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

LAB0:    t1 = (t0 + 11256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 9040);
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

LAB9:    t21 = *((unsigned int *)t4);
    t22 = (~(t21));
    t23 = *((unsigned int *)t14);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t28, 8);

LAB16:    t29 = (t0 + 12200);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    memset(t33, 0, 8);
    t34 = 16777215U;
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
    xsi_driver_vfirst_trans(t29, 0, 23);
    t42 = (t0 + 12088);
    *((int *)t42) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 9680);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    goto LAB9;

LAB10:    t25 = (t0 + 8720);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t28, t27, 8);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 24, t20, 24, t28, 24);
    goto LAB16;

LAB14:    memcpy(t3, t20, 8);
    goto LAB16;

}

static void implSig2_execute(char *t0)
{
    char t3[8];
    char t4[8];
    char t26[8];
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
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;

LAB0:    t1 = (t0 + 11504U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 9040);
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

LAB15:    memcpy(t3, t26, 8);

LAB16:    t27 = (t0 + 12264);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t3, 8);
    xsi_driver_vfirst_trans(t27, 0, 31);
    t32 = (t0 + 12104);
    *((int *)t32) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 1968);
    t19 = *((char **)t18);
    goto LAB9;

LAB10:    t18 = (t0 + 8400);
    t24 = (t18 + 56U);
    t25 = *((char **)t24);
    memcpy(t26, t25, 8);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t19, 32, t26, 32);
    goto LAB16;

LAB14:    memcpy(t3, t19, 8);
    goto LAB16;

}

static void implSig3_execute(char *t0)
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
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;

LAB0:    t1 = (t0 + 11752U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 9040);
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

LAB9:    t21 = *((unsigned int *)t4);
    t22 = (~(t21));
    t23 = *((unsigned int *)t14);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t27, 8);

LAB16:    t28 = (t0 + 12328);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memset(t32, 0, 8);
    t33 = 16777215U;
    t34 = t33;
    t35 = (t3 + 4);
    t36 = *((unsigned int *)t3);
    t33 = (t33 & t36);
    t37 = *((unsigned int *)t35);
    t34 = (t34 & t37);
    t38 = (t32 + 4);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t39 | t33);
    t40 = *((unsigned int *)t38);
    *((unsigned int *)t38) = (t40 | t34);
    xsi_driver_vfirst_trans(t28, 0, 23);
    t41 = (t0 + 12120);
    *((int *)t41) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 9520);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    goto LAB9;

LAB10:    t25 = (t0 + 7440);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 24, t20, 24, t27, 24);
    goto LAB16;

LAB14:    memcpy(t3, t20, 8);
    goto LAB16;

}


extern void work_m_00000000003776014087_1698931152_init()
{
	static char *pe[] = {(void *)Initial_28_0,(void *)Always_87_1,(void *)implSig1_execute,(void *)implSig2_execute,(void *)implSig3_execute};
	xsi_register_didat("work_m_00000000003776014087_1698931152", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000003776014087_1698931152.didat");
	xsi_register_executes(pe);
}
