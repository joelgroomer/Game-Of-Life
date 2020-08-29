# Joel's Game of Life

Welcome to my implementation of John Conway's "Game of Life" simulation. I built this for my Computer Science Build Week 1 project at [Lambda School](https://www.lambdaschool.com). The original repo with instructions can be found [here](https://github.com/LambdaSchool/CS-Build-Week-1).

## Tech stack
I was in (I believe) the last part-time iOS track to *not* learn SwiftUI at all, so I took this opportunity to teach it to myself. I ended up using the beta version for this project.

* Xcode 12 beta 5
* Swift 5
* SwiftUI 2 beta

## Running the app
Because I'm using beta software, I was not able to upload this project to Testflight. If you want to run it, you're welcome to clone the repo and build it locally. Once iOS 14 is released, I will put this on Testflight and provide a link here.

## Screenshots
Coming this weekend.

## Features implemented
Out of the list of features suggested, I implemented the following:
* Grid to display cells.
* Cell objects or components that, at a minimum, should have:
  - Properties
    - current state: (alive, dead), (black, white)
  - Clickable/Tappable:
    - can be clicked to allow user to setup initial cell configuration
    - should NOT be clickable while simulation is running
  - Behaviors
    - Toggle state functionality: switch between alive & dead either because user manually toggled cell before starting simulation or simulation is running and rules of life caused cell to change state
* An appropriate data structure to hold a grid of cells that is at least 25x25. Go as big as you want.
* Text to display current generation # being displayed
* Utilize a timeout function to build the next generation of cells & update the display at the chosen time interval
* Button(s) that start & stop the animation
* Button to clear the grid
Write an algorithm that:
* Implements the following basic steps:
  - For each cell in the current generation's grid:
    - Examine state of all eight neighbors (it's up to you whether you want cells to wrap around the grid and consider cells on the other side or not)
    - Apply rules of life to determine if this cell will change states
    - When main loop completes:
      - Swap current and next grids
      - Repeat until simulation stopped
* Breaks down above steps into appropriate sub-tasks implemented with helper functions to improve readability
* Uses double buffering to update grid with next generation.
* Does something well-documented with the edge of the grid. (e.g. wrap around to the far side--most fun!--or assumes all edge cells are permanently dead.)

Custom features implemented from the suggested list:
* Create a few sample cell configurations that users can load and run
  - _Only two for now, but I'll add more
* ~Add an option that creates a random cell configuration that users can run~ 
  - _This will be implemented before Monday_
* Add additional cell properties, like color or size, and incorporate them into your visualization
  - _Enabled the user to choose their desired cell shape from a set of options_
* Allow users to specify the speed of the simulation
  - _Speed slider appears below the grid_
* ~Provide functionality to manually step through the simulation one generation at a time, as opposed to animating automatically~
* Allow users to change the dimension of the grid being displayed
  - _The Options menu allows the user to update the grid size dynamically_

Additional features implemented:
* The user can zoom in and out on the grid
* The grid is in a scrollable field (tap and drag)

Behind-the-scenes features:
* New board presets can be added very simply
  1. Extend the CAGrid class and override the `reset` function
    - In the reset function, describe how to set the board
    - Make sure to send the `"gridupdate"` notification when the reset is complete
  2. Add it to the `CAGridController` class
    - Add a title to the `presets` array
    - Add a case within the switch in the `changeGrid` method
* Cell shapes can be defined by adding a `Shape` to the `shapes` array in `OptionsView`
  - Shapes can either be
    - System images from Apple's system image set
    - Images stored in the app's Assets
    - Pairs of emoji
