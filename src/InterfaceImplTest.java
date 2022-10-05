public class InterfaceImplTest {
    public static void main(String[] blub) {
        InterfaceImpl dings = new InterfaceImpl();
        System.out.println("intMethodName(5): " + dings.intMethodName(5));
        System.out.println("booleanMethodName(false): " + (dings.booleanMethodName(false) ? "true" : "false"));
        System.out.println("stringMethodName(\"tEst\"): " + dings.stringMethodName("tEst"));
        System.out.println("intArrayMethodName({1,1,2,3,5,8,13}): " + dings.intArrayMethodName(new int[]{1,1,2,3,5,8,13}));
    }
}