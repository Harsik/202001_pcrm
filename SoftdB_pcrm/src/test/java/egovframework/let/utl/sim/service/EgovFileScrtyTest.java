package egovframework.let.utl.sim.service;

public class EgovFileScrtyTest {

	public static void main(String[] args) {
		EgovFileScrty scrty = new EgovFileScrty();
		try {
			String result1 = scrty.encryptPassword("password", "id1");
			System.out.println(">> result1 : " + result1);
			
			String result2 = scrty.encryptPassword("password", "id2");
			System.out.println(">> result2 : " + result2);
			
			String result3 = scrty.encryptPassword("1", "admin");
			System.out.println(">> result3 : " + result3);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
