package com.example.mixfy;

public class user {

    private String name, lastnameP, lastnameM, email, cel;
    private Boolean session=false;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastnameP() {
        return lastnameP;
    }

    public void setLastnameP(String lastnameP) {
        this.lastnameP = lastnameP;
    }

    public String getLastnameM() {
        return lastnameM;
    }

    public void setLastnameM(String lastnameM) {
        this.lastnameM = lastnameM;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCel() {
        return cel;
    }

    public void setCel(String cel) {
        this.cel = cel;
    }

    public Boolean getSession() {
        return session;
    }

    public void setSession(Boolean session) {
        this.session = session;
    }
}
