

<%@page import="java.util.List"%>
<%@page import="model.QuantityTable"%>
<%@page import="model.Quantity"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.Vector"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>เลือกจำนวน</title>
    </head>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: aquamarine;
        }
    </style>

    <jsp:useBean id="quantity" class="model.Quantity" scope="request"/>
    <%
        List<Quantity> quantityList = QuantityTable.findAllQuantity();
        Iterator<Quantity> itr = quantityList.iterator();
    %>
    <body>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Rate</th>
                    <th>Year</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    while (itr.hasNext()) {
                        out.println("<form name=\"CheckQuantity\" method=\"post\" action=\"CheckController\">");
                        quantity = itr.next();
                        out.println("<tr>");
                        out.println("<td hidden><input type=\"number\" name=\"id\" value=" + quantity.getId() + "></input></td>");
                        out.println("<td> " + quantity.getIdcart().getName() + "</td>");
                        out.println("<td> " + quantity.getIdcart().getRate() + "</td>");
                        out.println("<td> " + quantity.getIdcart().getYears() + "</td>");
                        out.println("<td> " + quantity.getIdcart().getPrice() + "</td>");
                        out.println("<td> " + quantity.getQuantity() + "</td>");
                        out.println("<td><button class=\"btn btn-danger\" type=\"submit\" name=\"remove\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i>Remove</button></td>");
                        out.println("</tr>");
                        out.println("</form>");
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
