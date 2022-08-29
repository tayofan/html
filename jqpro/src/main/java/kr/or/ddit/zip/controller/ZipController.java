package kr.or.ddit.zip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.member.vo.ZipVO;
import kr.or.ddit.zip.service.IZipService;
import kr.or.ddit.zip.service.ZipServiceImpl;

/**
 * Servlet implementation class ZipController
 */
@WebServlet("/ZipController.do")
public class ZipController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ZipController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gubun = request.getParameter("gubun");
		//스위치문 !!!!! 대박!!!
		if(gubun.equals("1")) proc1(request,response);
		if(gubun.equals("2")) proc2(request,response);
		if(gubun.equals("3")) proc3(request,response);
		if(gubun.equals("4")) proc4(request,response);
		
	}

	private void proc4(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IZipService service = ZipServiceImpl.getInstance();
		
		Map<String, String>map = new HashMap<String, String>();
		
		try {
			BeanUtils.populate(map, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<ZipVO> list = service.selectAll(map);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
	}

	private void proc3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		IZipService service = ZipServiceImpl.getInstance();
		
		Map<String, String>map = new HashMap<String, String>();
		
		try {
			BeanUtils.populate(map, request.getParameterMap());
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<String> list = service.selectDong(map);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
		
	}

	private void proc2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IZipService service = ZipServiceImpl.getInstance();
		
		String sido = request.getParameter("sido");
		
		List<String> list = service.selectGugun(sido);
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
		
	}

	private void proc1(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException  {
		IZipService service = ZipServiceImpl.getInstance();
		
		List<String> list = service.selectSido();
		
		Gson gson = new Gson();
		
		String result = gson.toJson(list);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(result);
		out.flush();
		
	}

}
