package web.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class Board41Logic {

	Logger logger = Logger.getLogger(Board41Logic.class);
	private Board41MDao bmDao = null;
	private Board41SDao bsDao = null;
	
	public List<Map<String, Object>> getBoardList(Map<String, Object> pmap) {
		logger.info("getBoardList 호출 성공");
		List<Map<String, Object>> boardList = null;
		String gubun = pmap.get("gubun").toString();
		if(gubun!=null && "detail".equals(gubun)) {
			
		}
		boardList = bmDao.getBoardList(pmap);
		return boardList;
	}

	// 정수를 반환함. 처리 실패 혹은 성공으로 나뉘므로...
	public int boardInsert(Map<String, Object> pmap) {
		logger.info("boardInsert 호출 성공");
		int result = 0;
		int fileOk = 0;
		logger.info("#########################"+pmap);
		result = bmDao.boardMInsert(pmap);
		// 첨부파일이 있어?
		if(pmap.containsKey("bs_file")) {
			fileOk = bsDao.boardSInsert(pmap);
		}
		return result;
	}
	
	public void setBmDao(Board41MDao bmDao) {
		this.bmDao = bmDao;
	}

	public void setBsDao(Board41SDao bsDao) {
		this.bsDao = bsDao;
	}
	
}
