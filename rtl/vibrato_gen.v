module vibrato_gen (
    input en,
    input clk,
    input note_on,
    input note_repeat,
    input[6:0] note_start,
    output[8:0] vib_out
);
reg note_repeat_reg;
reg[6:0] note_reg;
reg[8:0] vib_out_reg = 'd12;
reg[23:0] delay_timer = 'b1; //24
reg started;
reg vib_start;
reg[16:0] step_timer; //18
reg[4:0] max = 'd24;
reg flip;

assign vib_out = vib_out_reg;

always @ (posedge clk) begin
    if (en) begin
        if ((note_reg != note_start || note_repeat_reg) && note_on && !started) begin
            started <= 1;
            note_repeat_reg <= 0;
            note_reg <= note_start;
            vib_start <= 0;
            delay_timer <= 'b1;
            step_timer <= 0;
            flip <= 0;
            vib_out_reg <= 'd12;
        end
        if (started) begin
            if (!vib_start) delay_timer <= delay_timer + 'b1;
            else delay_timer <= 0;
            if (!delay_timer) begin
                vib_start <= 1;
                step_timer <= step_timer + 'b1;
                if (!step_timer) begin
                    case(flip)
                        'd0: begin
                            if (vib_out_reg < max) vib_out_reg <= vib_out_reg + 'b1;
                            else flip <= 'd1;
                        end
                        'd1: begin
                            if (vib_out_reg > 0) vib_out_reg <= vib_out_reg - 'b1;
                            else flip <= 'd0;
                        end
                    endcase
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
    else vib_out_reg <= 'd12;
end

endmodule