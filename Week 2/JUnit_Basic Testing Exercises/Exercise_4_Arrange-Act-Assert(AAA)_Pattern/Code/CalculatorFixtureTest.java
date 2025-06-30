package settingup.junit;

import static org.junit.Assert.*;
import org.junit.Before;
import org.junit.After;
import org.junit.Test;

public class CalculatorFixtureTest {

	 private Calculator calc;

	    // 🔧 Setup method – runs before every test
	    @Before
	    public void setUp() {
	        System.out.println("Setting up Calculator...");
	        calc = new Calculator(); // Arrange
	    }

	    // 🧹 Teardown method – runs after every test
	    @After
	    public void tearDown() {
	        System.out.println("Cleaning up Calculator...");
	        calc = null; // Optional
	    }

	    @Test
	    public void testAddition() {
	        // Act
	        int result = calc.add(10, 5);

	        // Assert
	        assertEquals(15, result);
	    }

	    @Test
	    public void testSubtraction() {
	        // Act
	        int result = calc.subtract(10, 5);

	        // Assert
	        assertEquals(5, result);
	    }

}
