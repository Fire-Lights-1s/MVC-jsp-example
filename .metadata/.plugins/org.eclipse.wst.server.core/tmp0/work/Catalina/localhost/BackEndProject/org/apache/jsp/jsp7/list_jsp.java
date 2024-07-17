/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.24
 * Generated at: 2024-06-26 01:41:34 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp7;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import DB_Connector.MyDB_Connector;

public final class list_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(5);
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.Timestamp");
    _jspx_imports_classes.add("DB_Connector.MyDB_Connector");
    _jspx_imports_classes.add("java.sql.PreparedStatement");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>jsp7/list.jsp</title>\r\n");
      out.write("<link rel='stylesheet' href=\"../css/table.css\">\r\n");

String id = (String) session.getAttribute("id");

System.out.println((String) session.getAttribute("id"));
if (id == null)
	id = "";

      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<h1>jsp7/list.jsp</h1>\r\n");
      out.write("	");

	String sql;
	PreparedStatement pstmt;
	ResultSet rs;
	if (id.equals("admin")) {
		MyDB_Connector mydbConn = new MyDB_Connector();
		Connection conn = mydbConn.connection();
		sql = "select id, pass, name, age, gender, email, date from members2;";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
	
      out.write("\r\n");
      out.write("	<table>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>아이디</td>\r\n");
      out.write("			<td>비밀번호</td>\r\n");
      out.write("			<td>이름</td>\r\n");
      out.write("			<td>나이</td>\r\n");
      out.write("			<td>성별</td>\r\n");
      out.write("			<td>이메일</td>\r\n");
      out.write("			<td>가입 날짜</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

		while (rs.next()) {
			String idR = rs.getString("id");
			String passR = rs.getString("pass");
			String nameR = rs.getString("name");
			int ageR = rs.getInt("age");
			String genderR = rs.getString("gender");
			String emailR = rs.getString("email");
			Timestamp dateR = rs.getTimestamp("date");
			if (genderR == null)
				genderR = "남";
		
      out.write("\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td>");
      out.print(idR);
      out.write("</td>\r\n");
      out.write("			<td>");
      out.print(passR);
      out.write("</td>\r\n");
      out.write("			<td>");
      out.print(nameR);
      out.write("</td>\r\n");
      out.write("			<td>");
      out.print(ageR);
      out.write("</td>\r\n");
      out.write("			<td>");
      out.print(genderR);
      out.write("</td>\r\n");
      out.write("			<td>");
      out.print(emailR);
      out.write("</td>\r\n");
      out.write("			<td>");
      out.print(dateR);
      out.write("</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		");

		} //while rs
		
      out.write("\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td colspan=\"7\"><a href=\"main.jsp\">메인으로 돌아가기</a></td>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("	");

	} // if admin
	
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
