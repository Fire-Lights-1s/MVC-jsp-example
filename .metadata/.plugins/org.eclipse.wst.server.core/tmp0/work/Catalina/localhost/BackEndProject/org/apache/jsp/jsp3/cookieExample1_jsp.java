/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.24
 * Generated at: 2024-06-14 01:39:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.jsp3;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class cookieExample1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>jsp3/cookieExample1.jsp</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<h1>jsp3/cookieExample1.jsp</h1>\r\n");

// 사용자 컴퓨터에 저장된 쿠키값 가져오기
// 사용자가 cookieExample1.jsp 보고싶다 요청 => http (서버,클라이언트,태그,쿠키,세션,헤더) 들고 서버 도착 
// => 서버 request 기억장소(내장객체)에 http들고온 값 저장
String cookieValue = "";
// 1) request에 저장된 쿠키값을 가져와서 => 변수에 저장
Cookie cookies[] = request.getCookies();
// 2) 쿠키값이 없을때 접근하면 에러발생 => 쿠키값이 있을때 접근
if(cookies != null){
	// 3) 쿠키가 저장된 배열변수 접근 for  0 1 2 .. => cookies[0] cookies[1]
	for(int i = 0; i < cookies.length  ; i++){
		// 4) 배열 한칸에 있는 쿠키의 이름을 비교
			if(cookies[i].getName().equals("clang")){
				out.println("쿠키이름 : " +  cookies[i].getName()   +"<br>");
				out.println("쿠키값 : " +   cookies[i].getValue()   +"<br>");
				// 쿠키값을 변수에 저장 
				cookieValue = cookies[i].getValue();
			}
	}
}
// if(cookieValue == null){
// 	out.println("cookieValue == null");
// }
if(cookieValue.equals("")){
// 	out.println("cookieValue.equals()");
	//쿠키값이 비어있으면 => korea 로 변경
	cookieValue = "korea";	
}
if(cookieValue.equals("korea")){
	out.println("<h1>안녕하세요, 이것은 쿠키 예제입니다.</h1>");
	
}else{
	out.println("<h1>Hello, This is Cookie example.</h1>");
}

      out.write("\r\n");
      out.write("<form action=\"cookieExample2.jsp\" method=\"get\">\r\n");
      out.write("<input type=\"radio\" name=\"language\" value=\"korea\" ");
 if(cookieValue.equals("korea")){ 
      out.write(" checked ");
 } 
      out.write(">한국어 페이지 보기\r\n");
      out.write("<input type=\"radio\" name=\"language\" value=\"english\" ");
 if(cookieValue.equals("english")){ 
      out.write(" checked ");
 } 
      out.write(">영어 페이지 보기\r\n");
      out.write("<input type=\"submit\" value=\"언어설정\">\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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