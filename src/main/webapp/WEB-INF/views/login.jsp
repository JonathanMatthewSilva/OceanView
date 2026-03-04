<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Ocean View Resort - Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/style.css">
    <style>
        /* Dark red theme + new placement */
        body.auth-body {
            background: linear-gradient(160deg, #1a0f0f, #2a1212);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            padding: 0 16px;
        }

        .auth-wrap {
            display: flex;
            flex-direction: column;
            gap: 20px;
            align-items: center;
        }

        .auth-brand {
            display: flex;
            align-items: center;
            gap: 14px;
            padding: 16px 20px;
            border-radius: 16px;
            background: rgba(255, 80, 80, 0.2);
            border: 1px solid rgba(255, 80, 80, 0.5);
            backdrop-filter: blur(12px);
            box-shadow: 0 18px 55px rgba(0,0,0,0.4);
        }

        .logo {
            width: 44px;
            height: 44px;
            border-radius: 12px;
            background: linear-gradient(135deg, rgba(255,80,80,0.7), rgba(255,50,50,0.3));
            border: 1px solid rgba(255,255,255,0.15);
        }

        .auth-title {
            color: #fff;
            font-weight: 800;
            font-size: 22px;
        }

        .auth-card {
            background: rgba(255,80,80,0.12);
            border: 1px solid rgba(255,80,80,0.5);
            box-shadow: 0 15px 45px rgba(0,0,0,0.35);
            backdrop-filter: blur(12px);
            border-radius: 16px;
            padding: 24px 22px;
            transition: 0.3s ease;
            width: 100%;
            max-width: 400px;
        }

        .auth-card:hover {
            box-shadow: 0 20px 60px rgba(0,0,0,0.45);
        }

        .auth-h1 { font-size: 26px; font-weight: 800; margin-bottom: 6px; color: #fff; }
        .auth-p { font-size: 13px; color: rgba(255,200,200,0.7); margin-bottom: 14px; }

        .field label { display: block; font-size: 12px; color: rgba(255,180,180,0.8); margin-bottom: 6px; }
        .input {
            background: rgba(0,0,0,0.2);
            border: 1px solid rgba(255,80,80,0.5);
            color: #ffe0e0;
            border-radius: 12px;
        }
        .input:focus {
            border-color: #ff4a4a;
            box-shadow: 0 0 0 4px rgba(255,80,80,0.2);
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

        .alert-danger {
            border-color: #ff3030;
            background: rgba(255,80,80,0.1);
            color: #ff7b7b;
        }

        .auth-foot {
            color: rgba(255,180,180,0.7);
            margin-top: 16px;
            font-size: 12px;
            text-align: center;
        }
    </style>
</head>

<body class="auth-body">
<div class="auth-wrap">
    <div class="auth-brand">
        <div class="logo"></div>
        <div>
            <div class="auth-title">Ocean View Resort</div>
        </div>
    </div>

    <div class="card auth-card">
        <h1 class="auth-h1">Login</h1>
        <p class="auth-p">Admin / Staff Access</p>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form method="post" action="<%= request.getContextPath() %>/login" class="auth-form">
            <div class="field">
                <label>Username</label>
                <input class="input" type="text" name="username" required autocomplete="username">
            </div>

            <div class="field" style="margin-top:12px;">
                <label>Password</label>
                <input class="input" type="password" name="password" required autocomplete="current-password">
            </div>

            <div style="margin-top:16px;">
                <button class="btn btn-primary auth-btn" type="submit">Login</button>
            </div>
        </form>
    </div>

    <div class="auth-foot">© 2026 Ocean View Resort</div>
</div>
</body>
</html>