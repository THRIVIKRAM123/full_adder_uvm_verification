class seqr extends uvm_sequencer#(xtn);
  `uvm_component_utils(seqr)
  
  function new(string name="seqr", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
endclass
