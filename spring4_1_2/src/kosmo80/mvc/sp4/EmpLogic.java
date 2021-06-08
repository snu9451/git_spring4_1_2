package kosmo80.mvc.sp4;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

// 순수해야 함. 상속 받거나 하지 X. 할 일이 딱 정해져 있다. 순수한 자바.
public class EmpLogic {
	Logger logger = Logger.getLogger(EmpLogic.class);
	public List<Map<String, Object>> getEmpList() {
		logger.info("getEmpList 호출 성공");
		return null;	// '없다'라기 보다는 '모른다'에 가까움. JAVA언어는 null에 대해 안전(safe)하지 않음.
	}
}
