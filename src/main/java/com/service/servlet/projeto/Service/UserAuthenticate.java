package com.service.servlet.projeto.Service;

import com.service.servlet.projeto.Model.Usuarios;

import java.util.List;

public class UserAuthenticate{
    public Usuarios authenticate(Usuarios user, List<Usuarios> userList) {
        if(userList.contains(user)) {
            user = userList.get(userList.indexOf(user));
            return user;
        }
        return null;
    }
}
