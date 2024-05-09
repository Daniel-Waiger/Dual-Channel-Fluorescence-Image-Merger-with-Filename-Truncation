// This code was made by Daniel Waiger from the Bio-imaging & Flow Cytometry Core Facility
// CSI – Center for Scientific Imaging at The Robert H. Smith – Faculty of Agriculture, Food and Environment of the Hebrew University of Jerusalem
// daniel.waiger@mail.huji.ac.il
// image.sc forum: Daniel_Waiger
//
// For: [Gil Ovadia] of [Ido Braslavsky Lab] in [Biochemistry and Food Sciences].
// doi:

macro "Merge GFP and RFP Images With Filename Modification" {
    inputDir = getDirectory("Choose the Directory Containing the Images");
    list = getFileList(inputDir);
    greenList = newArray();
    redList = newArray();
    setBatchMode(false);

    // Log and separate files into green and red lists
    print("Complete File List:");
    for (i = 0; i < list.length; i++) {
        print(inputDir + list[i]); // Log the full path of each file
        if (endsWith(list[i], "d1.TIF")) {
            greenList = Array.concat(greenList, list[i]);
        } else if (endsWith(list[i], "d2.TIF")) {
            redList = Array.concat(redList, list[i]);
        }
    }

    // Print green and red lists
    print("\nGreen List (GFP):");
    for (j = 0; j < greenList.length; j++) {
        print(inputDir + greenList[j]);
    }

    print("\nRed List (RFP):");
    for (k = 0; k < redList.length; k++) {
        print(inputDir + redList[k]);
    }

    // Check if lists are equal in size
    if (greenList.length != redList.length) {
        showMessage("Error", "The number of green and red images does not match.");
        return;
    }

    // Merge corresponding images
    for (l = 0; l < greenList.length; l++) {
        open(inputDir + greenList[l]);
        // Remove the first four characters from the file name of the green image
        baseName = getTitle(); // Gets the title of the currently active image (merged image)
        modifiedName = substring(baseName, 4); // Removes the first four characters
        open(inputDir + redList[l]);
        run("Merge Channels...", "c1=[" + redList[l] + "] c2=[" + greenList[l] + "] create keep");
		wait(100);

        
        // Save the merged image with the modified filename
        saveAs("Tiff", inputDir + "Merged_" + modifiedName);

        // Close the original images
        close('*');
    }

    showMessage("Processing Complete", "All images have been merged and saved.");
}
