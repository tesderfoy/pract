package com.example.scholl.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_ADMIN, ROLE_TEACHER;

    @Override
    public String getAuthority() {
        return name();
    }
}
