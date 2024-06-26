package com.Model;

public class auditor {

    private int id;
    private int auditid;
    private String uname;
    private String uemail;
    private String auditorid;

    // Constructors (default and parameterized)
    public auditor() {
    }

    public auditor(int auditid, String uname, String uemail, String auditorid) {
        this.auditid = auditid;
        this.uname = uname;
        this.uemail = uemail;
        this.auditorid = auditorid;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAuditId() {
        return auditid;
    }

    public void setAuditId(int auditid) {
        this.auditid = auditid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUemail() {
        return uemail;
    }

    public void setUemail(String uemail) {
        this.uemail = uemail;
    }

    public String getAuditorId() {
        return auditorid;
    }

    public void setAuditorId(String auditorid) {
        this.auditorid = auditorid;
    }

}
