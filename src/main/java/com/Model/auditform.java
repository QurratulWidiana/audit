package com.Model;

public class auditform {
    private String audit_type;
    private String audit_department;
    private String audit_name;
    private String start_date;
    private String end_date;
    private String auditor_name;
    private String auditor_email;
    private String auditor_id;
    private String auditee_name;
    private String auditee_department;
    private String findings;
    private int id;
    private String status;

    // Constructor without auditId and status
// Constructor without auditId and status
    public auditform(int id, String audit_type, String audit_department, String audit_name, String start_date,
                     String end_date, String auditor_name, String auditor_email, String auditor_id,
                     String auditee_name, String auditee_department, String findings) {
        // Initialize the instance variables with the provided values
        this.id = id;
        this.audit_type = audit_type;
        this.audit_department = audit_department;
        this.audit_name = audit_name;
        this.start_date = start_date;
        this.end_date = end_date;
        this.auditor_name = auditor_name;
        this.auditor_email = auditor_email;
        this.auditor_id = auditor_id;
        this.auditee_name = auditee_name;
        this.auditee_department = auditee_department;
        this.findings = findings;
    }


    // Getter methods
    public String getAudit_type() {
        return audit_type;
    }

    public String getAudit_department() {
        return audit_department;
    }

    public String getAudit_name() {
        return audit_name;
    }

    public String getStart_date() {
        return start_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public String getAuditor_name() {
        return auditor_name;
    }

    public String getAuditor_email() {
        return auditor_email;
    }

    public String getAuditor_id() {
        return auditor_id;
    }

    public String getAuditee_name() {
        return auditee_name;
    }

    public String getAuditee_department() {
        return auditee_department;
    }

    public String getFindings() {
        return findings;
    }

    public int getId() {
        return id;
    }

    public String getStatus() {
        return status;
    }

    // Setter methods
    public void setAudit_type(String audit_type) {
        this.audit_type = audit_type;
    }

    public void setAudit_department(String audit_department) {
        this.audit_department = audit_department;
    }

    public void setAudit_name(String audit_name) {
        this.audit_name = audit_name;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public void setAuditor_name(String auditor_name) {
        this.auditor_name = auditor_name;
    }

    public void setAuditor_email(String auditor_email) {
        this.auditor_email = auditor_email;
    }

    public void setAuditor_id(String auditor_id) {
        this.auditor_id = auditor_id;
    }

    public void setAuditee_name(String auditee_name) {
        this.auditee_name = auditee_name;
    }

    public void setAuditee_department(String auditee_department) {
        this.auditee_department = auditee_department;
    }

    public void setFindings(String findings) {
        this.findings = findings;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
