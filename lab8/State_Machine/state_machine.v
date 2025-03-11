module instruction_fsm (
    input wire clk,
    input wire rst_n,
    input wire [8:0] addr_in,   // 9-bit IRAM address
    input wire [31:0] inst_in,  // 32-bit instruction input
    output reg [31:0] inst_out, // 32-bit instruction output to IRAM
    output reg [8:0] addr_out,  // Address output to IRAM
    output reg write_enable,    // Write enable signal for IRAM
    input wire flag_ready,      // 来自 flag_reg[2]，表示 script 触发传输
    output reg [31:0] flag_reg  // 32-bit flag register (flag_reg[2] 控制 FSM)
);

    // 定义状态
    // typedef enum logic [2:0] {
    //     IDLE  = 3'b000, // 等待 flag_ready = 1
    //     FETCH = 3'b001, // 读取指令
    //     SEND  = 3'b010, // 发送指令到 IRAM
    //     INC   = 3'b011, // 地址递增
    //     DONE  = 3'b100  // 传输完成，清 flag_reg[2]
    // } state_t;

    // state_t state, next_state;

    parameter IDLE  = 3'b000; // 等待 flag_ready = 1
    parameter FETCH = 3'b001; // 读取指令
    parameter SEND  = 3'b010; // 发送指令到 IRAM
    parameter INC   = 3'b011; // 地址递增
    parameter DONE  = 3'b100; // 传输完成，清 flag_reg[2]

    reg [2:0] state, next_state;


    // **状态转换由 flag_reg[2] 控制，而非时钟**
    always @(*) begin
        case (state)
            IDLE: begin
                if (flag_ready)  // 仅当 flag_reg[2] == 1 时启动
                    next_state = FETCH;
                else
                    next_state = IDLE;
            end
            
            FETCH: 
                next_state = SEND; // 读取指令后，进入 SEND 以写入 IRAM

            SEND: 
                next_state = INC; // 发送后递增地址

            INC:
                next_state = DONE; // 进入 DONE，表示一次完整的传输完成

            DONE: 
                next_state = IDLE; // 传输完成后回到 IDLE，等待下一条指令

            default: 
                next_state = IDLE;
        endcase
    end

    // **数据传输逻辑**
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            inst_out <= 32'b0;
            addr_out <= 9'b0;
            write_enable <= 1'b0;
            flag_reg <= 32'b0;
        end else begin
            case (state)
                IDLE: begin
                    inst_out <= 32'b0;
                    write_enable <= 1'b0;
                end
                FETCH: begin
                    flag_reg[1] <= 1'b0;
                    inst_out <= inst_in; // 读取指令
                    write_enable <= 1'b1; // 触发写入 IRAM
                end
                SEND: 
                    write_enable <= 1'b0; // 关闭写入

                INC: 
                    addr_out <= addr_in + 1; // **地址递增 4，准备写入下一个地址**

                DONE:
                    flag_reg[1] <= 1'b1;
                default: begin
                    inst_out <= 32'b0;
                    addr_out <= 9'b0;
                    write_enable <= 1'b0;
                    flag_reg <= 32'b0;
                end
            endcase
        end
    end

endmodule
