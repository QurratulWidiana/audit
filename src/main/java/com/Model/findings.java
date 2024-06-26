package com.Model;

public class findings {
    private int findingsid;
    private int auditid;
    private String findingstext;

    // Constructors (default and parameterized)
    public findings() {
    }

    public findings(int findingsid, int auditid, String findingstext) {
        this.findingsid = findingsid;
        this.auditid = auditid;
        this.findingstext = findingstext;
    }

    public int getFindingsid() {
        return findingsid;
    }

    public void setFindingsid(int findingsid) {
        this.findingsid = findingsid;
    }

    public int getAuditid() {
        return auditid;
    }

    public void setAuditid(int auditid) {
        this.auditid = auditid;
    }

    public String getFindingstext() {
        return findingstext;
    }

    public void setFindingstext(String findingstext) {
        this.findingstext = findingstext;
    }

    
}