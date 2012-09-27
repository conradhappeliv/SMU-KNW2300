package rxtxrobot;

/**
 * @author Chris King
 * @version 2.8
 */
public class AnalogPin
{
    private RXTXRobot parent;
    private int pinNum;
    private int pinVal;
    /**
     * Initialize AnalogPin with the pin number and the pin value.
     * @param p RXTXRobot parent object to this pin
     * @param pin Analog pin number
     * @param val Value to this analog pin
     */
    public AnalogPin(RXTXRobot p, int pin, int val)
    {
        parent = p;
        pinNum = pin;
        pinVal = val;
    }
    /**
     * Get the value of the pin,
     * @return The pin's value
     */
    public int getValue()
    {
        return pinVal;
    }
}