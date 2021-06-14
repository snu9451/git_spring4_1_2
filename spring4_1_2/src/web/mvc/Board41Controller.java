package web.mvc;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
import com.util.HashMapBinder;

// deprecated: 향후에 지원하지 않겠다.
public class Board41Controller extends MultiActionController {
//	<bean id="board-controller">
//		<property name="setter의 이름인 boardLogic">
	// 직접 인스턴스화 하지 않고 Spring의 지원을 받을 것이므로 null로 둔다.
	// setter 객체 주입법으로 주입받을 수 있다. (게으른 객체주입)
	private Board41Logic	boardLogic	= null;
	Logger					logger		= Logger.getLogger(Board41Controller.class);

	public void setBoardLogic(Board41Logic boardLogic) {
		this.boardLogic = boardLogic;
	}

	// request로 유지
	// 파라미터에 req, res가 없어도 괜찮은가? -- 메소드를 찾지 못하는듯?
	public ModelAndView getBoardList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("getBoardList 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> boardList = null;
		boardList = boardLogic.getBoardList(target);
		logger.info("boardList:"+boardList);
//		boardList = new ArrayList<>();
//		Map<String, Object> rmap = new HashMap<>();
//		rmap.put("mem_id", "tomato");
//		rmap.put("mem_pw", "123");
//		rmap.put("mem_name", "이순신");
//		boardList.add(rmap);
//		rmap = new HashMap<>();
//		rmap.put("mem_id", "apple");
//		rmap.put("mem_pw", "124");
//		rmap.put("mem_name", "강감찬");
//		boardList.add(rmap);
//		rmap = new HashMap<>();
//		rmap.put("mem_id", "orange");
//		rmap.put("mem_pw", "125");
//		rmap.put("mem_name", "김유신");
//		boardList.add(rmap);
//		Gson	g		= new Gson();
//		String	imsi	= g.toJson(boardList);
		// 예를 들어 회원의 이름과 전화번호로 검색을 할 수 있음
//		boardLogic.getBoardList(target); // WHERE bm_no=? AND bm_title LIKE '%'||?||'%'
		ModelAndView	mav		= new ModelAndView();
//		String			name	= "이순신";
		mav.setViewName("board/getBoardList");
//		mav.addObject("name", name);
		mav.addObject("boardList", boardList);		
//		HttpSession session = req.getSession();
//		session.setAttribute("name", name);
//		RequestDispatcher view = req.getRequestDispatcher("getBoardList.jsp");
//		view.forward(req, res);
		return mav;
	/*************************************************************************
	 * 게시글 상세보기 구현
	 * @param req
	 * @param res
	 * @return ModelAndView
	 * @throws Exception
	 * 주의사항: 전체조회와 하나로 합쳐지므로, target에 구분값을 추가할 것.
	 */
	public ModelAndView getBoardDetail(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		logger.info("getBoardDetail 호출 성공");
		HashMapBinder		hmb		= new HashMapBinder(req);
		Map<String, Object>	target	= new HashMap<>();
		hmb.bind(target);
		target.put("gubun", "detail");
		// 테스트
//		target.put("bm_no", 100); // 테스트 성공! => 이렇게 하지 않고 GET 방식으로 테스트 해도 좋음
		List<Map<String, Object>> boardDetail = null;
		boardDetail = boardLogic.getBoardList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/read");
		logger.info("boardDetail:"+boardDetail);
		mav.addObject("boardDetail",boardDetail);
		return mav;
	}
	public void boardInsert(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		logger.info("boardInsert 호출 성공");
		HashMapBinder hmb = new HashMapBinder(req);
		logger.info("============================> "+req);
		Map<String, Object> pmap = new HashMap<>();
		// 사용자가 입력한 값 또는 서버에서 클라이언트에게 요청한 값을 넘김
		hmb.bind(pmap);
		logger.info("============================> "+pmap);
		// MN: 단위테스트 - 사용자로부터 받은 값이라 치자.
//		pmap.put("bm_no",48);
//      pmap.put("bm_title","제목");
//      pmap.put("bm_writer","나다");
//	    pmap.put("bm_email","safs@nanaa.com");
//	    pmap.put("bm_content","야야아앙이ㅓ리ㅏ너");
//	    pmap.put("bm_hit",777);
//	    pmap.put("bm_group",5);
//	    pmap.put("bm_pos",4);
//	    pmap.put("bm_step",3);
//	    pmap.put("bm_pw","asdff");
		// ▲ MN: request 객체에 담겨 있는 값을 (그릇 역할을 해줄) pmap에 옮겨 담는다.
		int result = 0;
		result = boardLogic.boardInsert(pmap);
		if(result == 1){
			// MN: 입력(insert) 결과가 성공인 경우, 곧바로 sp4로 서블릿을 타서 전체 조회를 실행해준다.
			res.sendRedirect("./getBoardList.sp4");
		}
		else {
			res.sendRedirect("./boardInsertFail.jsp");
		}
	}
	
	// json으로 내보내준다. - @RestController: (only) String, @Controller: void,
	// Return Type: ModelAndView, String...
//	public void jsonGetBoardList() {
	// SPRING을 사용하지 않는다면 요청객체와 응답객체를 파라미터로 받아와야 함.
//	public String jsonGetBoardList(HttpServletRequest req, HttpServletResponse res) throws Exception {
	public void jsonGetBoardList(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("jsonGetBoardList 호출 성공");
		List<Map<String, Object>> boardList = null;
//		rmap.put("mem_id", "tomato");
//		rmap.put("mem_pw", "123");
//		rmap.put("mem_name", "이순신");
//		boardList.add(rmap);
//		rmap = new HashMap<>();
//		rmap.put("mem_id", "apple");
//		rmap.put("mem_pw", "124");
//		rmap.put("mem_name", "강감찬");
//		boardList.add(rmap);
//		rmap = new HashMap<>();
//		rmap.put("mem_id", "orange");
//		rmap.put("mem_pw", "125"); 
//		rmap.put("mem_name", "김유신");
//		boardList.add(rmap);
		Gson	g		= new Gson(); 
		boardList = boardLogic.getBoardList(null);
		String	imsi	= g.toJson(boardList);  
//		return imsi;
		// 마임타입과 인코딩(캐릭터셋)을 지정
		res.setContentType("application/json;charset=UTF-8");
		PrintWriter out = res.getWriter();
		// 특별히 페이지를 설정하지 않았음..
		out.print(imsi);
//		req.setAttribute("imsi", imsi);
	}

}
