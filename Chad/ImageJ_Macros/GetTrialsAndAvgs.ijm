//Create and save trial mean projection and trial stack

importvar = "open=D:/Drew/24.03.12_1210/24.03.12_1210_000";
filevar = replace(importvar, "open=", "");
firsttrial = 11; //File number of first trial
lasttrial = 11; //File number of last trial

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
	close(); //Then close red channel
	title_de = getTitle();
	run("Deinterleave", "how=19"); //Deinterleave volume slices (17 of data, 2 blanks)
	
	for (j=1; j<=19; j = j+1) {
		//if ((j==1) || (j==2) || (j==3) || (j==4)) {
		if (j<=14) { //set this if statement to include the analyzable files
			
			//Select window
			newtitle = title_de+" #"+j;
			selectWindow(newtitle);
			
			//Cropping out autofluorescent stuff that disrupts registration (LEFT OVER FROM PATCHWARP VERSION)
//			makeRectangle(0, 0, 302, 256);
//			run("Crop");
			
			//Get mean projection then filter and save
			run("Z Project...", "projection=[Average Intensity]");
			run("Median...", "radius=1");
			resetMinAndMax();
			run("Enhance Contrast", "saturated=0.35");
			saveAs("Tiff", filevar+trial+"_"+j+"_"+"AVG.tif");
			close();

			//Get max projection then filter and save (LEFT OVER FROM PATCHWARP VERSION)
//			run("Z Project...", "projection=[Max Intensity]");
//			run("Median...", "radius=1");
//			resetMinAndMax();
//			run("Enhance Contrast", "saturated=0.35");
//			saveAs("Tiff", filevar+trial+"_"+j+"_"+"MAX.tif");
//			close();
			
			//Save stack then close window
			selectWindow(newtitle);
			saveAs("Tiff", filevar+trial+"_"+j+".tif");
			close();
			
		} else {
			//Select and close window
			newtitle = title_de+" #"+j;
			selectWindow(newtitle);
			close();
		}
	}
}