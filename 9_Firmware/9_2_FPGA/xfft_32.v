`timescale 1ns / 1ps
// ============================================================================
// xfft_32.v — Synthesis stub for Xilinx 32-point FFT IP core
// ============================================================================
// This is a PLACEHOLDER module that provides the port interface expected by
// doppler_processor.v. It does NOT perform an actual FFT — it simply passes
// input data through with a one-cycle latency and generates proper AXI-Stream
// handshake signals.
//
// For real hardware, replace this stub with either:
//   (a) A Xilinx FFT IP core generated via Vivado IP Catalog, or
//   (b) A custom synthesizable radix-2 DIT 32-point FFT in Verilog.
//
// Port interface matches the Xilinx LogiCORE IP Fast Fourier Transform
// (AXI-Stream variant) as instantiated in doppler_processor.v.
// ============================================================================

module xfft_32 (
    input  wire        aclk,
    input  wire        aresetn,

    // Configuration channel (AXI-Stream slave)
    input  wire [7:0]  s_axis_config_tdata,
    input  wire        s_axis_config_tvalid,
    output wire        s_axis_config_tready,

    // Data input channel (AXI-Stream slave)
    input  wire [31:0] s_axis_data_tdata,
    input  wire        s_axis_data_tvalid,
    input  wire        s_axis_data_tlast,

    // Data output channel (AXI-Stream master)
    output wire [31:0] m_axis_data_tdata,
    output wire        m_axis_data_tvalid,
    output wire        m_axis_data_tlast,
    input  wire        m_axis_data_tready
);

// ----------------------------------------------------------------------------
// Synthesis stub: pass-through with one-cycle latency
// ----------------------------------------------------------------------------
// This gives Vivado a real module to synthesize so it can check port
// connectivity, infer timing paths, and estimate utilization. The actual
// FFT computation is deferred to IP integration or a custom RTL FFT.
// ----------------------------------------------------------------------------

// Always accept config
assign s_axis_config_tready = 1'b1;

// Pipeline registers for data pass-through
reg [31:0] data_reg;
reg        valid_reg;
reg        last_reg;

always @(posedge aclk) begin
    if (!aresetn) begin
        data_reg  <= 32'd0;
        valid_reg <= 1'b0;
        last_reg  <= 1'b0;
    end else begin
        data_reg  <= s_axis_data_tdata;
        valid_reg <= s_axis_data_tvalid;
        last_reg  <= s_axis_data_tlast;
    end
end

assign m_axis_data_tdata  = data_reg;
assign m_axis_data_tvalid = valid_reg;
assign m_axis_data_tlast  = last_reg;

endmodule
