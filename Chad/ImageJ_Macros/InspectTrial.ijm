//Pick analyzable trials and analyzable slices
//May need to change importvar, firsttrial, lasttrial, and checkSlice

importvar = "open=F:/Chad/UPWIN/05212024/fly000/session1/tiffs/file_000";
filevar = replace(importvar, "open=", "");
firsttrial = 2; //File number of first trial
lasttrial = 17; //File number of last trial
checkSlice = 3; //Using Slice 9 as the basis of comparison

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
	run("Deinterleave", "how=6"); //Deinterleave volume slices (17 of data, 2 blanks)
	
	//Keep only Slice (checkSlice) open
	if (count == 1) {
		for (j=1; j<=6; j = j+1) {
			if (j == checkSlice) {
				newtitle = title_de+" #"+j;
				selectWindow(newtitle);
				title1 = getTitle();
			} else {
				newtitle = title_de+" #"+j;
				selectWindow(newtitle);
				close();
			}
		}
	}
	//Keep only Slice 9 open of the next trial
	if (count == 2) {
		for (j=1; j<=6; j = j+1) {
			if (j == checkSlice) {
				newtitle = title_de+" #"+j;
				selectWindow(newtitle);
				title2 = getTitle();
			} else {
				newtitle = title_de+" #"+j;
				selectWindow(newtitle);
				close();
			}
		}
		
		//Concatenate the two
		selectWindow(title1);
		rename("firstImage");
		selectWindow(title2);
		rename("secondImage");
		run("Concatenate...", " image1=firstImage image2=secondImage");
	}
	
	//Keep only Slice 9 open of each subsequent trial
	if (count >= 3) {
		for (j=1; j<=6; j = j+1) {
			if (j == checkSlice) {
				newtitle = title_de+" #"+j;
				selectWindow(newtitle);
				title2 = getTitle();
			} else {
				newtitle = title_de+" #"+j;
				selectWindow(newtitle);
				close();
			}
		}
		
		//Concatenate the two
		selectWindow(title2);
		rename("secondImage");
		run("Concatenate...", " image1=Untitled image2=secondImage");
	}
}