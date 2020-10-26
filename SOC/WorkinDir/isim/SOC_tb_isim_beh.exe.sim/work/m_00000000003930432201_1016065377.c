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
static const char *ng0 = "I:/4-Git Repos/Arcadia Microcomputer/SOC/SOC/RTL/Peripherals/UART/UartTx.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {1, 0};
static int ng3[] = {0, 0};
static int ng4[] = {7, 0};



static void Initial_16_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(16, ng0);

LAB2:    xsi_set_current_line(17, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 2928);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);
    xsi_set_current_line(18, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 1, 0LL);

LAB1:    return;
}

static void Always_34_1(char *t0)
{
    char t9[8];
    char t30[8];
    char t36[8];
    char t45[8];
    char t53[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    unsigned int t10;
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
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    char *t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    char *t87;
    char *t88;

LAB0:    t1 = (t0 + 5056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 5376);
    *((int *)t2) = 1;
    t3 = (t0 + 5088);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(34, ng0);

LAB5:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 2528U);
    t5 = *((char **)t4);
    t4 = (t0 + 3728);
    xsi_vlogvar_wait_assign_value(t4, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 3888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB6:    t5 = (t0 + 608);
    t6 = *((char **)t5);
    t7 = xsi_vlog_unsigned_case_compare(t4, 2, t6, 32);
    if (t7 == 1)
        goto LAB7;

LAB8:    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t7 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t7 == 1)
        goto LAB9;

LAB10:    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t7 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t7 == 1)
        goto LAB11;

LAB12:    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t7 = xsi_vlog_unsigned_case_compare(t4, 2, t3, 32);
    if (t7 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(39, ng0);

LAB16:    xsi_set_current_line(40, ng0);
    t5 = ((char*)((ng2)));
    t8 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t8, t5, 0, 0, 1, 0LL);
    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t9, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t10 = *((unsigned int *)t3);
    t11 = *((unsigned int *)t2);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t5);
    t14 = *((unsigned int *)t6);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t5);
    t18 = *((unsigned int *)t6);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB20;

LAB17:    if (t19 != 0)
        goto LAB19;

LAB18:    *((unsigned int *)t9) = 1;

LAB20:    t22 = (t9 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t9);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB21;

LAB22:    xsi_set_current_line(47, ng0);

LAB25:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB23:    goto LAB15;

LAB9:    xsi_set_current_line(51, ng0);

LAB26:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2528U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t9, 0, 8);
    t6 = (t5 + 4);
    t8 = (t2 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t2);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t6);
    t14 = *((unsigned int *)t8);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t6);
    t18 = *((unsigned int *)t8);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB30;

LAB27:    if (t19 != 0)
        goto LAB29;

LAB28:    *((unsigned int *)t9) = 1;

LAB30:    memset(t30, 0, 8);
    t28 = (t9 + 4);
    t23 = *((unsigned int *)t28);
    t24 = (~(t23));
    t25 = *((unsigned int *)t9);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t28) != 0)
        goto LAB33;

LAB34:    t31 = (t30 + 4);
    t32 = *((unsigned int *)t30);
    t33 = (!(t32));
    t34 = *((unsigned int *)t31);
    t35 = (t33 || t34);
    if (t35 > 0)
        goto LAB35;

LAB36:    memcpy(t53, t30, 8);

LAB37:    t81 = (t53 + 4);
    t82 = *((unsigned int *)t81);
    t83 = (~(t82));
    t84 = *((unsigned int *)t53);
    t85 = (t84 & t83);
    t86 = (t85 != 0);
    if (t86 > 0)
        goto LAB49;

LAB50:
LAB51:    goto LAB15;

LAB11:    xsi_set_current_line(66, ng0);

LAB62:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2368U);
    t5 = *((char **)t2);
    t2 = (t0 + 2328U);
    t6 = (t2 + 72U);
    t8 = *((char **)t6);
    t22 = (t0 + 3408);
    t28 = (t22 + 56U);
    t29 = *((char **)t28);
    xsi_vlog_generic_get_index_select_value(t9, 1, t5, t8, 2, t29, 3, 2);
    t31 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t31, t9, 0, 0, 1, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 1888U);
    t8 = *((char **)t6);
    t6 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_minus(t9, 32, t8, 16, t6, 32);
    memset(t30, 0, 8);
    t22 = (t5 + 4);
    t28 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t9);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t22);
    t14 = *((unsigned int *)t28);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t22);
    t18 = *((unsigned int *)t28);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB66;

LAB63:    if (t19 != 0)
        goto LAB65;

LAB64:    *((unsigned int *)t30) = 1;

LAB66:    t31 = (t30 + 4);
    t23 = *((unsigned int *)t31);
    t24 = (~(t23));
    t25 = *((unsigned int *)t30);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB67;

LAB68:    xsi_set_current_line(77, ng0);

LAB79:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 16, t6, 32);
    t8 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t8, t9, 0, 0, 16, 0LL);

LAB69:    goto LAB15;

LAB13:    xsi_set_current_line(81, ng0);

LAB80:    xsi_set_current_line(82, ng0);
    t2 = ((char*)((ng2)));
    t5 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t5, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 1888U);
    t8 = *((char **)t6);
    t6 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_minus(t9, 32, t8, 16, t6, 32);
    memset(t30, 0, 8);
    t22 = (t5 + 4);
    t28 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t9);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t22);
    t14 = *((unsigned int *)t28);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t22);
    t18 = *((unsigned int *)t28);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB84;

LAB81:    if (t19 != 0)
        goto LAB83;

LAB82:    *((unsigned int *)t30) = 1;

LAB84:    t31 = (t30 + 4);
    t23 = *((unsigned int *)t31);
    t24 = (~(t23));
    t25 = *((unsigned int *)t30);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB85;

LAB86:    xsi_set_current_line(86, ng0);

LAB89:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 16, t6, 32);
    t8 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t8, t9, 0, 0, 16, 0LL);

LAB87:    goto LAB15;

LAB19:    t8 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB20;

LAB21:    xsi_set_current_line(44, ng0);

LAB24:    xsi_set_current_line(45, ng0);
    t28 = ((char*)((ng3)));
    t29 = (t0 + 2928);
    xsi_vlogvar_wait_assign_value(t29, t28, 0, 0, 1, 0LL);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 744);
    t3 = *((char **)t2);
    t2 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB23;

LAB29:    t22 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB30;

LAB31:    *((unsigned int *)t30) = 1;
    goto LAB34;

LAB33:    t29 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB34;

LAB35:    t37 = (t0 + 2048U);
    t38 = *((char **)t37);
    memset(t36, 0, 8);
    t37 = (t38 + 4);
    t39 = *((unsigned int *)t37);
    t40 = (~(t39));
    t41 = *((unsigned int *)t38);
    t42 = (t41 & t40);
    t43 = (t42 & 1U);
    if (t43 != 0)
        goto LAB41;

LAB39:    if (*((unsigned int *)t37) == 0)
        goto LAB38;

LAB40:    t44 = (t36 + 4);
    *((unsigned int *)t36) = 1;
    *((unsigned int *)t44) = 1;

LAB41:    memset(t45, 0, 8);
    t46 = (t36 + 4);
    t47 = *((unsigned int *)t46);
    t48 = (~(t47));
    t49 = *((unsigned int *)t36);
    t50 = (t49 & t48);
    t51 = (t50 & 1U);
    if (t51 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t46) != 0)
        goto LAB44;

LAB45:    t54 = *((unsigned int *)t30);
    t55 = *((unsigned int *)t45);
    t56 = (t54 | t55);
    *((unsigned int *)t53) = t56;
    t57 = (t30 + 4);
    t58 = (t45 + 4);
    t59 = (t53 + 4);
    t60 = *((unsigned int *)t57);
    t61 = *((unsigned int *)t58);
    t62 = (t60 | t61);
    *((unsigned int *)t59) = t62;
    t63 = *((unsigned int *)t59);
    t64 = (t63 != 0);
    if (t64 == 1)
        goto LAB46;

LAB47:
LAB48:    goto LAB37;

LAB38:    *((unsigned int *)t36) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t45) = 1;
    goto LAB45;

LAB44:    t52 = (t45 + 4);
    *((unsigned int *)t45) = 1;
    *((unsigned int *)t52) = 1;
    goto LAB45;

LAB46:    t65 = *((unsigned int *)t53);
    t66 = *((unsigned int *)t59);
    *((unsigned int *)t53) = (t65 | t66);
    t67 = (t30 + 4);
    t68 = (t45 + 4);
    t69 = *((unsigned int *)t67);
    t70 = (~(t69));
    t71 = *((unsigned int *)t30);
    t72 = (t71 & t70);
    t73 = *((unsigned int *)t68);
    t74 = (~(t73));
    t75 = *((unsigned int *)t45);
    t76 = (t75 & t74);
    t77 = (~(t72));
    t78 = (~(t76));
    t79 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t79 & t77);
    t80 = *((unsigned int *)t59);
    *((unsigned int *)t59) = (t80 & t78);
    goto LAB48;

LAB49:    xsi_set_current_line(55, ng0);

LAB52:    xsi_set_current_line(56, ng0);
    t87 = ((char*)((ng3)));
    t88 = (t0 + 3088);
    xsi_vlogvar_wait_assign_value(t88, t87, 0, 0, 1, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t0 + 1888U);
    t8 = *((char **)t6);
    t6 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_minus(t9, 32, t8, 16, t6, 32);
    memset(t30, 0, 8);
    t22 = (t5 + 4);
    t28 = (t9 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t9);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t22);
    t14 = *((unsigned int *)t28);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t22);
    t18 = *((unsigned int *)t28);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB56;

LAB53:    if (t19 != 0)
        goto LAB55;

LAB54:    *((unsigned int *)t30) = 1;

LAB56:    t31 = (t30 + 4);
    t23 = *((unsigned int *)t31);
    t24 = (~(t23));
    t25 = *((unsigned int *)t30);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB57;

LAB58:    xsi_set_current_line(61, ng0);

LAB61:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng2)));
    memset(t9, 0, 8);
    xsi_vlog_unsigned_add(t9, 32, t5, 16, t6, 32);
    t8 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t8, t9, 0, 0, 16, 0LL);

LAB59:    goto LAB51;

LAB55:    t29 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB56;

LAB57:    xsi_set_current_line(58, ng0);

LAB60:    xsi_set_current_line(59, ng0);
    t37 = ((char*)((ng3)));
    t38 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 16, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 880);
    t3 = *((char **)t2);
    t2 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB59;

LAB65:    t29 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB66;

LAB67:    xsi_set_current_line(69, ng0);

LAB70:    xsi_set_current_line(70, ng0);
    t37 = (t0 + 3408);
    t38 = (t37 + 56U);
    t44 = *((char **)t38);
    t46 = ((char*)((ng2)));
    memset(t36, 0, 8);
    xsi_vlog_unsigned_add(t36, 32, t44, 3, t46, 32);
    t52 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t52, t36, 0, 0, 3, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 16, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 3408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t9, 0, 8);
    t8 = (t5 + 4);
    t22 = (t6 + 4);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = *((unsigned int *)t8);
    t14 = *((unsigned int *)t22);
    t15 = (t13 ^ t14);
    t16 = (t12 | t15);
    t17 = *((unsigned int *)t8);
    t18 = *((unsigned int *)t22);
    t19 = (t17 | t18);
    t20 = (~(t19));
    t21 = (t16 & t20);
    if (t21 != 0)
        goto LAB74;

LAB71:    if (t19 != 0)
        goto LAB73;

LAB72:    *((unsigned int *)t9) = 1;

LAB74:    t29 = (t9 + 4);
    t23 = *((unsigned int *)t29);
    t24 = (~(t23));
    t25 = *((unsigned int *)t9);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB75;

LAB76:
LAB77:    goto LAB69;

LAB73:    t28 = (t9 + 4);
    *((unsigned int *)t9) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB74;

LAB75:    xsi_set_current_line(73, ng0);

LAB78:    xsi_set_current_line(74, ng0);
    t31 = ((char*)((ng3)));
    t37 = (t0 + 3408);
    xsi_vlogvar_wait_assign_value(t37, t31, 0, 0, 3, 0LL);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1016);
    t3 = *((char **)t2);
    t2 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB77;

LAB83:    t29 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t29) = 1;
    goto LAB84;

LAB85:    xsi_set_current_line(83, ng0);

LAB88:    xsi_set_current_line(84, ng0);
    t37 = ((char*)((ng3)));
    t38 = (t0 + 3248);
    xsi_vlogvar_wait_assign_value(t38, t37, 0, 0, 16, 0LL);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 608);
    t3 = *((char **)t2);
    t2 = (t0 + 3888);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 2, 0LL);
    goto LAB87;

}


extern void work_m_00000000003930432201_1016065377_init()
{
	static char *pe[] = {(void *)Initial_16_0,(void *)Always_34_1};
	xsi_register_didat("work_m_00000000003930432201_1016065377", "isim/SOC_tb_isim_beh.exe.sim/work/m_00000000003930432201_1016065377.didat");
	xsi_register_executes(pe);
}
