package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDao;
import model.Employee;

/**
 * Servlet implementation class EmployeeController
 */
@WebServlet("/EmployeeController")
public class EmployeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("add")) {

			try {
				Employee e = new Employee();
				e.setFname(request.getParameter("fname"));
				e.setLname(request.getParameter("lname"));
				e.setEmail(request.getParameter("email"));
				e.setMobile(request.getParameter("contact"));
				e.setAddress(request.getParameter("address"));
				e.setGender(request.getParameter("gender"));
				e.setPassword(request.getParameter("password"));
				System.out.println(e);
				EmployeeDao.addEmployee(e);
				request.setAttribute("msg", "Employee Added Successfully !");
				request.getRequestDispatcher("home.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(action.equalsIgnoreCase("edit")) {
			
			try {
				Employee e = new Employee();
				e.setId(Integer.parseInt(request.getParameter("id")));
				e.setFname(request.getParameter("fname"));
				e.setLname(request.getParameter("lname"));
				e.setEmail(request.getParameter("email"));
				e.setMobile(request.getParameter("contact"));
				e.setPassword(request.getParameter("password"));
				EmployeeDao.updateEmployee(e);
				response.sendRedirect("view-employee.jsp");
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		else if(action.equalsIgnoreCase("delete")) {
			
			try {
				Employee e = new Employee();
				EmployeeDao.deleteUser(e);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}

}
