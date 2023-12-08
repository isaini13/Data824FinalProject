# Data824FinalProject

# Kansas Counties Data Visualization Shiny App

## Overview
This repository contains a Shiny application for visualizing and analyzing data from Kansas counties. The app includes interactive features such as maps, area charts, timelines, and comparative analysis, offering insights into various attributes like county area, seat, establishment year, and more.

## Features
- **Interactive Map**: Displays geographical insights using Leaflet.
- **Area Chart**: Shows the area of each county with sorting options.
- **Timeline**: Visualizes the establishment of counties over time.
- **Comparative Analysis**: Compares different counties based on selected metrics.

## Data Source
The dataset includes information about the counties in Kansas, such as names, county seats, establishment years, and areas.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
- R
- RStudio
- Required R packages: `shiny`, `leaflet`, `ggplot2`, `DT`, `readxl`, `sf` (if geographical data is used)

### Installing
1. Clone the repository to your local machine.
2. Open the project in RStudio.
3. Install the required R packages using the following commands:
   ```R
   install.packages(c("shiny", "leaflet", "ggplot2", "DT", "readxl", "sf"))
   ```
4. Run the app from RStudio.

## Usage
Navigate through the tabs to explore different visualizations. Select counties or variables of interest in the comparative analysis.


## Authors
- **Ishpreet Saini** - [isaini13](https://github.com/isaini13)

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
