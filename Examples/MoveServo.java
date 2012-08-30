import rxtxrobot.*;

public class MoveServo
{
	public static void main(String[] args)
	{
		RXTXRobot r = new RXTXRobot("COM3", true); // Create object on COM3 with verbose messages on
		r.moveServo(RXTXRobot.SERVO1, 30); // Move Servo 1 to location 30
		r.moveServo(RXTXRobot.SERVO2, 170); // Move Servo 2 to location 170
		r.close();
	}
}
