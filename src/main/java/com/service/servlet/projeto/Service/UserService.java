package com.service.servlet.projeto.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserService {
    private Connection connection;
    public UserService(Connection connection) {
        this.connection = connection;
    }
    public boolean isAdmin (String userId) throws SQLException {
        String sql = "select isAdmin  FROM usuairos WHERE userId = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getBoolean("isAdmin");
                }
            }
        }
        return false;
    }
}
