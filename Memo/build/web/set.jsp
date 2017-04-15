<%-- 
    Document   : set
    Created on : 14 Apr, 2017, 11:26:32 PM
    Author     : rajat
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%Class.forName("com.mysql.jdbc.Driver");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#ffff00">
        <%!
            public class memo
           {
            String databaseURL = "jdbc:mysql://localhost:3306/general";
            String user = "root";
            String password = "rajat";
            Connection conn =null;
            PreparedStatement inst=null;
            ResultSet res=null;

            memo()
            {
                try{
                    conn=DriverManager.getConnection(databaseURL,user,password);
                    inst=conn.prepareStatement("INSERT INTO memo(sub,content) VALUES(?,?)");
                    }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
            

             public int setMemo(String roll,String name)
            {
                int result=0;
                try{
                    inst.setString(1,roll);
                    inst.setString(2,name);
                    result=inst.executeUpdate();
                }
                catch(Exception e){
                        e.printStackTrace();
                    }
                return result;
            }

            }
            %>
        
            <%
                int result;
                String sub,text;
                if(request.getParameter("SUBMIT")!=null)
            {
             
                text=new String();
                 sub=new String();
            if(request.getParameter("sub")!=null){
            sub=request.getParameter("sub");
            }
            if(request.getParameter("cont")!=null){
            text=request.getParameter("cont");
            }
            memo add=new memo();
            result=add.setMemo(sub,text);
            }
               
               // memo a=new memo();
                //a.setMemo("tyurp","gsdfdsjfgajdgsdhghfsgdsdagkffhsdhgff");
                %>
        
        <h1>Hello World!</h1>
   <form action="set.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Sub</td>
                        <td><input type="text" name="sub" value="" /></td>
                    </tr>
                    <tr>
                        <td>Content</td>
                        <td><input type="text" name="cont" value="" /></td>
                    </tr>
                
                </tbody>
            </table>
           <input type="submit" value="SUBMIT" name="SUBMIT" />
                <input type="reset" value="RESET" name="RESET" />
            
        </form>
        <form name="retHome" action="index.jsp" method="POST">
            <input type="submit" value="BACK" name="back" />
        </form>
        
    </body>
</html>