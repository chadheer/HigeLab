//Generate stacks of slice trial means for ROI selection and slice trial stacks for further analysis
//May need to change importvar, firsttrial, lasttrial, checkSlice, and framesPerTrial

//Input suite2p folder for session
importvar = "open=F:/Chad/UPWIN/07302024/fly000/ACV_left/tiffs/suite2p/";
filevar = replace(importvar, "open=", "");
firsttrial = 1; //File number of first trial
lasttrial = 3; //File number of last trial
firstplane = 1;
lastplane = 5;
checkSlice = 3; //Slice to create analyzable stack of
framesPerTrial = 226; //For making trial means stack

//Insert name(s) of file(s) that were registered using ApplyMoCo.ijm; array must always start with 0



for (k = firstplane; k<= lastplane; k = k+1){
	plane_number = k-1;
	plane = "plane" + plane_number;
	
	count = 0;
	for (i=firsttrial; i<=lasttrial; i = i+1) {
		count = count + 1;
		x = i-1;
		frame_n = x * framesPerTrial;
		if (i == 1) {
			trial = "file00000_chan0";
		}
		else {
			trial = "file00"+frame_n+"_chan0";
		}
	
		run("Bio-Formats Importer", importvar+plane+"/reg_tif/"+trial+".tif"); //Open each trial's raw data file	
		//run("Deinterleave", "how=2"); //Deinterleave green and red channels
		//red_channel = filevar+trial+".tif #1";
		//selectWindow(red_channel);
		//close(); //Then close red channel
		title_de = getTitle();
		//run("Deinterleave", "how="+slicesPerVol); //Deinterleave volume slices (17 of data, 2 blanks)

		if (count == 1){
			rename("firstImage");
		}
		//concatonate trial with previous trial
		if (count == 2) {
			rename("secondImage");
			
			//Concatenate the two
			run("Concatenate...", " image1=firstImage image2=secondImage");
		}

		//Keep only Slice open of each subsequent trial
		if (count >= 3) {
			rename("secondImage");
		//Concatenate the two
		run("Concatenate...", " image1=Untitled image2=secondImage");
		}

		
	}
	run("Enhance Contrast", "saturated=0.35");
	saveAs("Tiff", filevar+plane+".tif");
		
	run("Grouped Z Project...", "projection=[Average Intensity] group="+framesPerTrial);
	saveAs("Tiff", filevar+plane+"AVG.tif");
		

}



