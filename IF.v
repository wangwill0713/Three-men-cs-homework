`include "lib/defines.vh"
module IF(
    input wire clk,
    input wire rst,
    input wire [`StallBus-1:0] stall,

    // input wire flush,
    // input wire [31:0] new_pc,

    input wire [`BR_WD-1:0] br_bus,//跳转bus
    output wire [`IF_TO_ID_WD-1:0] if_to_id_bus,
    output wire inst_sram_en,
    output wire [3:0] inst_sram_wen,
    output wire [31:0] inst_sram_addr,
    output wire [31:0] inst_sram_wdata
);
    reg [31:0] pc_reg;//指令寄存器
    reg ce_reg;
    wire [31:0] next_pc;//NPC寄存器
    wire br_e;
    wire [31:0] br_addr;
    //
    assign {
        br_e,
        br_addr
    } = br_bus;


    always @ (posedge clk) begin
        if (rst) begin
            pc_reg <= 32'hbfbf_fffc;//被禁用的时候 PC为某一定值
        end
        else if (stall[0]==`NoStop) begin
            pc_reg <= next_pc;//存储器可以使用 PC寄存器与NPC寄存器连线
        end
        
    end
    always @ (posedge clk) begin
        if (rst) begin
            ce_reg <= 1'b0;//复位，指令寄存器禁用
        end
        else if (stall[0]==`NoStop) begin
            ce_reg <= 1'b1;  //复位结束指令寄存器可以使用
        end
    end


    assign next_pc = br_e ? br_addr 
                   : pc_reg + 32'h4;//只有分支使能时 npc为总线传来的地址 否则为当前pc+4的地址

    assign inst_sram_en = ce_reg;
    assign inst_sram_wen = 4'b0;
    assign inst_sram_addr = pc_reg;
    assign inst_sram_wdata = 32'b0;
    assign if_to_id_bus = {
        ce_reg,
        pc_reg
    };
endmodule
