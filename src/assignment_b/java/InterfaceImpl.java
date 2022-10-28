public class InterfaceImpl implements Interface {

    @Override
    public int intMethodName(final int n) {
        return n * n;
    }

    @Override
    public boolean booleanMethodName(final boolean b) {
        return !b;
    }

    @Override
    public String stringMethodName(final String text) {
        return text.toUpperCase();
    }

    @Override
    public int intArrayMethodName(final int[] intArray) {
        int sum = 0;
        for( int i = 0; i < intArray.length; i++){
            sum += intArray[i];
        }
        return sum;
    }
    
}
