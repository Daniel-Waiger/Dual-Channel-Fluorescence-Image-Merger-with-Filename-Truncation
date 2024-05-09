# Dual-Channel Fluorescence Image Merger

This ImageJ macro merges paired fluorescence images from FDA and PI (Green and Red) channels, modifies filenames by truncating the first four characters, and logs each step of the process.

## Background

Developed by Daniel Waiger from the Bio-imaging & Flow Cytometry Core Facility at The Robert H. Smith – Faculty of Agriculture, Food and Environment of the Hebrew University of Jerusalem. This tool is designed to facilitate the analysis of dual-channel fluorescence images by automating the merging process.

## Installation

1. Ensure you have [ImageJ](https://fiji.sc) installed.
2. Download the macro file from this repository.
3. Open ImageJ, navigate to `Plugins > Macros > Run Macro`, and select the downloaded file.

## Usage

### Running the Macro

1. **Start the Macro**: Run the macro in ImageJ.
2. **Select the Directory**: A dialog will prompt you to choose the directory containing your `.TIF` files.

### What Happens Next: Step-by-Step Process

1. **File Listing**: The macro lists all `.TIF` files in the selected directory and logs each filename.
   <p align="center">
     <img src="https://github.com/Daniel-Waiger/Dual-Channel-Fluorescence-Image-Merger-with-Filename-Truncation/blob/main/snapshots/log.png" width="75%" alt="Sample Image Listing"/>
   </p>

2. **File Sorting**: It sorts files into two lists based on their suffix:
   - `d1.TIF` for FDA images
     <p align="center">
       <img src="https://github.com/Daniel-Waiger/Dual-Channel-Fluorescence-Image-Merger-with-Filename-Truncation/blob/main/snapshots/FDA.png" width="75%" alt="Sample FDA Image"/>
     </p>
   - `d2.TIF` for PI images
     <p align="center">
       <img src="https://github.com/Daniel-Waiger/Dual-Channel-Fluorescence-Image-Merger-with-Filename-Truncation/blob/main/snapshots/PI.png" width="75%" alt="Sample PI Image"/>
     </p>

3. **Log Output**: Both lists (GFP and RFP) are printed in the ImageJ log window for verification.

4. **Error Checking**: The macro checks if both lists have the same number of images. If not, it displays an error message and stops execution.

5. **Image Processing**:
   - For each pair of images (GFP and RFP), the macro opens both files.
   - It removes the first four characters from the GFP filename.
   - It merges the GFP and RFP images into one multi-channel image.
     <p align="center">
       <img src="https://github.com/Daniel-Waiger/Dual-Channel-Fluorescence-Image-Merger-with-Filename-Truncation/blob/main/snapshots/Merged.png" width="75%" alt="Sample Merged Image"/>
     </p>

6. **Saving the Merged Image**: The merged image is saved in the same directory with 'Merged_' prefixed to the modified filename.
   - At the end, the user gets a final message.
     <p align="center">
       <img src="https://github.com/Daniel-Waiger/Dual-Channel-Fluorescence-Image-Merger-with-Filename-Truncation/blob/main/snapshots/finish%20mesage.png" width="50%" alt="Sample Final Message"/>
     </p>

7. **Cleanup**: After processing, all open images are closed to free up resources.

## Features

- **Auto-detection of image pairs** based on filenames.
- **Filename modification** by removing the first four characters.
- **Detailed logging** of all processed files.

## Contributing

Contributions to enhance this macro are welcome. Please fork this repository and submit a pull request with your improvements.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

- Daniel Waiger - daniel.waiger@mail.huji.ac.il
