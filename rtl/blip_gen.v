module blip_gen (
    input en,
    input clk,
    input note_on,
    input note_repeat,
    input[6:0] note_start,
    output[3:0] blip_out
);
reg note_repeat_reg;
reg[6:0] note_reg;
reg[3:0] blip_out_reg;
reg[19:0] delay_timer = 'b1; //24
reg started;
reg blip_start;
reg[19:0] step_timer; //18
//reg[4:0] max = 'd24;
reg[1:0] flip;

assign blip_out = blip_out_reg;

always @ (posedge clk) begin
    if (en) begin
        if ((note_reg != note_start || note_repeat_reg) && note_on && !started) begin
            started <= 1;
            note_repeat_reg <= 0;
            note_reg <= note_start;
            blip_start <= 0;
            delay_timer <= 'b1;
            step_timer <= 0;
            flip <= 0;
            blip_out_reg <= 0;
        end
        if (started) begin
            if (!blip_start) delay_timer <= delay_timer + 'b1;
            else delay_timer <= 0;
            if (!delay_timer) begin
                blip_start <= 1;
                if (flip < 2) begin
                    step_timer <= step_timer + 'b1;
                    if (!step_timer) begin
                        case(flip)
                            'd0: begin
                                blip_out_reg <= 'd12;
                                flip <= 'd1;
                            end
                            'd1: begin
                                blip_out_reg <= 0;
                                flip <= 'd2;
                            end
                        endcase
                    end
                end
            end
            if (note_reg != note_start || note_repeat) begin
                started <= 0;
                note_repeat_reg <= note_repeat;
            end
        end
        if (!note_on) begin
            started <= 0;
            if (note_reg == note_start) note_repeat_reg <= note_repeat;
            note_reg <= 0;
        end
    end
    else blip_out_reg <= 0;
end

endmodule