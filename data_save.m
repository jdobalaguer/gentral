if parameters.flag_debug; return; end
if end_of_task; return; end

save(participant.filename_data,'data','parameters','participant','ptb');
