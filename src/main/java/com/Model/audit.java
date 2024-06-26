package com.Model;

public class audit {
    private int auditid;
    private String audittype;
    private String auditdepartment;
    private String auditname;
    private String startdate;
    private String enddate;

    // Constructors (default and parameterized)
    public audit() {
    }

    public audit(String audittype, String auditdepartment, String auditname, String startdate, String enddate) {
        this.audittype = audittype;
        this.auditdepartment = auditdepartment;
        this.auditname = auditname;
        this.startdate = startdate;
        this.enddate = enddate;
    }

    // Getters and setters go here...

    public int getAuditid() {
        return auditid;
    }

    public void setAuditid(int auditid) {
        this.auditid = auditid;
    }

    public String getAudittype() {
        return audittype;
    }

    public void setAudittype(String audittype) {
        this.audittype = audittype;
    }

    public String getAuditdepartment() {
        return auditdepartment;
    }

    public void setAuditdepartment(String auditdepartment) {
        this.auditdepartment = auditdepartment;
    }

    public String getAuditname() {
        return auditname;
    }

    public void setAuditname(String auditname) {
        this.auditname = auditname;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
}
