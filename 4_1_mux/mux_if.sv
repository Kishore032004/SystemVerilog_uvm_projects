interface mux_if;

    // DUT Inputs
    logic D0;
    logic D1;
    logic D2;
    logic D3;
    logic [1:0] S;

    // DUT Output
    logic Y;

    // Modport for DUT
    modport dut_mp (
        input  D0, D1, D2, D3,
        input  S,
        output Y
    );

    // Modport for TB
    modport tb_mp (
        output D0, D1, D2, D3,
        output S,
        input  Y
    );

endinterface
