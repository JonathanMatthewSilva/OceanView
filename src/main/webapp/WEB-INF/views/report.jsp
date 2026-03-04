<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oceanview.model.Reservation" %>
<%@ include file="/WEB-INF/views/_header.jspf" %>

<%
    String from = request.getParameter("from");
    String to = request.getParameter("to");
    List<Reservation> list = (List<Reservation>) request.getAttribute("reportList");
%>

<div class="card pad" style="background:#330000; border:1px solid #990000; border-radius:12px; padding:20px; margin-bottom:20px;">
    <div class="h1" style="color:#ff9999; margin-bottom:12px;">Reservation Report</div>
    <div class="p" style="color:#ffcccc; margin-bottom:16px;">Generate report between dates.</div>

    <form method="get" action="<%= request.getContextPath() %>/report" style="margin-top:12px;">
        <div class="grid" style="display:grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap:16px;">
            <div class="field">
                <label style="color:#ffcccc; display:block; margin-bottom:4px;">From</label>
                <input class="input" type="date" name="from" value="<%= (from != null ? from : "") %>" required>
            </div>

            <div class="field">
                <label style="color:#ffcccc; display:block; margin-bottom:4px;">To</label>
                <input class="input" type="date" name="to" value="<%= (to != null ? to : "") %>" required>
            </div>

            <div class="field" style="display:flex; flex-direction:column; gap:10px; justify-content:flex-end;">
                <button class="btn btn-primary" type="submit" style="background:#990000; color:#fff;">Generate</button>
                <a class="btn" href="<%= request.getContextPath() %>/report" style="background:#660000; color:#fff; text-align:center;">Clear</a>
            </div>
        </div>
    </form>

    <div style="height:12px;"></div>

    <% if (from != null && to != null) { %>
    <div class="p" style="color:#ffcccc; margin-bottom:8px;">
        Report: <span class="badge" style="background:#990000; color:#fff;"><%= from %></span> to <span class="badge" style="background:#990000; color:#fff;"><%= to %></span>
    </div>

    <div class="table-wrap" style="overflow-x:auto; border-radius:12px; border:1px solid #990000; margin-top:12px;">
        <table style="width:100%; border-collapse:collapse; min-width:600px; background:#330000; color:#ffcccc;">
            <tr style="background:#990000; color:#fff;">
                <th>ID</th><th>Guest</th><th>Phone</th><th>Room</th>
                <th>Check-in</th><th>Check-out</th><th>Nights</th><th>Total</th>
            </tr>

            <% if (list != null && !list.isEmpty()) {
                for (Reservation r : list) { %>
            <tr>
                <td><%= r.getId() %></td>
                <td><%= r.getGuestName() %></td>
                <td><%= r.getPhone() %></td>
                <td><%= r.getRoomTypeName() %></td>
                <td><%= r.getCheckIn() %></td>
                <td><%= r.getCheckOut() %></td>
                <td><%= r.getNights() %></td>
                <td><%= r.getTotal() %></td>
            </tr>
            <% }} else { %>
            <tr><td colspan="8">No reservations found in this date range.</td></tr>
            <% } %>
        </table>
    </div>
    <% } %>
</div>

<%@ include file="/WEB-INF/views/_footer.jspf" %>