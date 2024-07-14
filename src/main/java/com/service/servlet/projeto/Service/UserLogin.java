package com.service.servlet.projeto.Service;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class UserLogin {
    private String email;
    private String password;

    //fazer a lógica
    public boolean logar(String email, String password) {
        return this.email.equals(email) && this.password.equals(password);
    }
}
