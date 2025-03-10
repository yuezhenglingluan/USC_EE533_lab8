`timescale 1ns/1ps


module passthrough
   #(
      parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH = DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2
   )
    (    

      input  [DATA_WIDTH-1:0]             in_data,
      input  [CTRL_WIDTH-1:0]             in_ctrl,
      input                               in_wr,
      output                              in_rdy,

      output [DATA_WIDTH-1:0]             out_data,
      output [CTRL_WIDTH-1:0]             out_ctrl,
      output                              out_wr,
      input                               out_rdy,  
      // --- Register interface
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out,

      // misc
      input                                reset,
      input                                clk
    );

   reg [31:0]         hw_reg0;         //hardware register
   reg [31:0]         addr_reg; 


   reg [1:0]          DRAM_MODE;        //10 for DRAM, 00 for fifo recieve,  01 for fifo send

   wire [31:0]        CMD_reg;        //software register
   reg [31:0]        flag_reg;
   
   reg [31:0]        CMD_GET_IN;

   reg [63:0]         pkt;
   reg [63:0]         pkt_in;
   
   wire [31:0]        inst_out;       //wires
   wire [8:0]         addr_out;
   wire               write_enable;
   reg               pipline_rst;



  //pipline part
   wire                FIFO_almost_empty;
   wire                FIFO_almost_full;
   wire                FIFO_depth;
   wire                FIFO_FULL;
   wire                pkt_out;        




   generic_regs
   #(
    .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
    .TAG                 (`PASSTHROUGH_BLOCK_ADDR_WIDTH ),          // Tag -- eg. MODULE_TAG
    .REG_ADDR_WIDTH      (`PASSTHROUGH_REG_ADDR_WIDTH),   
    .NUM_COUNTERS       (0),    
    .NUM_SOFTWARE_REGS  (2),
    .NUM_HARDWARE_REGS  (2)
   )module_regs(

    .reg_req_in       (reg_req_in),
    .reg_ack_in       (reg_ack_in),
    .reg_rd_wr_L_in   (reg_rd_wr_L_in),
    .reg_addr_in      (reg_addr_in),
    .reg_data_in      (reg_data_in),
    .reg_src_in       (reg_src_in),

    .reg_req_out      (reg_req_out),
    .reg_ack_out      (reg_ack_out),
    .reg_rd_wr_L_out  (reg_rd_wr_L_out),
    .reg_addr_out     (reg_addr_out),
    .reg_data_out     (reg_data_out),
    .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

    .software_regs       ({CMD_reg,flag_reg}),
    .hardware_regs       ({hw_reg0,addr_reg}),
    .clk                 (clk),
    .reset               (reset)

   );
   instruction_fsm fsm_inst(

    .clk                (clk),
    .rst_n              (reset),
    .addr_in            (addr_reg[8:0]),
    .inst_in            (CMD_GET_IN),
    .inst_out           (inst_out),
    .addr_out           (addr_out),
    .write_enable       (write_enable),
    .flag_ready         (flag_reg[2]),
    .flag_reg           (flag_reg)
   );

   Pipeline_demo pipline(
    .clk                (clk),
    .rst                (pipline_rst),
    .rst_FIFO           (rst),
    .HLEN               (64'd3),
    .Instr_IN           (inst_out),
    .Instr_IN_addr      (addr_out),
    .Instr_IN_en        (write_enable),
    .mode_code          (DRAM_MODE),
    .ONE                (64'd1),
    .pkt_in             (pkt_in),

    //output
    .FIFO_almost_empty  (FIFO_almost_empty),
    .FIFO_almost_full   (FIFO_almost_full),
    .FIFO_depth         (FIFO_depth),
    .FIFO_FULL          (FIFO_FULL),
    .pkt_out            (pkt_out)
   );


    assign out_data = in_data;
    assign out_ctrl = in_ctrl;
    assign out_wr = in_wr;
    assign in_rdy = out_rdy;


    // typedef enum logic[2:0]{
    //     start = 3'b000,
    //     Packet_Rec = 3'b001,
    //     Inst_INIT = 3'b010,
    //     Process = 3'b011,
    //     Packet_send = 3'b100
    // } state_t;

    // state_t state, next_state;

    parameter start = 3'b000;
    parameter Packet_Rec = 3'b001;
    parameter Inst_INIT = 3'b010;
    parameter Process = 3'b011;
    parameter Packet_send = 3'b100;

    reg [2:0] state, next_state;
    

    always @(*) begin
      case (state)
        start: next_state = Packet_Rec;
        Packet_Rec: begin
          if(pkt == 64'hXXXXXXXXXXXXX5)
            next_state = Inst_INIT;
          else
            next_state = Packet_Rec;
        end
        Inst_INIT: begin
          if(flag_reg[3])
            next_state = Process;
          else
            next_state = Inst_INIT;
        end
        Process: begin
          if(DRAM_MODE == 2'b01)
              next_state = Packet_send;
          else
              next_state = Process;
        end
        Packet_send: begin
          if(flag_reg[4])
            next_state = Packet_Rec;
          else
            next_state = Packet_send;
        end
      endcase 
    end

always @(posedge clk or negedge reset) begin
    if (~reset) begin
        pkt <= 64'h00000000000005;
        DRAM_MODE <= 2'b00;
        CMD_GET_IN <= 0;
        pipline_rst <= 1'b0;
    end else begin
        case (state)
            start: begin
                DRAM_MODE <= 2'b00;
            end

            Packet_Rec: begin
                DRAM_MODE <= 2'b01;
                pkt_in <= pkt;
            end

            Inst_INIT: begin
                DRAM_MODE <= 2'b10;
                flag_reg[2] <= 1'b1;
                CMD_GET_IN <= CMD_reg;
                pipline_rst <= 1'b1;
            end

            Process: begin
                pipline_rst <= 1'b0;
            end

            Packet_send: begin
                DRAM_MODE <= 2'b01;
            end

            default: begin
                DRAM_MODE <= 2'b00;
                pipline_rst <= 1'b1;
            end
        endcase
    end
        

end

endmodule