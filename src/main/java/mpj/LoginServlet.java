package mpj;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String studentName = request.getParameter("txtName");
		String studentPRN = request.getParameter("txtNumber");
		String studentPassword = request.getParameter("txtPwd");
	
		
		Connection conn = null;
		PreparedStatement pst = null;
		
		
		try {
			String dbUrl = "jdbc:postgresql://ep-bitter-silence-a1242kpg-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require";
            String dbUser = "neondb_owner";
            String dbPassword = "npg_1pvsV0lZXofn";
            Class.forName("org.postgresql.Driver");

            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
            
            String sql = "INSERT INTO students (name, prn, password) VALUES (?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, studentName);
            pst.setString(2, studentPRN);
            pst.setString(3, studentPassword);
            
 int rowsAffected = pst.executeUpdate();
            
            if (rowsAffected > 0) {
                request.setAttribute("studentName", studentName);
                request.setAttribute("studentPRN", studentPRN);
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
             
                response.getWriter().println("Failed to register the student.");
            }
		}
		 catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        } finally {
	            try {
	                if (pst != null) pst.close();
	                if (conn != null) conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
		
		
	}


