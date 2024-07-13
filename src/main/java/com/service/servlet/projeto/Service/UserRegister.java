package com.service.servlet.projeto.Service;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserRegister {
    private String email;
    private String password;

    //fazer a lógica
    public boolean registrar(String email, String password) {
        return true;
    }
}
