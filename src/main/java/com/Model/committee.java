package com.model;

public class committee {

    private int committeeid;
    private String committeename;
    private String committeepswd;
    private String committeeEmail;
    private String committeemobile;

    // Constructors (default and parameterized)
    public committee() {
    }

    public committee(String committeename, String committeepswd, String committeeEmail, String committeeMobile) {
        this.committeename = committeename;
        this.committeepswd = committeepswd;
        this.committeeEmail = committeeEmail;
        this.committeemobile = committeemobile;
    }

    public int getCommitteeid() {
        return committeeid;
    }

    public void setCommitteeid(int committeeid) {
        this.committeeid = committeeid;
    }

    public String getCommitteename() {
        return committeename;
    }

    public void setCommitteename(String committeename) {
        this.committeename = committeename;
    }

    public String getCommitteepswd() {
        return committeepswd;
    }

    public void setCommitteepswd(String committeepswd) {
        this.committeepswd = committeepswd;
    }

    public String getCommitteeEmail() {
        return committeeEmail;
    }

    public void setCommitteeEmail(String committeeEmail) {
        this.committeeEmail = committeeEmail;
    }

    public String getCommitteemobile() {
        return committeemobile;
    }

    public void setCommitteemobile(String committeemobile) {
        this.committeemobile = committeemobile;
    }

}
