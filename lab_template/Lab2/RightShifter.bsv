import RightShifterTypes::*;
import Gates::*;
import FIFO::*;

function Bit#(1) multiplexer1(Bit#(1) sel, Bit#(1) a, Bit#(1) b);
    return orGate(andGate(a, sel),andGate(b, notGate(sel))); 
endfunction

function Bit#(32) multiplexer32(Bit#(1) sel, Bit#(32) a, Bit#(32) b);
	Bit#(32) res_vec = 0;
	for (Integer i = 0; i < 32; i = i+1)
	    begin
		res_vec[i] = multiplexer1(sel, a[i], b[i]);
	    end
	return res_vec; 
endfunction

function Bit#(n) multiplexerN(Bit#(1) sel, Bit#(n) a, Bit#(n) b);
	Bit#(n) res_vec = 0;
	for (Integer i = 0; i < valueof(n); i = i+1)
	    begin
		res_vec[i] = multiplexer1(sel, a[i], b[i]);
	    end
	return res_vec; 
endfunction

module mkRightShifterPipelined (RightShifterPipelined);
    FIFO#(Bit#(2)) c <- mkFIFO();

    rule ruleName (/*Guard*/);
	/* Write your code here */
    endrule

    method Action push(ShiftMode mode, Bit#(32) operand, Bit#(5) shamt);
	/* Write your code here */
    endmethod
	
    method ActionValue#(Bit#(32)) pull();
	/* Write your code here */
    endmethod

endmodule

