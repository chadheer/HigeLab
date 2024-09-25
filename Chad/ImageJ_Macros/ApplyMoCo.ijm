//Run and apply motion correction, slice-by-slice

importvar = "open=F:/Chad/UPWIN/05212024/fly000/session1/tiffs/file_000";
filevar = replace(importvar, "open=", "");
firsttrial = 2; //File number of first trial
lasttrial = 17; //File number of last trial
slicesPerVol = 6;

count = 0;
for (i=firsttrial; i<=lasttrial; i = i+1) {
	count = count + 1;
	if (i < 10) {
		trial = "0" + i;
		}
		else {
			trial = "" + i;
		}
	run("Bio-Formats Importer", importvar+trial+".tif"); //Open each trial's raw data file
	
	run("Deinterleave", "how=2"); //Deinterleave green and red channels
	red_channel = filevar+trial+".tif #1";
	selectWindow(red_channel);
	close(); //Then close red channel
	title_de = getTitle();
	
	run("Duplicate...", "duplicate");
	title_dup = getTitle();
	
	selectWindow(title_de);
	run("Deinterleave", "how="+slicesPerVol); //Deinterleave volume slices (17 of data, 2 blanks)
		
	//this loop calculates the needed registration translations using images with boosted signal then saves the log
	for (j=1; j<=slicesPerVol; j = j+1) {
		if (j<=5) { //Range of j values should match rangle of slices to be corrected
			newtitle = title_de+" #"+j;
			selectWindow(newtitle);
			title1 = getTitle();
			
			//boost signal for moco
			run("Maximum 3D...", "x=1.5 y=1.5 z=1.5"); //to strengthen signal
			
			//moco works best with 8-bit, so convert
			setOption("ScaleConversions", true);
			run("8-bit");
			
			//get average for moco template
			run("Z Project...", "projection=[Average Intensity]");
			title1_avg = getTitle();
			
			//run moco and save results
			run("moco ", "value=50 downsample_value=1 template=["+title1_avg+"] stack=["+title1+"] log=[Generate log file] plot=[No plot]");
			saveAs("Results", filevar+trial+"_"+j+"_Results.csv");
			close(); //Registered stack
			close(); //Template
			close(); //Unregistered stack
			selectWindow("Results"); 
			run("Close"); //Results window
			
		} else {
			newtitle = title_de+" #"+j;
			selectWindow(newtitle);
			close();
		}
	}
	
	//this loop applies the saved log to the image then saves the corrected image
	selectWindow(title_dup);
	run("Deinterleave", "how="+slicesPerVol); //Deinterleave volume slices (17 of data, 2 blanks)
		
	for (j=1; j<=slicesPerVol; j = j+1) {
		if (j<=5) { //Range of j values should match rangle of slices to be corrected
			newtitle = title_dup+" #"+j;
			
			selectWindow(newtitle);
			title1 = getTitle();
			
			//get average for moco template; even though it's just applying the log, the plugin still needs a template image placeholder
			run("Z Project...", "projection=[Average Intensity]");
			title1_avg = getTitle();
			
			//run moco and save registered image
			targetLog = filevar+trial+"_"+j+"_Results.csv";
			run("moco ", "value=50 downsample_value=1 template=["+title1_avg+"] stack=["+title1+"] log=[Choose log file] plot=[No plot] choose="+targetLog);
			saveAs("Tiff", filevar+trial+"_"+j+"_reg.tif");
			close(); //Registered stack
			close(); //Template
			close(); //Unregistered stack
			selectWindow("Results"); 
			run("Close"); //Results window
			
		} else {
			newtitle = title_dup+" #"+j;
			selectWindow(newtitle);
			close();
		}
	}
}