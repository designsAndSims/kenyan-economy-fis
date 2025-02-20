
# Kenyan Economy Crisis FIS

> *What if you could capture the unpredictable pulse of a nation’s economy with a simple, interactive tool?*  
> This project leverages fuzzy logic to model the crisis risk in the Kenyan economy—a country where economic growth and default risk interact dynamically. With an intuitive UI and real-time visualizations, explore how shifts in key economic indicators trigger warning signals and reshape fiscal landscapes.

## Overview

This project implements a Fuzzy Inference System (FIS) using Gaussian membership functions for smoother transitions. The FIS evaluates crisis risk based on two factors:  
- **Risk of Default**  
- **Economic Growth**

Users can interact with the system via sliders and view real-time updates on output risk levels and membership function plots.

## Features

- **Gaussian Membership Functions:**  
  Capture gradual transitions and model uncertainty using smooth, data-driven curves.
- **Interactive UI:**  
  Real-time feedback via sliders, membership function plots, and a 3D surface visualization.
- **Modular and Extensible:**  
  Easily adjust FIS rules and parameters to suit additional data or evolving scenarios.

## Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/designsAndSims/kenyan-economy-fis.git
   cd kenyan-economy-fis
   ```

2. **Open in MATLAB:**  
   Open the main project file `kenyanEconomyFuzzyLogic.m` in MATLAB.

3. **Run the Program:**  
   In MATLAB’s command window, type:
   ```matlab
   kenyanEconomyFuzzyLogic
   ```

## Usage

- **Adjust Inputs:**  
  Use the sliders to modify “Risk of Default” and “Economic Growth.”
- **View Membership Functions:**  
  The UI displays Gaussian curves for both inputs.
- **Explore the Surface Plot:**  
  See how various input combinations map to crisis risk.
- **Real-Time Output:**  
  The output panel updates with the calculated crisis risk and its corresponding qualitative level (Low, Medium, High).

## Screenshots

<!-- Replace with actual images -->
![UI Screenshot](images/ui_screenshot.png)
![Membership Functions Plot](images/mf_plot.png)
![3D Surface Visualization](images/3d_surface.png)

## Project Structure

```
kenyan-economy-fis/
├── README.md           # Project overview and instructions
├── kenyanEconomyFuzzyLogic.m   # Main MATLAB function implementing the FIS and UI
└── images/             # Folder for images and screenshots
```

## Contributing

Contributions are welcome! Please submit issues or pull requests for improvements and bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, please reach out at designsandsimulations@gmail.com.


*Empower decision-makers to navigate economic uncertainties using the power of fuzzy logic!*
```
