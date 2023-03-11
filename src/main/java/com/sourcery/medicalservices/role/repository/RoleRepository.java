package com.sourcery.medicalservices.role.repository;

import com.sourcery.medicalservices.role.model.Role;
import com.sourcery.medicalservices.role.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
  Optional<Role> findByRole(UserRole role);
}
