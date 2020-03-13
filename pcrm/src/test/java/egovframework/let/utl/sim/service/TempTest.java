package egovframework.let.utl.sim.service;

public class TempTest {

	public static void main(String[] args) {
		String url = "http://localhost:8090/sht_webapp/monitor/MonitoringMapView.do";
		
		String[] parsed = url.split("/");
		for(int i=0; i<parsed.length; i++) {
			System.out.println("> " + parsed[i]);
		}
		
		parsed =  url.split(parsed[2]);
		System.out.println("> " + parsed[1]);
	}

}
