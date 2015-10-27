#---------------------------------------------------------------------------------
# Author: Jeremiah Rounds
# Email: jeremiah.rounds@pnnl.gov
# Time:  Fri Oct 23 10:16:33 2015
#---------------------------------------------------------------------------------


copyDisplay = function(old_name, new_name, group="common", conn = getOption("vdbConn"), verbose=TRUE){
	validateVdbConn(conn)
	#validateNameGroup(new_name, group)  #<--- don't work because validateNameGroup is a macro like funciton with side-effect assignment instead of a return.
	#validateNameGroup(old_name, group)
	old_path_info = trelliscope:::validateNameGroup2(old_name, group)
	new_path_info = trelliscope:::validateNameGroup2(new_name, group)
	vdbPrefix <- conn$path
	old_path = file.path(vdbPrefix, "displays",old_path_info$group, old_path_info$name)
	new_path = file.path(vdbPrefix, "displays",new_path_info$group, new_path_info$name)
    checkDisplayPath(new_path, verbose)
	copyVerify = trelliscope:::copy_dir(old_path, new_path)
	   # Verify the file renaming
    if(!copyVerify) {
      stop("Copy files for display were not successfully moved to '", new_path, "'", call. = FALSE)
    } 

  		save(displayObj,file = file.path(vdbPrefix, "displays", disp$group, disp$name, "displayObj.Rdata"))


	display_path = file.path(new_path, "displayObj.Rdata")
	e = new.env()
	load(display_path, envir=e)
	e$displayObj$name = new_name 
	#there is some renaming here because copy and paste from other snippets
	displayObj = e$displayObj
	save(displayObj, file = display_path)
	disp = displayObj
	updateDisplayList(list(
		group = disp$group,
		name = disp$name,
		desc = disp$desc,
		n = disp$n,
		panelFnType = disp$panelFnType,
		preRender = disp$preRender,
		dataClass = tail(class(disp$panelDataSource), 1),
		cogClass = class(disp$cogDatConn)[1],
		height = disp$height,
		width = disp$width,
		updated = Sys.time(),
		keySig = disp$keySig
	), conn)

}