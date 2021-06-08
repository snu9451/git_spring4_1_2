package kosmo80.mvc.sp4;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class EmpController extends MultiActionController {
	Logger logger = Logger.getLogger(EmpController.class);
	// 인스턴스화 직접(new)하지 않는다!
	private EmpLogic empLogic = null;
	
	public EmpController() {
		System.out.println("디폴트 생성자 호출됨");
	}

	// setter 객체 주입법 코드임.
	public void setEmpLogic(EmpLogic empLogic) {
		this.empLogic = empLogic;
	}
	public ModelAndView getEmpList(HttpServletRequest req
								 , HttpServletResponse res) {
		logger.info("EmpController - getEmpList 호출 성공");
		ModelAndView mav = new ModelAndView();
		/*
		<property name="prefix" value="/WEB-INF/views/"/>
		<property name="suffix" value=".jsp"/>
		/WEB-INF/view/getEmpList.jsp
		*/
		// forward 방식에서 [유지]
		List<Map<String, Object>> empList = new ArrayList<>();
		Map<String, Object> rmap = new HashMap<>();
		rmap.put("mem_name", "이순신장군");
		empList.add(rmap);
		// 여기서 NPE(NullPointerException)이 발생하지 않는다.
//		empList = empLogic.getEmpList();
		// ModelAndView는 scope scope 속성이 request이다.
		mav.addObject("empList", empList);
		mav.setViewName("di/getEmpList");
		return mav;
		// 스프링 부트에서는 아래와 같이 씀
//		return "redirect:getEmpList.jsp";
	}
	public void empInsert(HttpServletRequest req
						, HttpServletResponse res)
	throws Exception
	{
		logger.info("empInsert 호출 성공");
		res.sendRedirect("/di/empInsertOk.jsp");
	}
	public EmpLogic getEmpLogic() {
		return empLogic;
	}
}
