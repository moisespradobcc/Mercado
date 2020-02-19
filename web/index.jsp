<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Produto"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            <label>Descrição</label><br/>
            <input type="text" name="descricao"/><br/>
            <button type="submit">
                OK
            </button>
        </form>
        <%
            try {
                out.print("<table border = ''");
                out.print("<tr>");
                out.print("<th>Código</th><th>Descrição</th><th>Preço</th><th>Editar</th><th>Excluir</th>");
                out.print("</tr>");
                ProdutoDAO prd = new ProdutoDAO();
                if (request.getParameter("descricao") == "" || request.getParameter("descricao") == null) {
                    ArrayList<Produto> Lista = prd.ListarTodos();
                    for (int num = 0; num < Lista.size(); num++) {
                        out.print("<tr>");
                        out.print("<td>" + Lista.get(num).getCodigo_produto() + "</td>");
                        out.print("<td>" + Lista.get(num).getDescricao_produto() + "</td>");
                        out.print("<td>" + Lista.get(num).getPreco_produto() + "</td>");
                        out.print("<td><a href='alterar.jsp?codigo=" + Lista.get(num).getCodigo_produto() + "&descricao=" + Lista.get(num).getDescricao_produto() + "&preco=" + Lista.get(num).getPreco_produto() + " '>CLIQUE</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo=" + Lista.get(num).getCodigo_produto() + "&descricao=" + Lista.get(num).getDescricao_produto() + " '>CLIQUE</a></td>");
                        out.print("</tr>");
                    }
                } else {
                    ArrayList<Produto> Lista = prd.ListarTodosDescricao(request.getParameter("descricao"));
                    for (int num = 0; num < Lista.size(); num++) {
                        out.print("<tr>");
                        out.print("<td>" + Lista.get(num).getCodigo_produto() + "</td>");
                        out.print("<td>" + Lista.get(num).getDescricao_produto() + "</td>");
                        out.print("<td>" + Lista.get(num).getPreco_produto() + "</td>");
                        out.print("<td><a href='alterar.jsp?codigo=" + Lista.get(num).getCodigo_produto() + "&descricao=" + Lista.get(num).getDescricao_produto() + "&preco=" + Lista.get(num).getPreco_produto() + " '>CLIQUE</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo=" + Lista.get(num).getCodigo_produto() + "&descricao=" + Lista.get(num).getDescricao_produto() + " '>CLIQUE</a></td>");
                        out.print("</tr>");
                    }
                }
                out.print("</table>");
            } catch (Exception erro) {
                throw new RuntimeException("Erro 10: " + erro);
            }
        %>
        <a href="inserir.jsp">NOVO</a>
    </body>
</html>
