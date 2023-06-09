package com.sourcery.medicalservices.role.service;

import com.sourcery.medicalservices.role.model.Role;
import com.sourcery.medicalservices.role.model.UserRole;
import com.sourcery.medicalservices.role.repository.RoleRepository;
import com.sourcery.medicalservices.user.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class RoleService {
  private final UserService userService;
  private final RoleRepository roleRepository;

  public Iterable<Role> getAllRoles() {
    return roleRepository.findAll();
  }

  public ResponseEntity<String> addRoleToUser(Long userId, String roleString) {
    return userService.addRoleToUser(userId, UserRole.valueOf(roleString));
  }

  public ResponseEntity<String> removeRoleFromUser(Long userId, String roleString) {
    return userService.removeRoleFromUser(userId, UserRole.valueOf(roleString));
  }
}
