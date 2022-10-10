public class Example1 {
    public native int intMethodName(final int n);
    public native boolean booleanMethodName(final boolean b);
    public native String stringMethodName(final String text);
    public native int intArrayMethodName(final int[] intArray);

    public static void main(final String[] args){
        
        System.loadLibrary("Example1");
        Example1 example = new Example1();
        int square = example.intMethodName(5);
        boolean bool = example.booleanMethodName(true);
        String text = example.stringMethodName("java");
        int sum = example.intArrayMethodName(new int[]{1,1,2,3,5,8,13});

        System.out.println("intMethodName(5): " + square);
        System.out.println("booleanMethodName(true): " + bool);
        System.out.println("stringMethodName(\"java\"): " + text);
        System.out.println("intArrayMethodName(new int[]{1,1,2,3,5,8,13}): " + sum);
    }
}