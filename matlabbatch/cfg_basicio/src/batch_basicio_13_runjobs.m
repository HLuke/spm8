%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 2787 $)
%-----------------------------------------------------------------------
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.type = 'cfg_entry';
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.name = 'String';
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.tag = 'instr';
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.strtype = 's';
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.extras = [];
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.num = [0 Inf];
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.check = [];
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.help = {'Enter a string.'};
matlabbatch{1}.menu_cfg{1}.menu_entry{1}.conf_entry.def = [];
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.type = 'cfg_entry';
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.name = 'Evaluated Input';
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.tag = 'ineval';
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.strtype = 'e';
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.extras = [];
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.num = [];
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.check = [];
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.help = {'Enter an evaluated input.'};
matlabbatch{2}.menu_cfg{1}.menu_entry{1}.conf_entry.def = [];
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.type = 'cfg_files';
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.name = 'NIfTI Images';
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.tag = 'innifti';
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.filter = 'image';
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.ufilter = '.*';
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.dir = '';
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.num = [0 Inf];
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.check = [];
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.help = {'Select NIfTI Images'};
matlabbatch{3}.menu_cfg{1}.menu_entry{1}.conf_files.def = [];
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.type = 'cfg_files';
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.name = 'MATLAB .mat Files';
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.tag = 'inmat';
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.filter = 'mat';
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.ufilter = '.*';
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.dir = '';
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.num = [0 Inf];
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.check = [];
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.help = {'Select MATLAB .mat files.'};
matlabbatch{4}.menu_cfg{1}.menu_entry{1}.conf_files.def = [];
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.type = 'cfg_files';
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.name = 'Any Files';
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.tag = 'inany';
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.filter = 'any';
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.ufilter = '.*';
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.dir = '';
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.num = [0 Inf];
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.check = [];
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.help = {'Select any kind of files.'};
matlabbatch{5}.menu_cfg{1}.menu_entry{1}.conf_files.def = [];
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.type = 'cfg_files';
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.name = 'Directory';
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.tag = 'indir';
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.filter = 'dir';
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.ufilter = '.*';
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.dir = '';
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.num = [1 Inf];
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.check = [];
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.help = {'Directory'};
matlabbatch{6}.menu_cfg{1}.menu_entry{1}.conf_files.def = [];
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.type = 'cfg_repeat';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.name = 'Job Inputs';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.tag = 'inputs';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1) = cfg_dep;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).tname = 'Values Item';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).tgt_spec = {};
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).sname = 'Entry: String (cfg_entry)';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).src_exbranch = substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).src_output = substruct('()',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{2}(1) = cfg_dep;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{2}(1).tname = 'Values Item';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{2}(1).tgt_spec = {};
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{2}(1).sname = 'Entry: Evaluated Input (cfg_entry)';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{2}(1).src_exbranch = substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{2}(1).src_output = substruct('()',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{3}(1) = cfg_dep;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{3}(1).tname = 'Values Item';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{3}(1).tgt_spec = {};
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{3}(1).sname = 'Files: NIfTI Images (cfg_files)';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{3}(1).src_exbranch = substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{3}(1).src_output = substruct('()',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{4}(1) = cfg_dep;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{4}(1).tname = 'Values Item';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{4}(1).tgt_spec = {};
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{4}(1).sname = 'Files: MATLAB .mat Files (cfg_files)';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{4}(1).src_exbranch = substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{4}(1).src_output = substruct('()',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{5}(1) = cfg_dep;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{5}(1).tname = 'Values Item';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{5}(1).tgt_spec = {};
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{5}(1).sname = 'Files: Any Files (cfg_files)';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{5}(1).src_exbranch = substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{5}(1).src_output = substruct('()',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{6}(1) = cfg_dep;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{6}(1).tname = 'Values Item';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{6}(1).tgt_spec = {};
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{6}(1).sname = 'Files: Directory (cfg_files)';
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{6}(1).src_exbranch = substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{6}(1).src_output = substruct('()',{1});
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.num = [0 Inf];
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.forcestruct = false;
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.check = [];
matlabbatch{7}.menu_cfg{1}.menu_struct{1}.conf_repeat.help = {'Assemble the set of input items for one run of the job.'};
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.type = 'cfg_repeat';
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.name = 'Runs';
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.tag = 'runs';
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1) = cfg_dep;
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).tname = 'Values Item';
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).tgt_spec = {};
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).sname = 'Repeat: Job Inputs (cfg_repeat)';
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).src_exbranch = substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.values{1}(1).src_output = substruct('()',{1});
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.num = [1 Inf];
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.forcestruct = false;
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.check = [];
matlabbatch{8}.menu_cfg{1}.menu_struct{1}.conf_repeat.help = {'Repeat "Job Inputs" for each run of the job, even if you want to specify no inputs in this batch itself. The number of "Job Inputs" items determines how often this job is run.'};
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.type = 'cfg_files';
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.name = 'Job File(s)';
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.tag = 'jobs';
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.filter = 'batch';
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.ufilter = '.*';
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.dir = '';
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.num = [1 Inf];
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.check = [];
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.help = {'Select the job template(s). If multiple files are selected, they will be concatenated in selection order to form one job.'};
matlabbatch{9}.menu_cfg{1}.menu_entry{1}.conf_files.def = [];
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.type = 'cfg_const';
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.name = 'Don''t Save';
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.tag = 'dontsave';
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.val{1} = false;
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.check = [];
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.help = {'Do not save the generated jobs.'};
matlabbatch{10}.menu_cfg{1}.menu_entry{1}.conf_const.def = [];
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.type = 'cfg_entry';
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.name = 'Batch Filename Stub';
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.tag = 'outstub';
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.strtype = 's';
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.extras = [];
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.num = [1 Inf];
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.check = [];
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.help = {'The output filename will be generated by appending a job counter to this string.'};
matlabbatch{11}.menu_cfg{1}.menu_entry{1}.conf_entry.def = [];
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.type = 'cfg_files';
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.name = 'Batch Directory';
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.tag = 'outdir';
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.filter = 'dir';
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.ufilter = '.*';
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.dir = '';
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.num = [1 1];
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.check = [];
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.help = {'The generated batches will be saved into this folder.'};
matlabbatch{12}.menu_cfg{1}.menu_entry{1}.conf_files.def = [];
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.type = 'cfg_branch';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.name = 'Save';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.tag = 'savejobs';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{1}(1) = cfg_dep;
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{1}(1).tname = 'Val Item';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{1}(1).tgt_spec = {};
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{1}(1).sname = 'Batch Filename Stub (cfg_entry)';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{1}(1).src_exbranch = substruct('.','val', '{}',{11}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{2}(1) = cfg_dep;
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{2}(1).tname = 'Val Item';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{2}(1).tgt_spec = {};
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{2}(1).sname = 'Batch Directory (cfg_files)';
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{2}(1).src_exbranch = substruct('.','val', '{}',{12}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.check = [];
matlabbatch{13}.menu_cfg{1}.menu_struct{1}.conf_branch.help = {'Specify filename stub and output directory to save the generated files.'};
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.type = 'cfg_choice';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.name = 'Save Generated Batch Jobs';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.tag = 'save';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{1}(1) = cfg_dep;
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{1}(1).tname = 'Values Item';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{1}(1).tgt_spec = {};
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{1}(1).sname = 'Save (cfg_branch)';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{1}(1).src_exbranch = substruct('.','val', '{}',{13}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{1}(1).src_output = substruct('()',{1});
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{2}(1) = cfg_dep;
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{2}(1).tname = 'Values Item';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{2}(1).tgt_spec = {};
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{2}(1).sname = 'Don''t Save (cfg_const)';
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{2}(1).src_exbranch = substruct('.','val', '{}',{10}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.values{2}(1).src_output = substruct('()',{1});
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.check = [];
matlabbatch{14}.menu_cfg{1}.menu_struct{1}.conf_choice.help = {'The generated batch jobs can be saved for reference or debugging purposes.'};
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.type = 'cfg_menu';
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.name = 'Missing Inputs';
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.tag = 'missing';
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.labels = {
                                                              'Skip jobs with missing inputs, run filled jobs'
                                                              'Don''t run any jobs if missing inputs'
}';
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.values = {
                                                              'skip'
                                                              'error'
}';
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.check = [];
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.help = {'Jobs with missing inputs (e.g. because of wrong input contents) can be skipped, while filled jobs are run. Alternatively, if any job has missing inputs, no jobs are run.'};
matlabbatch{15}.menu_cfg{1}.menu_entry{1}.conf_menu.def = [];
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.type = 'cfg_exbranch';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.name = 'Run Batch Jobs';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.tag = 'runjobs';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{1}(1) = cfg_dep;
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{1}(1).tname = 'Val Item';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{1}(1).tgt_spec = {};
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{1}(1).sname = 'Job File(s) (cfg_files)';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{1}(1).src_exbranch = substruct('.','val', '{}',{9}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{1}(1).src_output = substruct('()',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{2}(1) = cfg_dep;
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{2}(1).tname = 'Val Item';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{2}(1).tgt_spec = {};
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{2}(1).sname = 'Runs (cfg_repeat)';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{2}(1).src_exbranch = substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{2}(1).src_output = substruct('()',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{3}(1) = cfg_dep;
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{3}(1).tname = 'Val Item';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{3}(1).tgt_spec = {};
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{3}(1).sname = 'Save Generated Batch Jobs (cfg_choice)';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{3}(1).src_exbranch = substruct('.','val', '{}',{14}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{3}(1).src_output = substruct('()',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{4}(1) = cfg_dep;
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{4}(1).tname = 'Val Item';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{4}(1).tgt_spec = {};
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{4}(1).sname = 'Missing Inputs (cfg_menu)';
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{4}(1).src_exbranch = substruct('.','val', '{}',{15}, '.','val', '{}',{1}, '.','val', '{}',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.val{4}(1).src_output = substruct('()',{1});
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.prog = @cfg_run_runjobs;
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.vout = @cfg_vout_runjobs;
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.check = [];
matlabbatch{16}.menu_cfg{1}.menu_struct{1}.conf_exbranch.help = {'Load a set of job files, fill missing inputs and run the filled job. This automates the creation and execution of batch jobs for a large number of identical computations.'};
