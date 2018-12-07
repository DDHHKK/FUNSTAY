package net.search.Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.member.db.MemberBean;
import net.review.db.ReviewBean;
import net.review.db.ReviewDAO;
import net.search.controller.Action;
import net.search.controller.ActionForward;
import net.search.db.SearchBean;
import net.search.db.SearchDAO;



public class RoomDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RoomDetailAction execute()");
		request.setCharacterEncoding("UTF-8");
//-----------------------------------------------
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		SearchDAO bdao = new SearchDAO();
		bdao.updateReadcount(num); 
		SearchBean sc= bdao.getSearchboard(num);
		
		request.setAttribute("sc", sc);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("num", num);
		
		
//-----------------------------------------------
		ReviewDAO rdao = new ReviewDAO();
		System.out.println("1");
		int count = rdao.getReviewCount();
		System.out.println("2");
		// �븳�럹�씠吏��뿉 蹂댁뿬以� 湲��쓽 媛쒖닔
		int pageSize = 10;

		// �쁽�럹�씠吏�媛� 紐뉙럹�씠吏��씤吏� 媛��졇�삤湲�(湲곕낯 1�럹�씠吏�)
		System.out.println("3");
		if (pageNum == null)
			pageNum = "1"; // pageNum�뾾�쑝硫� 臾댁“嫄� 1�럹�씠吏�

		// �떆�옉湲� 援ы븯湲� 1 11 21 31 ... <= pageNum, pageSize 議고빀
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;

		// �걹�뻾援ы븯湲�
		int endRow = currentPage * pageSize;
		System.out.println("4");
		int home_num = 1;
		List<ReviewBean> ReviewList = null;
		if (count != 0)
			ReviewList = rdao.getReviewList(startRow, pageSize, home_num);
		
		request.setAttribute("boardList", ReviewList);
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
//-----------------------------------------------		
		
	
		ActionForward forward = new ActionForward();
		forward.setPath("./RoomDetailAction.sc");
		forward.setRedirect(false);

		return forward;
	}	
}
