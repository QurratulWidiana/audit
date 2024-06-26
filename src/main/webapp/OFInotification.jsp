<%@ page import="java.util.Map" %>
<%@ page import="java.util.concurrent.ConcurrentHashMap" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>

<%
    // Assuming notifications is a shared data structure accessible by both viewAuditform.jsp and notification.jsp
    Map<String, String> notifications = (ConcurrentHashMap<String, String>) application.getAttribute("notifications");
    
    // Get the auditor ID
    String auditorId = "auditorid"; // Replace with the actual auditor ID
    
    // Retrieve and display notifications for the auditor
    Iterator<Map.Entry<String, String>> iterator = notifications.entrySet().iterator();
    while (iterator.hasNext()) {
        Map.Entry<String, String> entry = iterator.next();
        if (entry.getKey().equals(auditorId)) {
            out.println("<div><strong>Notification:</strong> " + entry.getValue() + "</div>");
            iterator.remove(); // Remove the notification after displaying
        }
    }
%>

<html>
<head>
    <title>Notifications</title>
</head>
<body>

    <h2>Notifications for Auditor</h2>

    <!-- Display notifications here -->

</body>
</html>
