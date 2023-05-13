package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Admin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <script src=\"https://kit.fontawesome.com/f0721daea2.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">\n");
      out.write("    <link href=\"css/admin.css\" rel=\"stylesheet\">\n");
      out.write("    <title>Admin</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body class=\"row\">\n");
      out.write("    <aside class=\"col-sm-2\" id=\"content\">\n");
      out.write("        <div class=\"logo\">\n");
      out.write("            <img src=\"img/pet_shop.png\" width=\"75px\" height=\"75px\">\n");
      out.write("            <h4>PET SHOP</h4>\n");
      out.write("        </div><br>\n");
      out.write("        <img src=\"img/avatar.png\" alt=\"avatar\"><br>\n");
      out.write("        <button>Thông tin cá nhân</button>\n");
      out.write("        <ul class=\"col-sm-12\">\n");
      out.write("            <li><a href=\"Admin.jsp\" class=\"active\">Trang chủ</a></li>\n");
      out.write("            <li><a href=\"MainController?action=Account\">Quản lí tài khoản</a></li>\n");
      out.write("            <li><a href=\"#\">Quản lí Pet</a></li>\n");
      out.write("            <li><a href=\"#\">Quản lí các dòng Pet</a></li>\n");
      out.write("            <li><a href=\"#\">Quản lí đơn hàng</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <a href=\"LogoutServlet\" class=\"logout\">Đăng xuất</a>\n");
      out.write("    </aside>\n");
      out.write("    <main class=\"col-sm-10\">\n");
      out.write("        \n");
      out.write("        <article>THỐNG KÊ ĐƠN HÀNG</article>\n");
      out.write("        <div class=\"row\">\n");
      out.write("          <div class=\"col-sm-3 col-xs-12\">\n");
      out.write("            <h5>SỐ ĐƠN HÀNG TRONG NGÀY</h5>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-sm-3 col-xs-12\">\n");
      out.write("            <h5>SỐ ĐƠN HÀNG TRONG THÁNG</h5>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-sm-3 col-xs-12\">\n");
      out.write("            <h5>SỐ ĐƠN HÀNG TRONG NĂM</h5>\n");
      out.write("          </div>\n");
      out.write("    </div>\n");
      out.write("    <article>THỐNG KÊ DOANH THU</article>\n");
      out.write("    <div class=\"row\">\n");
      out.write("        <div class=\"col-sm-3 col-xs-12\">\n");
      out.write("            <h5>DOANH THU NGÀY</h5>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-sm-3 col-xs-12\">\n");
      out.write("            <h5>DOANH THU THÁNG</h5>\n");
      out.write("          </div>\n");
      out.write("          <div class=\"col-sm-3 col-xs-12\">\n");
      out.write("            <h5>DOANH THU NĂM</h5>\n");
      out.write("          </div>\n");
      out.write("    </div>\n");
      out.write("    </main>\n");
      out.write("</body>\n");
      out.write("<script>\n");
      out.write("const links = document.querySelectorAll('#content ul li a');\n");
      out.write("links.forEach(link => {\n");
      out.write("    link.addEventListener('click', (event) => {\n");
      out.write("        event.preventDefault();\n");
      out.write("        const activelink = document.querySelector('#content ul li a.active');\n");
      out.write("        if(activelink){\n");
      out.write("            activelink.classList.remove('active');\n");
      out.write("            link.classList.add('active');\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
