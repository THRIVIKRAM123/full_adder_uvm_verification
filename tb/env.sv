class env extends uvm_env;
  `uvm_component_utils(env)
  config1 cfg;
  agent agh[];
  
  sb sb_h;

  //int no_of_agents=3;
  function new(string name="env", uvm_component parent );
    super.new(name, parent);
  endfunction
  
   function void build_phase(uvm_phase phase);
    super.build_phase(phase);
   if (!uvm_config_db#(config1)::get(this, "", "config1", cfg)) 
    begin
      `uvm_fatal("CONFIG", "Configuration getting failed in the environment")
    end

    agh=new[cfg.no_of_agents];
   // agh = agent::type_id::create("agh", this);
foreach(agh[i])
	begin
		agh[i] = agent::type_id::create($sformatf("agh[%0d]",i),this);
	end

      sb_h=sb::type_id::create("sb_h",this);

  endfunction

function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
   /* foreach(agh[i])
    begin
    agh[i].monh.ap.connect(sb_h.a_fifo.analysis_export);
    end */
    agh[0].monh.ap.connect(sb_h.a_fifo.analysis_export);
endfunction

endclass