package com.Model;

public class auditee {

    private int auditeeid;
    private String auditeename;
    private String auditeepswd;
    private String auditeeEmail;
    private String auditeemobile;

    // Constructors (default and parameterized)
    public auditee() {
    }

    public auditee(String auditeename, String auditeepswd, String auditeeEmail, String auditeemobile) {
        this.auditeename = auditeename;
        this.auditeepswd = auditeepswd;
        this.auditeeEmail = auditeeEmail;
        this.auditeemobile = auditeemobile;
    }

    public int getAuditeeid() {
        return auditeeid;
    }

    public void setAuditeeid(int auditeeid) {
        this.auditeeid = auditeeid;
    }

    public String getAuditeename() {
        return auditeename;
    }

    public void setAuditeename(String auditeename) {
        this.auditeename = auditeename;
    }

    public String getAuditeepswd() {
        return auditeepswd;
    }

    public void setAuditeepswd(String auditeepswd) {
        this.auditeepswd = auditeepswd;
    }

    public String getAuditeeEmail() {
        return auditeeEmail;
    }

    public void setAuditeeEmail(String auditeeEmail) {
        this.auditeeEmail = auditeeEmail;
    }

    public String getAuditeemobile() {
        return auditeemobile;
    }

    public void setAuditeemobile(String auditeemobile) {
        this.auditeemobile = auditeemobile;
    }

    
}
