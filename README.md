# -
作者：王睿麟 吕原汇一 李尚儒\
2021年 12月4日\
工作小结：\
1.完成load和store指令、跳转指令和部分运算指令的添加\
2.完成旁路连接,解决3种数据相关情况\
3.完成延迟槽的设计和连接\
效果：通过pass point8\
分工：\
王睿麟：负责上述任务在ID.v、regfile.v和EX.v的工作\
吕原汇一：负责上述任务在IF.v、MEM.v和WB.v的工作\
李尚儒：负责上述任务在CTRL.v、mycpu_top.v和mycpu_core.v的工作


2021年12月8日\
工作小结:\
1.添加xori、addi、andi等运算指令\
2.对跳转指令的译码过程中存在的错误进行了修复\
效果：通过pass point43\
分工：\
王睿麟：负责修复跳转指令的错误修复和所缺失得的逻辑运算指令的添加\
吕原汇一和李尚儒：负责添加移位指令和加减运算指令


2021年12月11日\
工作小结:\
1.完成数据移动指令及HI和LO寄存器的添加\
2.完成load和store指令的错误修复\
3.完成乘法和除法指令的添加\
效果：通过pass point64\
分工：\
王睿麟：负责上述任务在ID.v和EX.v的工作\
吕原汇一：负责上述任务在在MEM.v和WB.v的工作\
李尚儒：负责上述任务在CTRL.v和regfile.v的工作
