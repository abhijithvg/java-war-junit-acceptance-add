package com.abhi;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class CalculatorTest {

    Calculator calc;
    int a, b;

    @BeforeClass
    public static void beforeClass() {
        System.out.println("Before Class");
    }

    @Before
    public void before() {
        System.out.println("Before Test Case");
        calc = new Calculator();
        a = 20;
        b = 5;
    }

    @Test
    public void addTest() {
        System.out.println("addTest");
        // int a = 20;
        // int b = 5;
        int result = 25;
        // Calculator calc = new Calculator();
        assertEquals(calc.add(a, b), result);
    }

    @Test
    public void subtractTest() {
        System.out.println("subtractTest");
        // int a = 20;
        // int b = 5;
        int result = 15;
        // Calculator calc = new Calculator();
        assertEquals(calc.subtract(a, b), result);
    }

    @Test
    public void multiplyTest() {
        System.out.println("multiplyTest");
        // int a = 20;
        // int b = 5;
        int result = 100;
        // Calculator calc = new Calculator();
        assertEquals(calc.multiply(a, b), result);
    }

    @Test
    public void divideTest() {
        System.out.println("divideTest");
        // int a = 20;
        // int b = 5;
        int result = 4;
        // Calculator calc = new Calculator();
        assertTrue("Denominator not equal to 0", b != 0);
        assertEquals(calc.divide(a, b), result);
    }

    @After
    public void after() {
        System.out.println("After Test Case");
    }

    @AfterClass
    public static void afterClass() {
        System.out.println("After Class");
    }

}
