<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/_header.jspf" %>

<%
    Integer totalReservations = (Integer) request.getAttribute("totalReservations");
    Integer todayCheckins = (Integer) request.getAttribute("todayCheckins");
    Integer todayCheckouts = (Integer) request.getAttribute("todayCheckouts");
    Double totalIncome = (Double) request.getAttribute("totalIncome");

    if (totalReservations == null) totalReservations = 0;
    if (todayCheckins == null) todayCheckins = 0;
    if (todayCheckouts == null) todayCheckouts = 0;
    if (totalIncome == null) totalIncome = 0.0;

    com.oceanview.model.User u = (com.oceanview.model.User) session.getAttribute("user");
%>

<style>
    /* Dark Red Theme */
    .card.pad {
        background: rgba(255,80,80,0.12);
        border: 1px solid rgba(255,80,80,0.5);
        border-radius: 16px;
        box-shadow: 0 15px 45px rgba(0,0,0,0.35);
        backdrop-filter: blur(12px);
        padding: 20px;
        transition: 0.3s ease;
    }
    .card.pad:hover {
        box-shadow: 0 20px 60px rgba(0,0,0,0.45);
    }

    .h1 {
        font-size: 24px;
        font-weight: 800;
        margin-bottom: 8px;
        color: #fff;
    }
    .p { color: rgba(255,200,200,0.8); }

    .badge {
        background: rgba(255,50,50,0.3);
        border: 1px solid rgba(255,80,80,0.5);
        color: #fff;
        padding: 4px 10px;
        border-radius: 999px;
        font-size: 12px;
    }

    .grid {
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        gap: 16px;
    }

    .stat {
        background: rgba(255,80,80,0.1);
        border: 1px solid rgba(255,80,80,0.4);
        border-radius: 12px;
        padding: 14px;
        text-align: center;
        transition: 0.2s;
    }
    .stat:hover {
        box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        background: rgba(255,80,80,0.15);
    }
    .stat-k { font-size: 12px; color: rgba(255,180,180,0.7); }
    .stat-v { font-size: 20px; font-weight: 800; margin-top: 6px; color: #fff; }

    .actions {
        display: flex;
        flex-direction: column; /* vertical alignment */
        gap: 12px;
        margin-top: 10px;
    }

    .btn-primary {
        background: linear-gradient(135deg, rgba(255,80,80,0.7), rgba(255,50,50,0.25));
        border-color: rgba(255,80,80,0.7);
        color: #fff;
    }
    .btn-primary:hover {
        background: linear-gradient(135deg, rgba(255,100,100,0.8), rgba(255,60,60,0.3));
        border-color: rgba(255,100,100,0.8);
    }

    .btn {
        background: rgba(255,50,50,0.15);
        border: 1px solid rgba(255,80,80,0.4);
        color: #fff;
        border-radius: 12px;
        padding: 10px 14px;
        font-weight: 600;
        transition: 0.2s;
    }
    .btn:hover {
        background: rgba(255,80,80,0.25);
    }
</style>

<div class="card pad">
    <div class="h1">Welcome to Ocean View</div>
    <div class="p">Hello, <b><%= (u != null ? u.getUsername() : "User") %></b> • Role: <span class="badge">ADMIN</span></div>
</div>

<div style="height:14px;"></div>

<div class="grid">
    <div class="col-3">
        <div class="stat">
            <div class="stat-k">Total Reservations</div>
            <div class="stat-v"><%= totalReservations %></div>
        </div>
    </div>

    <div class="col-3">
        <div class="stat">
            <div class="stat-k">Today Check-ins</div>
            <div class="stat-v"><%= todayCheckins %></div>
        </div>
    </div>

    <div class="col-3">
        <div class="stat">
            <div class="stat-k">Today Check-outs</div>
            <div class="stat-v"><%= todayCheckouts %></div>
        </div>
    </div>

    <div class="col-3">
        <div class="stat">
            <div class="stat-k">Total Income</div>
            <div class="stat-v"><%= String.format("%.2f", totalIncome) %></div>
        </div>
    </div>

    <div class="col-12">
        <div class="card pad">
            <div class="h1">Quick Actions</div>
            <div class="actions">
                <a class="btn btn-primary" href="<%= request.getContextPath() %>/add-reservation">+ Add Reservation</a>
                <a class="btn" href="<%= request.getContextPath() %>/view-reservations">View Reservations</a>
                <a class="btn" href="<%= request.getContextPath() %>/search-reservation">Search Reservation</a>
                <a class="btn" href="<%= request.getContextPath() %>/report">Reservation Report</a>
                <a class="btn" href="<%= request.getContextPath() %>/help">Help</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/_footer.jspf" %>