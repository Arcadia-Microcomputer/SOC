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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/CPU/BranchUnit.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {4U, 0U};
static unsigned int ng4[] = {6U, 0U};
static unsigned int ng5[] = {5U, 0U};
static unsigned int ng6[] = {7U, 0U};



static void Initial_17_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(17, ng0);

LAB2:    xsi_set_current_line(18, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void NetDecl_28_1(char *t0)
{
    char t5[8];
    char t20[8];
    char t35[8];
    char t50[8];
    char t58[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
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
    unsigned int t48;
    char *t49;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    char *t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    int t82;
    int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t91;
    char *t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 2344U);
    t3 = *((char **)t2);
    t2 = (t0 + 2504U);
    t4 = *((char **)t2);
    memset(t5, 0, 8);
    t2 = (t3 + 4);
    t6 = (t4 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t4);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t2);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t2);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB5;

LAB4:    if (t16 != 0)
        goto LAB6;

LAB7:    memset(t20, 0, 8);
    t21 = (t5 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (~(t22));
    t24 = *((unsigned int *)t5);
    t25 = (t24 & t23);
    t26 = (t25 & 1U);
    if (t26 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t21) != 0)
        goto LAB10;

LAB11:    t28 = (t20 + 4);
    t29 = *((unsigned int *)t20);
    t30 = *((unsigned int *)t28);
    t31 = (t29 || t30);
    if (t31 > 0)
        goto LAB12;

LAB13:    memcpy(t58, t20, 8);

LAB14:    t90 = (t0 + 5376);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    t93 = (t92 + 56U);
    t94 = *((char **)t93);
    memset(t94, 0, 8);
    t95 = 1U;
    t96 = t95;
    t97 = (t58 + 4);
    t98 = *((unsigned int *)t58);
    t95 = (t95 & t98);
    t99 = *((unsigned int *)t97);
    t96 = (t96 & t99);
    t100 = (t94 + 4);
    t101 = *((unsigned int *)t94);
    *((unsigned int *)t94) = (t101 | t95);
    t102 = *((unsigned int *)t100);
    *((unsigned int *)t100) = (t102 | t96);
    xsi_driver_vfirst_trans(t90, 0, 0U);
    t103 = (t0 + 5280);
    *((int *)t103) = 1;

LAB1:    return;
LAB5:    *((unsigned int *)t5) = 1;
    goto LAB7;

LAB6:    t19 = (t5 + 4);
    *((unsigned int *)t5) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t20) = 1;
    goto LAB11;

LAB10:    t27 = (t20 + 4);
    *((unsigned int *)t20) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB11;

LAB12:    t32 = (t0 + 2504U);
    t33 = *((char **)t32);
    t32 = (t0 + 2984U);
    t34 = *((char **)t32);
    memset(t35, 0, 8);
    t32 = (t33 + 4);
    t36 = (t34 + 4);
    t37 = *((unsigned int *)t33);
    t38 = *((unsigned int *)t34);
    t39 = (t37 ^ t38);
    t40 = *((unsigned int *)t32);
    t41 = *((unsigned int *)t36);
    t42 = (t40 ^ t41);
    t43 = (t39 | t42);
    t44 = *((unsigned int *)t32);
    t45 = *((unsigned int *)t36);
    t46 = (t44 | t45);
    t47 = (~(t46));
    t48 = (t43 & t47);
    if (t48 != 0)
        goto LAB18;

LAB15:    if (t46 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t35) = 1;

LAB18:    memset(t50, 0, 8);
    t51 = (t35 + 4);
    t52 = *((unsigned int *)t51);
    t53 = (~(t52));
    t54 = *((unsigned int *)t35);
    t55 = (t54 & t53);
    t56 = (t55 & 1U);
    if (t56 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t51) != 0)
        goto LAB21;

LAB22:    t59 = *((unsigned int *)t20);
    t60 = *((unsigned int *)t50);
    t61 = (t59 & t60);
    *((unsigned int *)t58) = t61;
    t62 = (t20 + 4);
    t63 = (t50 + 4);
    t64 = (t58 + 4);
    t65 = *((unsigned int *)t62);
    t66 = *((unsigned int *)t63);
    t67 = (t65 | t66);
    *((unsigned int *)t64) = t67;
    t68 = *((unsigned int *)t64);
    t69 = (t68 != 0);
    if (t69 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t49 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t49) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t50) = 1;
    goto LAB22;

LAB21:    t57 = (t50 + 4);
    *((unsigned int *)t50) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB22;

LAB23:    t70 = *((unsigned int *)t58);
    t71 = *((unsigned int *)t64);
    *((unsigned int *)t58) = (t70 | t71);
    t72 = (t20 + 4);
    t73 = (t50 + 4);
    t74 = *((unsigned int *)t20);
    t75 = (~(t74));
    t76 = *((unsigned int *)t72);
    t77 = (~(t76));
    t78 = *((unsigned int *)t50);
    t79 = (~(t78));
    t80 = *((unsigned int *)t73);
    t81 = (~(t80));
    t82 = (t75 & t77);
    t83 = (t79 & t81);
    t84 = (~(t82));
    t85 = (~(t83));
    t86 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t86 & t84);
    t87 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t87 & t85);
    t88 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t88 & t84);
    t89 = *((unsigned int *)t58);
    *((unsigned int *)t58) = (t89 & t85);
    goto LAB25;

}

static void Always_30_2(char *t0)
{
    char t14[8];
    char t22[8];
    char t29[8];
    char t44[8];
    char t51[8];
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
    int t11;
    char *t12;
    char *t13;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;

LAB0:    t1 = (t0 + 4960U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 5296);
    *((int *)t2) = 1;
    t3 = (t0 + 4992);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(30, ng0);

LAB5:    xsi_set_current_line(31, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 1, 0LL);
    xsi_set_current_line(33, ng0);
    t2 = (t0 + 2024U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1864U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB76;

LAB77:
LAB78:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(33, ng0);

LAB9:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 2184U);
    t5 = *((char **)t4);

LAB10:    t4 = ((char*)((ng1)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 3, t4, 3);
    if (t11 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t11 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng3)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t11 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t11 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t11 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng6)));
    t11 = xsi_vlog_unsigned_case_compare(t5, 3, t2, 3);
    if (t11 == 1)
        goto LAB21;

LAB22:
LAB23:    goto LAB8;

LAB11:    xsi_set_current_line(35, ng0);

LAB24:    xsi_set_current_line(36, ng0);
    t12 = (t0 + 2824U);
    t13 = *((char **)t12);
    t12 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t12, t13, 0, 0, 1, 0LL);
    goto LAB23;

LAB13:    xsi_set_current_line(38, ng0);

LAB25:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 2824U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t4 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB29;

LAB27:    if (*((unsigned int *)t3) == 0)
        goto LAB26;

LAB28:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;

LAB29:    t13 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t13, t14, 0, 0, 1, 0LL);
    goto LAB23;

LAB15:    xsi_set_current_line(41, ng0);

LAB30:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 2984U);
    t4 = *((char **)t3);
    t3 = (t0 + 3144U);
    t12 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    *((unsigned int *)t14) = t8;
    t3 = (t4 + 4);
    t13 = (t12 + 4);
    t15 = (t14 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t13);
    t16 = (t9 | t10);
    *((unsigned int *)t15) = t16;
    t17 = *((unsigned int *)t15);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB31;

LAB32:
LAB33:    t21 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t21, t14, 0, 0, 1, 0LL);
    goto LAB23;

LAB17:    xsi_set_current_line(44, ng0);

LAB34:    xsi_set_current_line(45, ng0);
    t3 = (t0 + 2664U);
    t4 = *((char **)t3);
    t3 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 1, 0LL);
    goto LAB23;

LAB19:    xsi_set_current_line(47, ng0);

LAB35:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 2984U);
    t4 = *((char **)t3);
    t3 = (t0 + 3144U);
    t12 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t12);
    t8 = (t6 ^ t7);
    *((unsigned int *)t22) = t8;
    t3 = (t4 + 4);
    t13 = (t12 + 4);
    t15 = (t22 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t13);
    t16 = (t9 | t10);
    *((unsigned int *)t15) = t16;
    t17 = *((unsigned int *)t15);
    t18 = (t17 != 0);
    if (t18 == 1)
        goto LAB36;

LAB37:
LAB38:    memset(t14, 0, 8);
    t21 = (t22 + 4);
    t23 = *((unsigned int *)t21);
    t24 = (~(t23));
    t25 = *((unsigned int *)t22);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB42;

LAB40:    if (*((unsigned int *)t21) == 0)
        goto LAB39;

LAB41:    t28 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t28) = 1;

LAB42:    memset(t29, 0, 8);
    t30 = (t14 + 4);
    t31 = *((unsigned int *)t30);
    t32 = (~(t31));
    t33 = *((unsigned int *)t14);
    t34 = (t33 & t32);
    t35 = (t34 & 1U);
    if (t35 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t30) != 0)
        goto LAB45;

LAB46:    t37 = (t29 + 4);
    t38 = *((unsigned int *)t29);
    t39 = (!(t38));
    t40 = *((unsigned int *)t37);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB47;

LAB48:    memcpy(t51, t29, 8);

LAB49:    t79 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t79, t51, 0, 0, 1, 0LL);
    goto LAB23;

LAB21:    xsi_set_current_line(50, ng0);

LAB57:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 2664U);
    t4 = *((char **)t3);
    memset(t14, 0, 8);
    t3 = (t4 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB61;

LAB59:    if (*((unsigned int *)t3) == 0)
        goto LAB58;

LAB60:    t12 = (t14 + 4);
    *((unsigned int *)t14) = 1;
    *((unsigned int *)t12) = 1;

LAB61:    memset(t22, 0, 8);
    t13 = (t14 + 4);
    t16 = *((unsigned int *)t13);
    t17 = (~(t16));
    t18 = *((unsigned int *)t14);
    t19 = (t18 & t17);
    t20 = (t19 & 1U);
    if (t20 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t13) != 0)
        goto LAB64;

LAB65:    t21 = (t22 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (!(t23));
    t25 = *((unsigned int *)t21);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB66;

LAB67:    memcpy(t44, t22, 8);

LAB68:    t56 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t56, t44, 0, 0, 1, 0LL);
    goto LAB23;

LAB26:    *((unsigned int *)t14) = 1;
    goto LAB29;

LAB31:    t19 = *((unsigned int *)t14);
    t20 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t19 | t20);
    goto LAB33;

LAB36:    t19 = *((unsigned int *)t22);
    t20 = *((unsigned int *)t15);
    *((unsigned int *)t22) = (t19 | t20);
    goto LAB38;

LAB39:    *((unsigned int *)t14) = 1;
    goto LAB42;

LAB43:    *((unsigned int *)t29) = 1;
    goto LAB46;

LAB45:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB46;

LAB47:    t42 = (t0 + 2824U);
    t43 = *((char **)t42);
    memset(t44, 0, 8);
    t42 = (t43 + 4);
    t45 = *((unsigned int *)t42);
    t46 = (~(t45));
    t47 = *((unsigned int *)t43);
    t48 = (t47 & t46);
    t49 = (t48 & 1U);
    if (t49 != 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t42) != 0)
        goto LAB52;

LAB53:    t52 = *((unsigned int *)t29);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    *((unsigned int *)t51) = t54;
    t55 = (t29 + 4);
    t56 = (t44 + 4);
    t57 = (t51 + 4);
    t58 = *((unsigned int *)t55);
    t59 = *((unsigned int *)t56);
    t60 = (t58 | t59);
    *((unsigned int *)t57) = t60;
    t61 = *((unsigned int *)t57);
    t62 = (t61 != 0);
    if (t62 == 1)
        goto LAB54;

LAB55:
LAB56:    goto LAB49;

LAB50:    *((unsigned int *)t44) = 1;
    goto LAB53;

LAB52:    t50 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t50) = 1;
    goto LAB53;

LAB54:    t63 = *((unsigned int *)t51);
    t64 = *((unsigned int *)t57);
    *((unsigned int *)t51) = (t63 | t64);
    t65 = (t29 + 4);
    t66 = (t44 + 4);
    t67 = *((unsigned int *)t65);
    t68 = (~(t67));
    t69 = *((unsigned int *)t29);
    t70 = (t69 & t68);
    t71 = *((unsigned int *)t66);
    t72 = (~(t71));
    t73 = *((unsigned int *)t44);
    t74 = (t73 & t72);
    t75 = (~(t70));
    t76 = (~(t74));
    t77 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t77 & t75);
    t78 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t78 & t76);
    goto LAB56;

LAB58:    *((unsigned int *)t14) = 1;
    goto LAB61;

LAB62:    *((unsigned int *)t22) = 1;
    goto LAB65;

LAB64:    t15 = (t22 + 4);
    *((unsigned int *)t22) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB65;

LAB66:    t28 = (t0 + 2824U);
    t30 = *((char **)t28);
    memset(t29, 0, 8);
    t28 = (t30 + 4);
    t27 = *((unsigned int *)t28);
    t31 = (~(t27));
    t32 = *((unsigned int *)t30);
    t33 = (t32 & t31);
    t34 = (t33 & 1U);
    if (t34 != 0)
        goto LAB69;

LAB70:    if (*((unsigned int *)t28) != 0)
        goto LAB71;

LAB72:    t35 = *((unsigned int *)t22);
    t38 = *((unsigned int *)t29);
    t39 = (t35 | t38);
    *((unsigned int *)t44) = t39;
    t37 = (t22 + 4);
    t42 = (t29 + 4);
    t43 = (t44 + 4);
    t40 = *((unsigned int *)t37);
    t41 = *((unsigned int *)t42);
    t45 = (t40 | t41);
    *((unsigned int *)t43) = t45;
    t46 = *((unsigned int *)t43);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB73;

LAB74:
LAB75:    goto LAB68;

LAB69:    *((unsigned int *)t29) = 1;
    goto LAB72;

LAB71:    t36 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB72;

LAB73:    t48 = *((unsigned int *)t44);
    t49 = *((unsigned int *)t43);
    *((unsigned int *)t44) = (t48 | t49);
    t50 = (t22 + 4);
    t55 = (t29 + 4);
    t52 = *((unsigned int *)t50);
    t53 = (~(t52));
    t54 = *((unsigned int *)t22);
    t70 = (t54 & t53);
    t58 = *((unsigned int *)t55);
    t59 = (~(t58));
    t60 = *((unsigned int *)t29);
    t74 = (t60 & t59);
    t61 = (~(t70));
    t62 = (~(t74));
    t63 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t63 & t61);
    t64 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t64 & t62);
    goto LAB75;

LAB76:    xsi_set_current_line(54, ng0);

LAB79:    xsi_set_current_line(55, ng0);
    t4 = ((char*)((ng2)));
    t12 = (t0 + 3544);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 1, 0LL);
    goto LAB78;

}


extern void work_m_00000000000192826606_3995010707_init()
{
	static char *pe[] = {(void *)Initial_17_0,(void *)NetDecl_28_1,(void *)Always_30_2};
	xsi_register_didat("work_m_00000000000192826606_3995010707", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000000192826606_3995010707.didat");
	xsi_register_executes(pe);
}
