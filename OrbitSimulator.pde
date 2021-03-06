import processing.core.*;
import controlP5.*;

// global variables
// ------------------------------------------------------------------

/** The gravitational constant. */
float gravitationalConstant = 1.0f;

/** The simulation time step. */
float timeStep = .1f;

/** The mass of the fixed body. */
float b1Mass = 50000f;

/** The radius of the fixed body. */
int b1Radius;

/** The radius of the satellite. */
int b2Radius;

/** The recalculate. */
boolean startStop = false, recalculate = false;

/** The font. */
PFont font;

/** temp vector object for misc calculations. */
PVector temp = new PVector();

/** The position of the satellite. */
Slider2D b2Position;

/** The velocity of the satellite. */
Slider2D b2Velocity;

/** The cp5 object for the ui. */
ControlP5 cp5;

/** The fixed body. */
Body b1;

/** The satellite body. */
Body b2;

/** The orbit. */
Orbit orbit;

/** The ui. */
UI ui;

// App Core
// --------------------------------------------------------------------------

/*
 * (non-Javadoc)
 * @see processing.core.PApplet#settings()
 */
public void settings()
{
  fullScreen(P2D, 2);
  smooth(0);
}

/*
 * (non-Javadoc)
 * @see processing.core.PApplet#setup()
 */
public void setup()
{
  // setup screen and graphics
  orientation(LANDSCAPE);
  background(255);

  // create orbital bodies
  b1 = new Body(new PVector(.5f * displayWidth, .5f * displayHeight), new PVector(0, 0, 0), new PVector(0, 0, 0),
      50000.0f, displayWidth / 150, new int[] { 0, 255, 0 }, new int[] { 0, 0, 0 });
  b2 = new Body(new PVector(.6f * displayWidth, 0.5f * displayHeight - 50),
      new PVector(displayWidth / 100, displayWidth / 100, 0), new PVector(0, 0, 0), 1.0f, displayWidth / 150,
      new int[] { 255, 0, 0 }, new int[] { 0, 0, 0 });

  // create orbit
  orbit = new Orbit(b1, b2);

  // initialize ui
  cp5 = new ControlP5(this);
  Label.setUpperCaseDefault(false);
  font = createFont("Arial", 18, true);
  ui = new UI();
}

/*
 * (non-Javadoc)
 * @see processing.core.PApplet#draw()
 */
// run app
public void draw()
{
  // refresh screen
  background(255);

  // simulate or change the orbit
  if (startStop)
    updateOrbit();
  else
    updateOrbitalStateValues();

  // draw the orbit
  orbit.draw();

  // overlay orbit info
  ui.draw();

  // update simulation run-time characteristics
  updateRunTimeValues();
}

/**
 * Control event.
 * @param e the e
 */
void controlEvent(ControlEvent e)
{
  if (ui != null)
    ui.correctSliderDisplayValues();
}

// Helper Methods
// ---------------------------------------------------

/**
 * Update run time values.
 */
void updateRunTimeValues()
{
  b1.radius = b1Radius;
  b2.radius = b2Radius;
}

/**
 * Update orbital state values.
 */
void updateOrbitalStateValues()
{
  b1.mass = b1Mass * 1000;
  b2.position.set(b2Position.getArrayValue()[0], b2Position.getArrayValue()[1]);
  b2.velocity.set(b2Velocity.getArrayValue()[0], b2Velocity.getArrayValue()[1]);
  if (recalculate)
  {
    orbit.calculateInitialOrbitalElements();
    ui.generateConstantOrbitData();
  }
}

/**
 * Update orbit.
 */
void updateOrbit()
{
  orbit.update(timeStep, 5);
  b2Position.setValue(b2.position.x, b2.position.y);
  b2Velocity.setValue(b2.velocity.x, b2.velocity.y);
}