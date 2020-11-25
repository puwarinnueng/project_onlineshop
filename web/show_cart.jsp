

<%@page import="java.util.Iterator"%>
<%@page import="model.CartTable"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Cart</title>
    </head>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: aquamarine;
        }
    </style>
    <jsp:useBean id="emp" class="model.Cart" scope="request"/>
    <%

        List<Cart> empList = CartTable.findAllCart();
        Iterator<Cart> itr = empList.iterator();

    %>
    <body>
    <center>
        <h1>DVD Catalog</h1>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Rate</th>
                <th>years</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Addcart</th>
            </tr>
            <%              while (itr.hasNext()) {
                    out.println("<form name=\"Addtocard\" action=\"AddController\" method=\"POST\">");
                    emp = itr.next();
                    out.println("<tr>");
                    out.println("<td hidden><input type=\"text\" name=\"name\" value=" + emp.getId() + "></input></td>");

                    out.println("<td> " + emp.getId() + "</td>");
                    out.println("<td> " + emp.getName() + "</td>");
                    out.println("<td> " + emp.getRate() + "</td>");
                    out.println("<td> " + emp.getYears() + "</td>");
                    out.println("<td> " + emp.getPrice() + "</td>");
                    out.println("<td><input class=\"form-control\" type=\"number\" name=\"quantity\" placeholder=\"Enter Quantity\"></input></td>");
                    out.println("<td><button class=\"btn btn-secondary\" type=\"submit\" name=\"addtocart\" id=\"button\"><i class=\"fa fa-shopping-cart\" aria-hidden=\"true\"></i>AddToCart</button></td>");

                    out.println("<tr>");
                }
            %>
        </table>
        <a href="index.html">Back to Menu</a>
    </center>
</body>


</html>
